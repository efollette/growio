import 'package:flutter/material.dart';
import '../helper/messages.dart' as help;
import '../utils/routes.dart' as routes;
import '../utils/users.dart' as users;

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

// Method to handle logging in using Google Auth API
void handleLogin(BuildContext context) {
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
    padding: const EdgeInsets.all(45.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            padding1,
            logo,
            padding2,
            makeLoginButton(context),
          ],
        ),
        // Gradient Background
        decoration: gradient,
      ),
    );
  }
}