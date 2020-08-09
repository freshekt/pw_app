import 'package:pwapp/models/WailetModel.dart';
import 'package:pwapp/shared/Action.dart';
import 'package:pwapp/shared/BaseReducer.dart';
import 'package:pwapp/store/actions/WailetActions.dart';
import 'package:pwapp/store/state/WailetsState.dart';

class WailetReducer extends BaseReducer<WailetsSate> {
  @override
  WailetsSate doAction(WailetsSate state, Action action) {
    if (action.type == WailetAction.FETCH ||
        action.type == WailetAction.FETCH_MAIN) {
      return state.clone()
        ..wailets = state.wailets
        ..mywailets = state.mywailets
        ..isInProcess = true;
    }

    if (action.type == WailetAction.RECIVED) {
      return state.clone()
        ..wailets = [
          ...action.payload,
          ...?state.wailets.where((s) =>
              (action.payload as List<WailetModel>)
                  .firstWhere((w) => s.id == w.id, orElse: () => null) ==
              null)
        ]
        ..isInProcess = false;
    }

    if (action.type == WailetAction.RECIVED_MAIN) {
      return state.clone()
        ..mywailets = action.payload
        ..isInProcess = false;
    }

    return state;
  }
}
