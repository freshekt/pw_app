import 'package:pwapp/shared/Action.dart';
import 'package:pwapp/shared/BaseReducer.dart';
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
        ..transactions = [action.payload, ...state.transactions];
    }

    if (action.type == TransactionAction.RECIVED_LIST) {
      return state.clone()
        ..isInProcess = false
        ..transactions = action.payload;
    }

    return state;
  }
}
