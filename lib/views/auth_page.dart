import 'package:flutter/material.dart';
import 'package:auth_firebase/views/login.dart';
import 'package:auth_firebase/views/signup.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool showLogInPage = true;

  void toggleScreen() {
    setState(() {
      showLogInPage = !showLogInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogInPage) {
      return Login(showSignUpScreen: toggleScreen);
    } else {
      return SignUp(showLoginScreen: toggleScreen);
    }
  }
}
