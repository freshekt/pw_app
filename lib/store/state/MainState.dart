import 'package:pwapp/store/state/AuthState.dart';
import 'package:pwapp/store/state/BaseState.dart';
import 'package:pwapp/store/state/TransactionState.dart';
import 'package:pwapp/store/state/WailetsState.dart';

class MainState extends BaseState<MainState> {
  AuthState authState;
  TransactionState transactionState;
  WailetsSate wailetsSate;
  @override
  MainState clone() {
    return MainState()
      ..authState = authState
      ..transactionState = transactionState
      ..wailetsSate = wailetsSate;
  }

  static MainState initState(dynamic params) {
    return MainState()
      ..authState = AuthState.initState(params)
      ..transactionState = TransactionState.initState(params)
      ..wailetsSate = WailetsSate.initState(params);
  }
}
