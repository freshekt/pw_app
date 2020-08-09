import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pwapp/shared/StoreService.dart';
import 'package:redux/redux.dart';

typedef BuildView<T> = Widget Function(
    T store, dynamic dispatch, BuildContext context);

typedef OnComponentEvent<T, State> = void Function(T state, Store<State> store);
typedef OnComponentWillChangeEvent<T, State> = void Function(
    T state, T newState, Store<State> store);

class Component<State, TState> extends StoreConnector<State, Store> {
  final BuildView<TState> view;
  final OnComponentEvent<TState, State> onInitComponent;
  final OnComponentEvent<TState, State> onComponentDispose;
  final OnComponentWillChangeEvent<TState, State> onComponentWillChange;
  final OnComponentEvent<TState, State> onComponentDidChange;
  final OnComponentEvent<TState, State> onComponentInitialBuild;
  Component(
      {this.view,
      this.onInitComponent,
      this.onComponentDispose,
      this.onComponentWillChange,
      this.onComponentDidChange,
      this.onComponentInitialBuild})
      : super(
            converter: (store) => store,
            onInit: (store) {
              TState state = getState(store);
              if (onInitComponent != null) {
                onInitComponent(state, store);
              }
            },
            onDispose: (store) {
              TState state = getState(store);
              if (onComponentDispose != null) {
                onComponentDispose(state, store);
              }
            },
            onDidChange: (store) {
              TState state = getState(store);
              if (onComponentDidChange != null) {
                onComponentDidChange(state, store);
              }
            },
            onInitialBuild: (store) {
              TState state = getState(store);
              if (onComponentInitialBuild != null) {
                onComponentInitialBuild(state, store);
              }
            },
            onWillChange: (store, newStore) {
              TState state = getState(store);
              TState newstate = getState(newStore);
              if (onComponentWillChange != null) {
                onComponentWillChange(state, newstate, store);
              }
            },
            builder: (context, store) {
              TState state = getState(store);
              return view(state, store.dispatch, context);
            });

  static TState getState<TState>(store) {
    var selector = (store as StoreService).getSelector<TState>();

    return selector == null ? store.state : selector.get(store.state);
  }
}
