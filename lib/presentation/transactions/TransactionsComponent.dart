import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux_effects/Component.dart';
import 'package:pwapp/store/actions/TransactionActions.dart';
import 'package:pwapp/store/actions/WailetActions.dart';
import 'package:pwapp/store/state/MainState.dart';
import 'package:pwapp/store/state/TransactionWailetsState.dart';
import 'package:redux/redux.dart';

class TransactionComponent
    extends Component<MainState, TransactionWailetsState> {
  TransactionComponent() : super(view: getView, onComponentDidChange: init);
  static Timer timer;
  static init(TransactionWailetsState state, Store<MainState> store) {
    if (state.isAutharized && timer == null) {
      // if (state.mywailets.isEmpty)
      //   Future.delayed(Duration.zero, () {
      //     store.dispatch(WailetActions.fetchMain());
      //   });

      const oneSec = const Duration(seconds: 5);
      timer = new Timer.periodic(oneSec, (Timer t) {
        store.dispatch(TransactionActions.getAll());
      });
    }
  }

  static Widget getView(
      TransactionWailetsState state, dynamic dispatch, context) {
    return Center(
        child: ListView.builder(
            itemCount: state.transactions.length,
            itemBuilder: (BuildContext context, int index) {
              var e = state.transactions.elementAt(index);
              return Container(
                  color:
                      (index % 2 == 0) ? Colors.white : Colors.lightBlueAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(e.amount.toString()),
                      Text(e.status.toString()),
                      Text(state.mywailets.any((w) => w.id == e.fromWailetId)
                          ? 'OUT'
                          : 'IN'),
                    ],
                  ));
            }));
  }
}
