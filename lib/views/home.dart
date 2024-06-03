import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? buildIOSScaffold() : buildAndroidcaffold();
  }

  Widget buildIOSScaffold() {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Home')),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: Text(
              "Welcome Dude",
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          CupertinoButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: const Text("Log out"))
        ],
      ),
    );
  }

  Widget buildAndroidcaffold() {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: Text(
                "Welcome Dude",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: const Text("Se déconnecter"))
          ],
        ));
  }
}
