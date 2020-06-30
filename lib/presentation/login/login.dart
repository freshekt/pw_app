import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class Login extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('login'),
      ),
      body: Center(child: Column(children:[
        TextFormField(),
        TextFormField(),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
               
              },
              child: Text('Submit'),
            ),
          )
      ])),
    );
  }

}