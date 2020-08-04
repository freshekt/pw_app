import 'package:pwapp/store/state/AuthState.dart';
import 'package:pwapp/store/state/BaseState.dart';

class MainState extends BaseState<MainState> {
  AuthState authState;

  @override
  MainState clone() {
    return MainState()..authState = authState;
  }

  static MainState initState(dynamic params) {
    return MainState()..authState = AuthState();
  }
}
