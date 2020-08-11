import 'package:flutter_redux_effects/Selector.dart';
import 'package:pwapp/store/state/AuthState.dart';
import 'package:pwapp/store/state/MainState.dart';

class AuthSelector extends Selector<MainState, AuthState> {
  @override
  AuthState get(MainState state) => state.authState;

  @override
  MainState set(MainState main, AuthState newState) =>
      main.clone()..authState = newState;
}
