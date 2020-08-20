import 'package:firebase_example/pages/home_page.dart';
import 'package:firebase_example/pages/signin_page.dart';
import 'package:firebase_example/pages/signup_page.dart';
import 'package:flutter/material.dart';

const Home = '/home';
const SignUp = '/sign_up';
const SignIn = ',sign_in';

final routers = <String, WidgetBuilder> {
  Home: (BuildContext context) => HomePage(),
  SignUp: (BuildContext context) => SignUpPage(),
  SignIn: (BuildContext context) => SignInPage(),
};