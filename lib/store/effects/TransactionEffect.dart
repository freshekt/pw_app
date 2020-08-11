import 'dart:async';

import 'package:flutter_redux_effects/Action.dart';
import 'package:flutter_redux_effects/BaseEffect.dart';
import 'package:flutter_redux_effects/Effect.dart';
import 'package:pwapp/config/di-module.dart';
import 'package:pwapp/services/TransactionService.dart';
import 'package:pwapp/store/actions/TransactionActions.dart';
import 'package:pwapp/store/actions/WailetActions.dart';
import 'package:pwapp/store/state/MainState.dart';
import 'package:redux/redux.dart';

class TransactionEffect extends BaseEffect {
  final service = getIt<TransactionsService>();

  FutureOr<void> getTransactions(
      Action action, Store<MainState> context) async {
    var transactions = await service.getRecent();
    context.dispatch(TransactionActions.recivedList(transactions));
    if (context.state.wailetsSate.mywailets.isEmpty)
      context.dispatch(WailetActions.fetchMain());
  }

  FutureOr<void> createTransaction(
      Action action, Store<MainState> context) async {
    var transaction = await service.send(action.payload);
    context.dispatch(TransactionActions.recived(transaction));
  }

  @override
  Effect effect() {
    return Effect({
      TransactionAction.FETCH: [getTransactions],
      TransactionAction.NEW: [createTransaction]
    });
  }
}
