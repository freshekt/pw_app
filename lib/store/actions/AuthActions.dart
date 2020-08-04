import 'package:pwapp/models/LoginModel.dart';
import 'package:pwapp/models/TokenModel.dart';
import 'package:pwapp/shared/Action.dart';

enum AuthAction { SIGN_IN, SIGN_OUT, SET_AUTH_DATA }

class AuthActions {
  static Action login(LoginModel model) =>
      Action(AuthAction.SIGN_IN, payload: model);

  static Action logout() => Action(AuthAction.SIGN_OUT);

  static Action setAuthData(TokenModel model) =>
      Action(AuthAction.SET_AUTH_DATA, payload: model);
}