import 'dart:async';

import 'package:pwapp/config/di-module.dart';
import 'package:pwapp/models/TokenModel.dart';
import 'package:pwapp/services/AuthService.dart';
import 'package:pwapp/shared/Action.dart';
import 'package:pwapp/shared/Effect.dart';
import 'package:pwapp/store/actions/AuthActions.dart';
import 'package:pwapp/store/state/MainState.dart';
import 'package:redux/redux.dart';

class AuthEffects {
  FutureOr<void> signInEffectHndler(
      Action action, Store<MainState> context) async {
    AuthService authService = getIt<AuthService>();
    TokenModel token = await authService.login(action.payload);
    context.dispatch(AuthActions.setAuthData(token));
  }

  Effect<MainState> effect() {
    return Effect({
      AuthAction.SIGN_IN: [signInEffectHndler]
    });
  }
}
