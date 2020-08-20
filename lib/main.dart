import 'package:firebase_example/pages/home_page.dart';
import 'package:firebase_example/pages/signin_page.dart';
import 'package:firebase_example/pages/signup_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter x Firebase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute:  '/signin',
      routes: <String, WidgetBuilder> {
      '/signin': (BuildContext context) => SignInPage(),
      '/signup': (BuildContext context) => SignUpPage(),
      '/home': (BuildContext context) => HomePage(),

    },
    );
  }
}
