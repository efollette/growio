import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../utils/routes.dart' as routes;
import '../utils/users.dart' as users;
import 'dart:async';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

// Method to handle logging in using Google Auth API
void handleLogin(BuildContext context) async {
  await users.handleSignIn(context);
  routes.goToMyGardenScreen(context);
}

class _LoginState extends State<Login> {

  // Gradient for the login screen
  final BoxDecoration gradient = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [
          0.2,
          1
        ],
        colors: [
          Color(0xFF8BE4BB),
          Color(0xFF0A4655),
        ]),
  );

  // Login button
  Container makeLoginButton(BuildContext context) {
    final Container loginButton = Container(
      child: FlatButton(
        onPressed: () => handleLogin(context),
        padding: const EdgeInsets.only(
            left: 95.0,
            right: 95.0,
            top: 12.0,
            bottom: 12.0
        ),
        child: Text(
          "Log In",
          style: TextStyle(
            fontFamily: 'Quicksand',
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.white,
              width: 2.7,
            ),
            borderRadius: BorderRadius.circular(15.0)
        ),
      ),
    );
    return loginButton;
  }

  // Growio Text/Logo with group name
  final Image logo = Image.asset(
    "Assets/GrowioIconWhite.png",
    width: 500.0,
  );

  // Padding between top and logo
  final Padding padding1 = Padding(
    padding: const EdgeInsets.all(25.0),
  );

  // Padding between logo and button
  final Padding padding2 = Padding(
    padding: const EdgeInsets.all(40.0),
  );

  Future test(BuildContext context) {
    Future test = Future.delayed(Duration(seconds:2), () => handleLogin(context));
    return test;
  }

  @override
  void initState() {
    super.initState();
    users.googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        users.currentUser = account;
      });
      if (users.currentUser != null) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            backgroundColor: Colors.black.withOpacity(0.1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                padding1,
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
                padding1,
                Text(
                  "Loading",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: 'Fredoka One Regular'
                  ),
                ),
                padding1,
              ],
            ),
          ),
        );
        test(context);
      }
    });
    users.googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            padding1,
            logo,
            makeLoginButton(context),
            padding2,
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        // Gradient Background
        decoration: gradient,
      ),
    );
  }
}