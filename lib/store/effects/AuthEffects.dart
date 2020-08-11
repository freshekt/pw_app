import 'dart:async';

import 'package:flutter_redux_effects/Action.dart';
import 'package:flutter_redux_effects/BaseEffect.dart';
import 'package:flutter_redux_effects/Effect.dart';
import 'package:pwapp/config/di-module.dart';
import 'package:pwapp/models/TokenModel.dart';
import 'package:pwapp/services/AuthService.dart';
import 'package:pwapp/store/actions/AuthActions.dart';
import 'package:pwapp/store/state/MainState.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as json;

class AuthEffects extends BaseEffect {
  FutureOr<void> signInEffectHndler(
      Action action, Store<MainState> context) async {
    AuthService authService = getIt<AuthService>();
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    TokenModel token = await authService.login(action.payload);
    localStorage.setString("token", json.jsonEncode(token.toJson()));
    context.dispatch(AuthActions.setAuthData(token));
  }

  Effect effect() {
    return Effect({
      AuthAction.SIGN_IN: [signInEffectHndler]
    });
  }
}
