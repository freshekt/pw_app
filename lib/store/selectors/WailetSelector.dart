import 'package:flutter_redux_effects/Selector.dart';
import 'package:pwapp/store/state/MainState.dart';
import 'package:pwapp/store/state/WailetsState.dart';

class WailetSelector extends Selector<MainState, WailetsSate> {
  @override
  WailetsSate get(MainState main) => main.wailetsSate;

  @override
  MainState set(MainState mainSate, WailetsSate newState) =>
      mainSate.clone()..wailetsSate = newState;
}
