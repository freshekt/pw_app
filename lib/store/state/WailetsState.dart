import 'package:pwapp/models/WailetModel.dart';
import 'package:pwapp/store/state/BaseState.dart';

class WailetsSate extends BaseState<WailetsSate> {
  List<WailetModel> wailets;
  List<WailetModel> mywailets;
  @override
  WailetsSate clone() {
    return WailetsSate()
      ..wailets = wailets
      ..mywailets = mywailets;
  }

  static WailetsSate initState(params) {
    return WailetsSate()
      ..wailets = []
      ..mywailets = [];
  }
}
