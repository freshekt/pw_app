import 'package:flutter/material.dart';
import 'package:pwapp/config/di-module.dart';
import 'package:pwapp/presentation/login/LoginPage.dart';
import 'package:pwapp/presentation/transactions/CreateTransactionPage.dart';
import 'package:pwapp/presentation/transactions/TransactionsComponent.dart';
import 'package:pwapp/shared/StoreService.dart';
import 'package:pwapp/store/state/MainState.dart';

class MainPage extends StatelessWidget {
  final String title;
  static final String routeName = "main";
  MainPage({this.title});

  @override
  Widget build(BuildContext context) {
    var store = getIt<StoreService<MainState>>();

    if (!store.state.authState.isAutharized)
      Future.delayed(Duration.zero, () {
        Navigator.push(
            context,
            MaterialPageRoute(
                settings: RouteSettings(name: LoginPage.routeName),
                builder: (context) => LoginPage()));
      });
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: TransactionComponent(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateTransactionPage())),
          tooltip: 'Create',
          child: Icon(Icons.add),
        ));
  }
}
