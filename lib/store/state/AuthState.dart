import 'package:pwapp/models/TokenModel.dart';
import 'package:pwapp/store/state/BaseState.dart';

class AuthState extends BaseState<AuthState> {
  bool get isAutharized => token != null;

  TokenModel token;
  @override
  AuthState clone() {
    return AuthState()
      ..token = token
      ..isInProcess = isInProcess;
  }

  static AuthState initState(dynamic params) {
    return AuthState();
  }
}
