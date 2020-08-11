import 'package:flutter_redux_effects/Selector.dart';
import 'package:pwapp/store/state/MainState.dart';
import 'package:pwapp/store/state/TransactionState.dart';

class TransactionSelector extends Selector<MainState, TransactionState> {
  @override
  TransactionState get(MainState state) => state.transactionState;

  @override
  MainState set(MainState main, TransactionState newState) =>
      main.clone()..transactionState = newState;
}
