import 'package:flutter/material.dart';
import 'package:pwapp/shared/Component.dart';
import 'package:pwapp/store/actions/TransactionActions.dart';
import 'package:pwapp/store/state/MainState.dart';
import 'package:pwapp/store/state/TransactionWailetsState.dart';
import 'package:redux/redux.dart';

class TransactionComponent
    extends Component<MainState, TransactionWailetsState> {
  TransactionComponent() : super(view: getView, onInitComponent: init);

  static init(TransactionWailetsState state, Store<MainState> store) {
    if (state.isAutharized) store.dispatch(TransactionActions.getAll());
  }

  static Widget getView(
      TransactionWailetsState state, dynamic dispatch, context) {
    List<Widget> rows = state.transactions.isNotEmpty
        ? state.transactions.map((e) => Row(
              children: <Widget>[
                Text(e.amount.toString()),
                Text(e.status.toString()),
                Text(state.mywailets.any((w) => w.id == e.fromWailetId)
                    ? 'OUT'
                    : 'IN'),
              ],
            ))
        : [Text("No Transaction")].toList();
    return Center(child: Column(children: rows));
  }
}
