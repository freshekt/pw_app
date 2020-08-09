import 'dart:async';

import 'package:pwapp/config/di-module.dart';
import 'package:pwapp/services/TransactionService.dart';
import 'package:pwapp/shared/Action.dart';
import 'package:pwapp/shared/Effect.dart';
import 'package:pwapp/store/actions/TransactionActions.dart';
import 'package:pwapp/store/actions/WailetActions.dart';
import 'package:pwapp/store/effects/BaseEffect.dart';
import 'package:pwapp/store/state/MainState.dart';
import 'package:redux/redux.dart';

class TransactionEffect extends BaseEffect {
  final service = getIt<TransactionsService>();

  FutureOr<void> getTransactions(
      Action action, Store<MainState> context) async {
    var transactions = await service.getRecent();
    context.dispatch(TransactionActions.recivedList(transactions));
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
