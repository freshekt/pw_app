import 'package:pwapp/shared/Selector.dart';
import 'package:pwapp/store/state/MainState.dart';
import 'package:pwapp/store/state/TransactionWailetsState.dart';

class TransactionWailetsSelector
    extends Selector<MainState, TransactionWailetsState> {
  @override
  TransactionWailetsState get(MainState main) => TransactionWailetsState()
    ..token = main.authState.token
    ..wailets = main.wailetsSate.wailets
    ..mywailets = main.wailetsSate.mywailets
    ..isInProcess = main.transactionState.isInProcess
    ..transactions = main.transactionState.transactions;

  @override
  MainState set(MainState mainState, newState) {
    // TODO: implement set
    throw UnimplementedError();
  }
}
