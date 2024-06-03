import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auth_firebase/views/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:auth_firebase/views/auth_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? buildIOSScaffold() : buildAndroidcaffold();
  }

  Widget buildIOSScaffold() {
    return CupertinoPageScaffold(
      child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Home();
            } else {
              return const AuthScreen();
            }
          }),
    );
  }

  Widget buildAndroidcaffold() {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Home();
            } else {
              return const AuthScreen();
            }
          }),
    );
  }
}
