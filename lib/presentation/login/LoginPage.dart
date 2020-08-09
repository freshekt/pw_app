import 'package:flutter/material.dart';
import 'package:pwapp/presentation/login/LoginComponent.dart';

class LoginPage extends StatelessWidget {
  static final String routeName = "login";
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
