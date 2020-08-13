import 'package:flutter_redux_effects/Action.dart';
import 'package:flutter_redux_effects/BaseReducer.dart';
import 'package:pwapp/store/actions/AuthActions.dart';
import 'package:pwapp/store/state/AuthState.dart';

class AuthReducer extends BaseReducer<AuthState> {
  @override
  AuthState doAction(AuthState state, Action action) {
    if (action.type == AuthAction.SET_AUTH_DATA) {
      return state.clone()
        ..token = action.payload
        ..error = null
        ..isInProcess = false;
    }

    if (action.type == AuthAction.SIGN_IN ||
        action.type == AuthAction.SIGN_OUT) {
      return state.clone()
        ..token = null
        ..isInProcess = true;
    }

    if (action.type == AuthAction.SIGN_IN_FAILED) {
      return state.clone()
        ..token = null
        ..error = action.payload
        ..isInProcess = true;
    }

    return state;
  }
}
