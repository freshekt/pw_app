import 'dart:async';

import 'package:flutter_redux_effects/Action.dart';
import 'package:flutter_redux_effects/BaseEffect.dart';
import 'package:flutter_redux_effects/Effect.dart';
import 'package:pwapp/config/di-module.dart';
import 'package:pwapp/models/LoginModel.dart';
import 'package:pwapp/models/RegistrationModel.dart';
import 'package:pwapp/models/TokenModel.dart';
import 'package:pwapp/services/AuthService.dart';
import 'package:pwapp/services/WSService.dart';
import 'package:pwapp/store/actions/AuthActions.dart';
import 'package:pwapp/store/state/MainState.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as json;

class AuthEffects extends BaseEffect {
  WSService ws = getIt<WSService>();
  AuthService authService = getIt<AuthService>();

  FutureOr<void> signInEffectHndler(
      Action action, Store<MainState> context) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    authService.login(action.payload).then((TokenModel token) {
      localStorage.setString("token", json.jsonEncode(token.toJson()));
      context.dispatch(AuthActions.setAuthData(token));
      ws.connect(token);
    }).catchError((err) {
      context.dispatch(AuthActions.loginFailed(err));
    });
  }

  FutureOr<void> signUpEffectHndler(
      Action action, Store<MainState> context) async {
    authService
        .registration(action.payload.username, action.payload.password)
        .then((resp) => context.dispatch(AuthActions.login(LoginModel(
            username: action.payload.username,
            password: action.payload.password))))
        .catchError((err) {
      context.dispatch(AuthActions.registrationFailed(err));
    });
  }

  Effect effect() {
    return Effect({
      AuthAction.SIGN_IN: [signInEffectHndler],
      AuthAction.REGISTRATION: [signUpEffectHndler]
    });
  }
}
