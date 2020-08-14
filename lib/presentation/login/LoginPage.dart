import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pwapp/presentation/login/LoginComponent.dart';
import 'package:pwapp/presentation/registration/RegistrationPage.dart';

class LoginPage extends StatelessWidget {
  static final String routeName = "login";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Text('login'),
              RichText(
                  text: TextSpan(
                      text: 'registration',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                settings: RouteSettings(
                                    name: RegistrationPage.routeName),
                                builder: (context) => RegistrationPage()))))
            ])),
        body: Center(child: LoginComponent()));
  }
}
