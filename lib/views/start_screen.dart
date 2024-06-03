import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auth_firebase/views/main_page.dart';
import 'package:auth_firebase/widgets/material_button.dart';
import 'package:auth_firebase/widgets/cupertino_button.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  String _fontFamily = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _setFontFamily();
  }

  Future<void> _setFontFamily() async {
    String fontFamily = '';
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      fontFamily = 'San-Francisco-Font';
    } else {
      fontFamily = 'Roboto-Regular';
    }
    setState(() {
      _fontFamily = fontFamily;
    });
  }

  Widget contenuWidget(BuildContext context) {
    Widget content = SingleChildScrollView(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Container(
            width: 300,
            height: 250,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/i4.jpeg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 20),
          !Platform.isIOS
              ? Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: RichText(
                    text: TextSpan(
                      text: 'Bienvenue à bord !\n',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 59, 105, 145),
                        fontSize: 30,
                        height: 2.2,
                        fontFamily: _fontFamily,
                        decoration: TextDecoration.none,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'Prêt à commencer votre aventure,\nAppuyez sur \'Get Started\' pour démarrer',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 59, 105, 145),
                            fontSize: 14,
                            height: 1.0,
                            fontFamily: _fontFamily,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Bienvenue à bord !\nPrêt à commencer votre aventure,\nAppuyez sur \'Get Started\' pour démarrer',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 59, 105, 145),
                      fontSize: 20,
                      height: 1.5,
                      fontFamily: _fontFamily,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
          const SizedBox(height: 20),
          Platform.isIOS
              ? CupertinoStyledButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => (const MainScreen())));
                  },
                  text: 'Get Started',
                  icon: Icons.arrow_forward,
                )
              : MaterialStyledButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (const MainScreen())));
                  },
                  text: 'Get Started',
                  icon: Icons.arrow_forward,
                ),
          const SizedBox(height: 35),
        ],
      ),
    );

    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: content,
          ),
        ),
      );
    } else {
      return Scaffold(
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: content,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return contenuWidget(context);
  }
}
