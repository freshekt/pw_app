import 'package:flutter/material.dart';
import 'package:flutter_redux_effects/Component.dart';
import 'package:pwapp/models/LoginModel.dart';
import 'package:pwapp/store/actions/AuthActions.dart';
import 'package:pwapp/store/state/AuthState.dart';
import 'package:pwapp/store/state/MainState.dart';

class LoginComponent extends Component<MainState, AuthState> {
  LoginComponent()
      : super(view: (AuthState state, dynamic dispatch, BuildContext context) {
          final _formKey = GlobalKey<FormState>();
          final usernamectr = TextEditingController();
          final passwordctr = TextEditingController();

          if (state.isAutharized) {
            Future.delayed(Duration.zero, () {
              Navigator.of(context).pop();
            });
          }

          return Form(
              key: _formKey,
              child: Column(children: [
                TextFormField(
                    controller: usernamectr,
                    decoration:
                        InputDecoration(labelText: 'Enter your username')),
                TextFormField(
                    controller: passwordctr,
                    decoration:
                        InputDecoration(labelText: 'Enter your password'),
                    obscureText: true),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () => dispatch(AuthActions.login(LoginModel(
                        username: usernamectr.text,
                        password: passwordctr.text))),
                    child: Text('Submit'),
                  ),
                )
              ]));
        });
}
