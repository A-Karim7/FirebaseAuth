import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  final VoidCallback showLoginScreen;
  const SignUp({super.key, required this.showLoginScreen});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  var aSnackBar = const SnackBar(
    content: Text('Les mots de passe ne correspondent pas'),
  );
  var bSnackBar = const SnackBar(
    content: Text('Les champs mots de passe sont vides'),
  );
  var cSnackBar = const SnackBar(
    content: Text('Le champ de confirmation de votre mot de passe est vide'),
  );
  var dSnackBar = const SnackBar(
    content: Text('Le champ de votre mot de passe est vide'),
  );
  var eSnackBar = const SnackBar(
    content: Text(
        'Les champs email et confirmation de votre mot de passe sont vides'),
  );
  var fSnackBar = const SnackBar(
    content: Text('Les champs email est vide'),
  );
  var gSnackBar = const SnackBar(
    content: Text('Les champs email et mot de passe sont vides'),
  );
  var xSnackBar = const SnackBar(
    content: Text('Tous les champs sont vides'),
  );
  Future signUpp() async {
    if (_emailController.text.isNotEmpty &
        _passwordController.text.isNotEmpty &
        _confirmPasswordController.text.isNotEmpty) {
      if (confirm()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(aSnackBar);
      }
    } else if (_emailController.text.isNotEmpty &
        _passwordController.text.isEmpty &
        _confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(bSnackBar);
    } else if (_emailController.text.isNotEmpty &
        _passwordController.text.isNotEmpty &
        _confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(cSnackBar);
    } else if (_emailController.text.isNotEmpty &
        _passwordController.text.isEmpty &
        _confirmPasswordController.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(dSnackBar);
    } else if (_emailController.text.isEmpty &
        _passwordController.text.isNotEmpty &
        _confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(eSnackBar);
    } else if (_emailController.text.isEmpty &
        _passwordController.text.isNotEmpty &
        _confirmPasswordController.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(fSnackBar);
    } else if (_emailController.text.isEmpty &
        _passwordController.text.isEmpty &
        _confirmPasswordController.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(gSnackBar);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(xSnackBar);
    }
  }

  bool confirm() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
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
            height: 20,
          ),
          Container(
            height: 50,
            width: 310,
            child: TextField(
              obscureText: true,
              showCursor: true,
              cursorColor: const Color.fromARGB(255, 33, 137, 165),
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 243, 243, 243),
                labelText: "Confirmer Mot de Passe",
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
            height: 20,
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
                      color: const Color.fromARGB(255, 33, 137, 165),
                      onPressed: () {
                        signUpp();
                      },
                      child: const Text(
                        'S\'inscrire',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 255, 255, 255),
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
                        signUpp();
                      },
                      child: const Text(
                        'S\'inscrire',
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
          RichText(
            text: TextSpan(
              text: 'Vous avez déja un compte? ',
              style: const TextStyle(
                color: Color.fromARGB(255, 28, 28, 29),
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Se connecter',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 13, 102, 170),
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = widget.showLoginScreen,
                ),
              ],
            ),
            textAlign: TextAlign.center,
          )
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
