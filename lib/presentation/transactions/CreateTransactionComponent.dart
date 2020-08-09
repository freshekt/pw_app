import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:pwapp/config/di-module.dart';
import 'package:pwapp/models/TransactrionModel.dart';
import 'package:pwapp/models/UserModel.dart';
import 'package:pwapp/models/WailetModel.dart';
import 'package:pwapp/services/UserService.dart';
import 'package:pwapp/shared/Component.dart';
import 'package:pwapp/store/actions/TransactionActions.dart';
import 'package:pwapp/store/actions/WailetActions.dart';
import 'package:pwapp/store/state/FormTransactionState.dart';
import 'package:pwapp/store/state/MainState.dart';

class CreateTransactionComponent
    extends Component<MainState, FromTransactionState> {
  static UserModel selectedUser;
  static UserService userService = getIt<UserService>();
  static var _formKey = GlobalKey<FormState>();
  static var usernamectr = TextEditingController();
  static var amountctr = TextEditingController();

  CreateTransactionComponent() : super(view: getView) {}

  static Widget getView(FromTransactionState state, dynamic dispatch, context) {
    if ((state.mywailets.isEmpty ||
            !state.mywailets.any((s) => s.userId == state.token.userId)) &&
        !state.isInProcess) dispatch(WailetActions.fetchMain());

    WailetModel from = state.wailets
        .firstWhere((w) => w.userId == state.token.userId, orElse: () => null);

    WailetModel to = state.wailets.firstWhere(
        (w) => selectedUser != null && w.userId == selectedUser.id,
        orElse: () => null);
    if (to != null) usernamectr.text = "${selectedUser.username} - ${to.name}";

    return Form(
        key: _formKey,
        child: Column(children: [
          ListTile(
            title:
                Text(from != null ? "your balance ${from.balance}" : "loading"),
          ),
          ListTile(
              title: TypeAheadFormField<UserModel>(
            textFieldConfiguration: TextFieldConfiguration(
                controller: usernamectr,
                decoration: InputDecoration(labelText: 'Enter  username')),
            itemBuilder: (BuildContext context, itemData) {
              return ListTile(
                title: Text(itemData.username),
              );
            },
            onSuggestionSelected: (user) {
              usernamectr.text = user.username;
              selectedUser = user;
              dispatch(WailetActions.fetch(user));
            },
            suggestionsCallback: (String pattern) {
              return pattern.isNotEmpty
                  ? userService.search(pattern)
                  : Future.value([]);
            },
          )),
          ListTile(
              title: TextFormField(
            controller: amountctr,
            decoration: InputDecoration(labelText: 'Enter amount'),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if (from != null && to != null) {
                  dispatch(TransactionActions.create(TransactionModel(
                      fromWailetId: from.id,
                      toWailetId: to.id,
                      status: TransactionModel.NEW,
                      amount: double.parse(amountctr.text))));
                  Navigator.of(context).pop();
                }
              },
              child: Text('Submit'),
            ),
          )
        ]));
  }
}