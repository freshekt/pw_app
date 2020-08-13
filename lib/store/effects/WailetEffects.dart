import 'package:flutter_redux_effects/Action.dart';
import 'package:flutter_redux_effects/BaseEffect.dart';
import 'package:flutter_redux_effects/Effect.dart';
import 'package:pwapp/config/di-module.dart';
import 'package:pwapp/models/UserModel.dart';
import 'package:pwapp/models/WailetModel.dart';
import 'package:pwapp/services/WSService.dart';
import 'package:pwapp/services/WailetsService.dart';
import 'package:pwapp/store/actions/AuthActions.dart';
import 'package:pwapp/store/actions/WailetActions.dart';
import 'package:pwapp/store/state/MainState.dart';
import 'package:redux/redux.dart';

class WailetsEffect extends BaseEffect {
  WSService ws = getIt<WSService>();

  Future fetchWailets(
      Action<WailetAction, UserModel> action, Store<MainState> context) async {
    var service = getIt<WailetsService>();
    var wailets = await service.getUserWailets(action.payload.id);
    context.dispatch(WailetActions.recived(wailets));
  }

  Future fetchMainWailets(Action action, Store<MainState> context) async {
    var service = getIt<WailetsService>();
    if (context.state.authState.isAutharized ||
        action.type == AuthAction.SET_AUTH_DATA) {
      var userId = action.type == AuthAction.SET_AUTH_DATA
          ? action.payload.userId
          : context.state.authState.token.userId;
      var wailets = await service.getUserWailets(userId);
      context.dispatch(WailetActions.recivedMain(wailets));

      ws.on('update_my_wailet', (wailet) {
        context
            .dispatch(WailetActions.wailetUpdate(WailetModel.fromJson(wailet)));
      });
    }
  }

  @override
  Effect effect() {
    return Effect({
      WailetAction.FETCH: [fetchWailets],
      WailetAction.FETCH_MAIN: [fetchMainWailets]
    });
  }
}
