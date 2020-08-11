import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_effects/StoreService.dart';
import 'package:pwapp/config/di-module.dart';
import 'package:pwapp/store/state/MainState.dart';
import 'CreateTransactionComponent.dart';

class CreateTransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreProvider<MainState>(
        store: getIt<StoreService<MainState>>(),
        child: Scaffold(
            appBar: AppBar(
              title: Text('create transaction'),
            ),
            body: Center(child: CreateTransactionComponent())));
  }
}
