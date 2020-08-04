import 'package:pwapp/shared/Action.dart';
import 'package:pwapp/shared/Effect.dart';
import 'package:pwapp/shared/BaseReducer.dart';
import 'package:pwapp/shared/Selector.dart';
import 'package:redux/redux.dart';

class StoreService<TState> implements Store<TState> {
  @override
  var reducer;
  Store<TState> store;
  final Effect effects;
  final List<Selector> selectors;
  final List<BaseReducer> reducers;

  StoreService(this.reducers, dynamic initState,
      {this.effects, this.selectors, List<Middleware<TState>> middlewares}) {
    store = Store<TState>(serviceReducer,
        initialState: initState,
        middleware: <Middleware<TState>>[middleware, ...?middlewares]);
    reducer = serviceReducer;
  }

  middleware(Store<TState> store, action, NextDispatcher next) {
    if (this.effects != null) {
      this.effects.call(action, store);
    }
    next(action);
  }

  Selector<TState, T> getSelector<T>() {
    if (this.selectors == null) return null;
    return this
        .selectors
        .firstWhere((selector) => selector is Selector<TState, T>);
  }

  TState serviceReducer(TState state, action) {
    for (BaseReducer reducer in this.reducers)
      state = reducer.execute(this, state, action);
    return state;
  }

  @override
  Stream<TState> get onChange => store.onChange;

  @override
  dispatch(action) {
    return store.dispatch(action);
  }

  @override
  // TODO: implement state
  TState get state => store.state;

  @override
  Future teardown() {
    return store.teardown();
  }
}
