import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_example/collections/user_service.dart';
import 'package:firebase_example/constants/router.dart';
import 'package:firebase_example/models/user_data.dart';
import 'package:firebase_example/states/user.dart';
import 'package:firebase_example/widgets/google_signin_button.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void initState() { 
    super.initState();
    Future(() async {
      // from firebase core version 0.5.0
      // If the following processing does not exist,
      // an error is raised.
      await Firebase.initializeApp();

      // firebase auth
      firebaseAuth = FirebaseAuth.instance;
    });
  }
  void next(User user) {
    if (user == null) return;
    DocumentReference userRef = FirebaseFirestore.instance.collection('Users').doc(user.uid);

    if (userRef == null) Navigator.pushNamed(context, Home);
    
    userRef.get().then((value) => {
      UserData.fromJson(value.data()).displayName == null ? {
        print(value.data()),
        userRef.set({'email': user.email}),
        Navigator.pushNamed(context, SignUp)
      }: {
          Navigator.pushNamed(context, Home)
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Example'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              googleSignInButton(() {
                userService.signInWithGoogle()
                  .then((User user) => this.next(user))
                  .catchError((error) => log(error));
              })
            ]
          ),
      ),
    );
  }
}