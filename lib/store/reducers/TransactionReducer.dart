import 'package:flutter_redux_effects/Action.dart';
import 'package:flutter_redux_effects/BaseReducer.dart';
import 'package:pwapp/store/actions/TransactionActions.dart';
import 'package:pwapp/store/state/TransactionState.dart';

class TransactionReducer extends BaseReducer<TransactionState> {
  @override
  TransactionState doAction(TransactionState state, Action action) {
    if (action.type == TransactionAction.NEW ||
        action.type == TransactionAction.FETCH) {
      return state.clone()
        ..transactions = state.transactions
        ..isInProcess = true;
    }

    if (action.type == TransactionAction.RECIVED) {
      return state.clone()
        ..isInProcess = false
        ..transactions = [...state.transactions, action.payload];
    }

    if (action.type == TransactionAction.RECIVED_LIST) {
      return state.clone()
        ..isInProcess = false
        ..transactions = action.payload;
    }

    if (action.type == TransactionAction.TRANSACTION_UPDATE) {
      var index =
          state.transactions.indexWhere((t) => t.id == action.payload.id);
      var transactions = state.transactions;
      if (index > -1) {
        transactions[index] = action.payload;
      } else {
        transactions = [...transactions, action.payload];
      }

      return state.clone()
        ..isInProcess = false
        ..transactions = transactions;
    }

    return state;
  }
}
