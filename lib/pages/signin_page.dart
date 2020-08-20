import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
      
      if(firebaseAuth.currentUser != null) this.transitionNextPage(firebaseAuth.currentUser);
    });
  }

  Future<User> _handleSignIn() async {
    GoogleSignInAccount currentUser = _googleSignIn.currentUser;
    try {
      if (currentUser == null) {
        currentUser = await _googleSignIn.signIn();
      } else {
        return null;
      }

      GoogleSignInAuthentication googleAuth = await currentUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final User user = (await firebaseAuth.signInWithCredential(credential)).user;
      return user;
    } catch (error) {
      log(error);
      return null;
    }
  }

  void transitionNextPage(User user) {
    if (user == null) return;
    DocumentReference userRef = FirebaseFirestore.instance.collection('Users').doc(user.uid);

    if (userRef == null) Navigator.pushNamed(context, '/home');
    
    userRef.get().then((value) => {
      UserData.fromJson(value.data()).displayName == null ? {
        userRef.set({'email': user.email}),
        Navigator.pushNamed(context, '/signup')
      }: {
        Navigator.pushNamed(context, '/home')
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
                _handleSignIn()
                  .then((User user) => transitionNextPage(user))
                  .catchError((error) => log(error));
              })
            ]
          ),
      ),
    );
  }
}