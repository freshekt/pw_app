import 'package:flutter/material.dart';
import 'package:flutter_redux_effects/Component.dart';
import 'package:pwapp/store/state/MainState.dart';
import 'package:pwapp/store/state/WailetsState.dart';

class BarComponent extends Component<MainState, WailetsSate> {
  final String title;
  BarComponent(this.title)
      : super(
            view: (WailetsSate state, dynamic dispatch, BuildContext context) {
          return Text(state.mywailets.isEmpty
              ? title
              : "$title - ${state.mywailets.first.balance}");
        });
}
