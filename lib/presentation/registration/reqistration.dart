import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_effects/StoreService.dart';
import 'package:pwapp/config/di-module.dart';
import 'package:pwapp/store/state/MainState.dart';

import 'RegistrationPage.dart';

class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<MainState>(
        store: getIt<StoreService<MainState>>(), child: RegistrationPage());
  }
}
