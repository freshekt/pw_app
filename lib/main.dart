import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pwapp/presentation/login/LoginPage.dart';
import 'package:pwapp/presentation/main/MainPage.dart';
import 'package:pwapp/shared/StoreService.dart';
import 'package:pwapp/store/state/MainState.dart';

import 'config/di-module.dart';

void main() {
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var store = getIt<StoreService<MainState>>();

    return StoreProvider<MainState>(
        store: store,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MainPage(title: 'Parrot Wings'),
          routes: {
            MainPage.routeName: (context) => MainPage(title: 'Parrot Wings'),
            LoginPage.routeName: (context) => LoginPage()
          },
        ));
  }
}
