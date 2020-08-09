import 'package:pwapp/shared/Action.dart';
import 'package:pwapp/shared/StoreService.dart';

abstract class BaseReducer<S> {
  dynamic execute(StoreService service, dynamic state, Action action) {
    var selector = service.getSelector<S>();
    if (selector != null) {
      var cur_state = selector.get(state);
      var newState = doAction(cur_state, action);
      return selector.set(state, newState);
    }
    return doAction(state, action);
  }

  S doAction(S state, Action action);
}
