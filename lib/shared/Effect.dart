import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';

import 'Action.dart';

class Effect {
  final Map<dynamic, List<Function>> handles;

  Effect(this.handles);

  void call(Action action, Store store) {
    if (handles.containsKey(action.type))
      handles[action.type].forEach((fx) async => await fx.call(action, store));
  }
}

Effect combineEffects(List<Effect> effects) {
  Map<dynamic, List<Function>> handles = Map();

  effects.map((e) => e.handles).forEach((h) {
    h.entries.forEach((item) => {
          handles[item.key] = [...item.value, ...?handles[item.key]]
        });
  });

  return Effect(handles);
}
