import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';

import 'Action.dart';

class Effect<T> {
  final Map<dynamic, List<Function>> handles;

  Effect(this.handles);

  void call(Action action, Store<T> store) {
    if (handles.containsKey(action.type))
      handles[action.type].forEach((fx) async => await fx.call(action, store));
  }
}

Effect combineEffects(List<Effect> effects) {
  Map<dynamic, List<Function>> handles = Map();
  effects.map((e) => e.handles.keys).toSet().toList().forEach((key) {
    effects.where((e) => e.handles.containsKey(key)).forEach((eff) {
      handles[key] = [...?handles[key], ...eff.handles[key]];
    });
  });
  return Effect(handles);
}
