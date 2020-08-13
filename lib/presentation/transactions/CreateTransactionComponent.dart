import 'package:flutter/material.dart';
import 'package:flutter_redux_effects/Component.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:pwapp/config/di-module.dart';
import 'package:pwapp/models/TransactrionModel.dart';
import 'package:pwapp/models/UserModel.dart';
import 'package:pwapp/models/WailetModel.dart';
import 'package:pwapp/services/UserService.dart';
import 'package:pwapp/store/actions/TransactionActions.dart';
import 'package:pwapp/store/actions/WailetActions.dart';
import 'package:pwapp/store/state/FormTransactionState.dart';
import 'package:pwapp/store/state/MainState.dart';

class CreateTransactionComponent
    extends Component<MainState, FromTransactionState> {
  static UserModel selectedUser;
  static UserService userService = getIt<UserService>();

  CreateTransactionComponent() : super(view: getView, onInitComponent: init) {}

  static init(FromTransactionState state, store) {
    if (state.mywailets.isEmpty) store.dispatch(WailetActions.fetchMain());
  }

  static Widget getView(FromTransactionState state, dynamic dispatch, context) {
    final usernamectr = TextEditingController();
    final amountctr = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    WailetModel from =
        state.mywailets.isNotEmpty ? state.mywailets.first : null;

    WailetModel to = state.wailets.firstWhere(
        (w) => selectedUser != null && w.userId == selectedUser.id,
        orElse: () => null);

    if (to != null && !usernamectr.text.startsWith(selectedUser.username))
      usernamectr.text = "${selectedUser.username} - ${to.name}";

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
              selectedUser = user;
              dispatch(WailetActions.fetch(user));
            },
            suggestionsCallback: (String pattern) async {
              if (pattern.isEmpty) {
                selectedUser = null;
                to = null;
                return [];
              } else
                return (await userService.search(pattern))
                    .where((u) => u.id != state.token.userId);
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
                  selectedUser = null;
                  to = null;
                  Navigator.of(context).pop();
                }
              },
              child: Text('Submit'),
            ),
          )
        ]));
  }
}
