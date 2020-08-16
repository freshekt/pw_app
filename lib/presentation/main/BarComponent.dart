import 'package:flutter/material.dart';
import 'package:flutter_redux_effects/Component.dart';
import 'package:pwapp/models/UserModel.dart';
import 'package:pwapp/store/state/FormTransactionState.dart';
import 'package:pwapp/store/state/MainState.dart';

class BarComponent extends Component<MainState, FromTransactionState> {
  final String title;
  BarComponent(this.title)
      : super(view: (FromTransactionState state, dynamic dispatch,
            BuildContext context) {
          UserModel user = state.isAutharized
              ? UserModel.fromToken(state.token.accessToken)
              : null;
          final username = user != null ? user.username : "";
          final balance = state.mywailets.isNotEmpty
              ? state.mywailets.first.balance.toStringAsFixed(2)
              : 0;
          return Text(state.mywailets.isEmpty
              ? title
              : "$title :  $username - $balance");
        });
}
