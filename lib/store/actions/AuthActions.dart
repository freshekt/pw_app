import 'package:flutter_redux_effects/Action.dart';
import 'package:pwapp/models/LoginModel.dart';
import 'package:pwapp/models/TokenModel.dart';

enum AuthAction { SIGN_IN, SIGN_IN_FAILED, SIGN_OUT, SET_AUTH_DATA }

class AuthActions {
  static Action login(LoginModel model) =>
      Action(AuthAction.SIGN_IN, payload: model);

  static Action loginFailed(ex) =>
      Action(AuthAction.SIGN_IN_FAILED, payload: ex);

  static Action logout() => Action(AuthAction.SIGN_OUT);

  static Action setAuthData(TokenModel model) =>
      Action(AuthAction.SET_AUTH_DATA, payload: model);
}
