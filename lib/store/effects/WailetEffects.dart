import 'package:pwapp/config/di-module.dart';
import 'package:pwapp/models/UserModel.dart';
import 'package:pwapp/services/WailetsService.dart';
import 'package:pwapp/shared/Action.dart';
import 'package:pwapp/shared/Effect.dart';
import 'package:pwapp/store/actions/AuthActions.dart';
import 'package:pwapp/store/actions/WailetActions.dart';
import 'package:pwapp/store/effects/BaseEffect.dart';
import 'package:pwapp/store/state/MainState.dart';
import 'package:redux/redux.dart';

class WailetsEffect extends BaseEffect {
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
