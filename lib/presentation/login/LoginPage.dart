import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pwapp/config/di-module.dart';
import 'package:pwapp/presentation/login/LoginComponent.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('login'),
        ),
        body: Center(child: LoginComponent()));
  }
}
