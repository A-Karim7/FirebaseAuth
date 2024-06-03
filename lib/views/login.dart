import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

//Platform.isIOS
class Login extends StatefulWidget {
  final VoidCallback showSignUpScreen;
  const Login({super.key, required this.showSignUpScreen});
  @override
  _LoginState createState() => _LoginState();
}

var aSnackBar = const SnackBar(
  content: Text('Tous les champs sont vides'),
);
var bSnackBar = const SnackBar(
  content: Text('Le champ email est vide'),
);
var cSnackBar = const SnackBar(
  content: Text('Le champ mot de passe est vide '),
);

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future logIn() async {
    try {
      if (_emailController.text.isNotEmpty &
          _passwordController.text.isNotEmpty) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim());
      } else if (_emailController.text.isEmpty &
          _passwordController.text.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(bSnackBar);
      } else if (_emailController.text.isNotEmpty &
          _passwordController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(cSnackBar);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(aSnackBar);
      }
    } catch (e) {
      showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Erreur'),
              content: const SingleChildScrollView(
                child: Text(
                    'L\'e-mail et le mot de passe que vous avez saisis ne sont pas valides. Essayez de saisir un e-mail et un mot de passe valides.'),
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _emailController.clear();
                      _passwordController.clear();
                    },
                    child: const Text('Ok'))
              ],
            );
          });
    }
  }

  Widget contenuWidget(BuildContext context) {
    Widget content = SingleChildScrollView(
      padding: const EdgeInsets.only(top: 35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 270,
            height: 170,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/i1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 50,
            width: 310,
            child: TextField(
              showCursor: true,
              cursorColor: const Color.fromARGB(255, 33, 137, 165),
              controller: _emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 243, 243, 243),
                labelText: "Email",
                hintStyle: TextStyle(
                  color: const Color.fromARGB(255, 70, 70, 70).withOpacity(0.3),
                  fontSize: 15,
                ),
                hintText: "johndoe@email.com",
                labelStyle: const TextStyle(
                  color: Color.fromARGB(166, 158, 158, 158),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 156, 190, 218),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                floatingLabelStyle: const TextStyle(
                  color: Color.fromARGB(255, 56, 55, 55),
                  fontSize: 18,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white70,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 310,
            child: TextField(
              obscureText: true,
              showCursor: true,
              cursorColor: const Color.fromARGB(255, 33, 137, 165),
              controller: _passwordController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 243, 243, 243),
                labelText: "Mot de Passe",
                hintStyle: TextStyle(
                  color: const Color.fromARGB(255, 1, 7, 8).withOpacity(0.3),
                  fontSize: 15,
                ),
                hintText: "*******",
                labelStyle: const TextStyle(
                  color: Color.fromARGB(166, 158, 158, 158),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 156, 190, 218),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                floatingLabelStyle: const TextStyle(
                  color: Color.fromARGB(255, 55, 55, 56),
                  fontSize: 18,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white70,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextButton(
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 165),
                    child: Text(
                      'Mot de passe oublié ?',
                      style: TextStyle(
                        color: Color.fromARGB(255, 13, 102, 170),
                      ),
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 5,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: 50,
              width: 310,
              color: const Color.fromARGB(255, 66, 97, 153),
              child: Platform.isIOS
                  ? CupertinoButton(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      onPressed: () {
                        logIn();
                      },
                      child: const Text(
                        'Se connecter',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 33, 137, 165),
                        ),
                      ),
                    )
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 33, 137, 165),
                        padding: const EdgeInsets.symmetric(horizontal: 100),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        logIn();
                      },
                      child: const Text(
                        'Se connecter',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: widget.showSignUpScreen,
            child: const Text(
              'S\'inscrire?',
              style: TextStyle(
                color: Color.fromARGB(255, 13, 102, 170),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );

    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        /* navigationBar: CupertinoNavigationBar(
          leading: CupertinoNavigationBarBackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),*/
        child: SafeArea(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: content)),
      );
    } else {
      return Scaffold(
        /*  appBar: AppBar(
            backgroundColor: Color.fromARGB(0, 255, 255, 255),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            )),*/
        body: SafeArea(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: content)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(body: contenuWidget(context)),
    );
  }
}
