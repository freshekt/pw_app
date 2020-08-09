import 'package:pwapp/models/UserModel.dart';
import 'package:pwapp/models/WailetModel.dart';
import 'package:pwapp/shared/Action.dart';

enum WailetAction { FETCH, RECIVED, FETCH_MAIN, RECIVED_MAIN }

class WailetActions {
  static fetch(UserModel user) => Action(WailetAction.FETCH, payload: user);
  static recived(List<WailetModel> wailets) =>
      Action(WailetAction.RECIVED, payload: wailets);
  static fetchMain() => Action(WailetAction.FETCH_MAIN);
  static recivedMain(List<WailetModel> wailets) =>
      Action(WailetAction.RECIVED, payload: wailets);
}
