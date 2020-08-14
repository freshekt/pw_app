import 'package:flutter/material.dart';
import 'package:pwapp/presentation/registration/RegistrationComponent.dart';

import 'RegistrationComponent.dart';

class RegistrationPage extends StatelessWidget {
  static final String routeName = "Registration";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Registration'),
        ),
        body: Center(child: RegistrationComponent()));
  }
}
