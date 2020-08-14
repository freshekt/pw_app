import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux_effects/Component.dart';
import 'package:pwapp/store/actions/TransactionActions.dart';
import 'package:pwapp/store/state/MainState.dart';
import 'package:pwapp/store/state/TransactionWailetsState.dart';
import 'package:redux/redux.dart';

class TransactionComponent
    extends Component<MainState, TransactionWailetsState> {
  TransactionComponent() : super(view: getView, onComponentDidChange: init);
  static bool isRequested = false;
  static init(TransactionWailetsState state, Store<MainState> store) {
    if (state.isAutharized && !isRequested) {
      // if (state.mywailets.isEmpty)
      //   Future.delayed(Duration.zero, () {
      //     store.dispatch(WailetActions.fetchMain());
      //   });

      const oneSec = const Duration(seconds: 2);
      Future.delayed(oneSec, () {
        store.dispatch(TransactionActions.getAll());
      });
      isRequested = true;
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
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  color:
                      (index % 2 == 0) ? Colors.white : Colors.lightBlueAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(DateFormat('dd/MM – kk:mm').format(e.date)),
                      Text(e.correspondentName.toString()),
                      Text((state.mywailets.any((w) => w.id == e.fromWailetId)
                              ? "-"
                              : "+") +
                          e.amount.toString()),
                      Text(state.mywailets.any((w) => w.id == e.fromWailetId)
                          ? e.fromBalance.toStringAsFixed(2)
                          : e.toBalance.toStringAsFixed(2)),
                    ],
                  ));
            }));
  }
}
