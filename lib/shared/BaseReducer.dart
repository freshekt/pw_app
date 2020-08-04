import 'package:pwapp/shared/Action.dart';
import 'package:pwapp/shared/StoreService.dart';

abstract class BaseReducer<S> {
  dynamic execute(StoreService service, dynamic state, Action action) {
    var selector = service.getSelector<S>();
    if (selector != null) {
      var state = selector.get(service.store.state);
      var newState = doAction(state, action);
      return selector.set(service.store.state, newState);
    }
    return doAction(service.store.state, action);
  }

  S doAction(S state, Action action);
}
