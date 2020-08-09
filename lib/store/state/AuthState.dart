import 'package:pwapp/config/di-module.dart';
import 'package:pwapp/models/TokenModel.dart';
import 'package:pwapp/store/state/BaseState.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as json;

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
