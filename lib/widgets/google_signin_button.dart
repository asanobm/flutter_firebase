import 'package:flutter/material.dart';

import 'auth_service_google.dart';

Widget googleSignInButton (Function onPressed) {
  return RaisedButton(
    padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        getGoogleAuthIcon(),
        Container(
          margin: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
          child: Text('Sign in with Google'),
        )
    ],),
    onPressed: () => onPressed(),
  );
}