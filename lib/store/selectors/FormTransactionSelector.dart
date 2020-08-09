import 'package:pwapp/shared/Selector.dart';
import 'package:pwapp/store/state/FormTransactionState.dart';
import 'package:pwapp/store/state/MainState.dart';

class FormTransactionSelector
    extends Selector<MainState, FromTransactionState> {
  @override
  FromTransactionState get(MainState main) => FromTransactionState()
    ..token = main.authState.token
    ..wailets = main.wailetsSate.wailets
    ..mywailets = main.wailetsSate.mywailets
    ..isInProcess = main.wailetsSate.isInProcess;

  @override
  MainState set(MainState mainState, newState) {
    // TODO: implement set
    throw UnimplementedError();
  }
}
