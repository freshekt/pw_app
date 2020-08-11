import 'package:flutter_redux_effects/BaseState.dart';
import 'package:pwapp/models/TokenModel.dart';

class AuthState extends BaseState<AuthState> {
  bool get isAutharized => token != null;

  TokenModel token;
  @override
  AuthState clone() {
    return AuthState()
      ..token = token
      ..isInProcess = isInProcess;
  }

  static AuthState initState(dynamic localstorage) {
    // var tokenStr = localstorage.getString("token");
    // var token = tokenStr != null && tokenStr.isNotEmpty
    //     ? TokenModel.fromJson(json.jsonDecode(tokenStr))
    //     : null;
    return AuthState()..token = null;
  }
}
