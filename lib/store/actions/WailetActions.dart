import 'package:flutter_redux_effects/Action.dart';
import 'package:pwapp/models/UserModel.dart';
import 'package:pwapp/models/WailetModel.dart';

enum WailetAction { FETCH, RECIVED, FETCH_MAIN, RECIVED_MAIN, WAILET_UPDATE }

class WailetActions {
  static fetch(UserModel user) => Action(WailetAction.FETCH, payload: user);
  static recived(List<WailetModel> wailets) =>
      Action(WailetAction.RECIVED, payload: wailets);
  static fetchMain() => Action(WailetAction.FETCH_MAIN);
  static recivedMain(List<WailetModel> wailets) =>
      Action(WailetAction.RECIVED_MAIN, payload: wailets);
  static wailetUpdate(WailetModel model) =>
      Action(WailetAction.WAILET_UPDATE, payload: model);
}
