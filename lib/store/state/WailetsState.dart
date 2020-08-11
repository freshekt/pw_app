import 'package:flutter_redux_effects/BaseState.dart';
import 'package:pwapp/models/WailetModel.dart';

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
