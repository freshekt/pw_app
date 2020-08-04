import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pwapp/shared/StoreService.dart';
import 'package:redux/redux.dart';

typedef BuildView<T> = Widget Function(T store, dynamic dispatch);

class Component<State, TState> extends StoreConnector<State, Store> {
  final BuildView<TState> view;

  Component({this.view})
      : super(
            converter: (store) => store,
            builder: (context, store) {
              TState state = (store as StoreService<State>)
                  .getSelector<TState>()
                  .get(store.state);
              return view(state, store.dispatch);
            });
}
