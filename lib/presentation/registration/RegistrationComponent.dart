import 'package:flutter/material.dart';
import 'package:flutter_redux_effects/Component.dart';
import 'package:pwapp/models/RegistrationModel.dart';
import 'package:pwapp/store/actions/AuthActions.dart';
import 'package:pwapp/store/state/AuthState.dart';
import 'package:pwapp/store/state/MainState.dart';

class RegistrationComponent extends Component<MainState, AuthState> {
  RegistrationComponent()
      : super(view: (AuthState state, dynamic dispatch, BuildContext context) {
          final _formKey = GlobalKey<FormState>();
          final usernamectr = TextEditingController();
          final passwordctr = TextEditingController();
          final passwordconfirmctr = TextEditingController();

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
                TextFormField(
                    controller: passwordconfirmctr,
                    decoration:
                        InputDecoration(labelText: 'Confirm your password'),
                    obscureText: true),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: RaisedButton(
                      onPressed: () {
                        if (passwordctr.text == passwordconfirmctr.text) {
                          dispatch(AuthActions.registration(RegistrationModel(
                              username: usernamectr.text,
                              password: passwordctr.text)));
                        } else
                          dispatch(AuthActions.registrationFailed(
                              Exception("passwords are not equals")));
                      },
                      child: Text('Submit'),
                    )),
                Container(
                    child: Text(
                        state.error != null ? state.error.toString() : "",
                        style: TextStyle(color: Colors.red)))
              ]));
        });
}
