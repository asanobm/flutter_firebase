import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_example/main.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {

  HomePage({Key key, user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final User user = firebaseAuth.currentUser;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _handleSignOut() async {
    await FirebaseAuth.instance.signOut();
    try {
      await _googleSignIn.signOut();
    } catch (e) {
      print(e);
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        title: Text("Main Page"),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(this.user.photoURL),
              Text(this.user.displayName,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Text(this.user.email,
                style: TextStyle(
                  fontSize: 24,
                ),
               ),
              RaisedButton(
                child: Text('Sign out'),
                onPressed: () {
                   _handleSignOut().catchError((e) => print(e));
                },
              ),
            ]),
        ),
      );
  }
}