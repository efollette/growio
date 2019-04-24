import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:flutter/gestures.dart';
import '../utils/routes.dart' as routes;
import '../utils/users.dart' as users;
import '../helper/messages.dart' as help;
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseDatabase database = FirebaseDatabase.instance;
Future<FirebaseUser> _currentUser;

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // Controller for email
  final TextEditingController _emailController = TextEditingController();
  // Controller for password
  final TextEditingController _passwordController = TextEditingController();
  // Controller for password reentry
  final TextEditingController _repasswordController = TextEditingController();
  // String to display password mismatch
  final String _mismatch =
      "Your password and confirmation password do not match, please try again.";
  final String _invalidEmail =
      "The email you have entered is not valid, please try again.";
  final String _invalidPassword =
      "The password you have entered is not valid, please try again.";
  final String _invalidPasswordLength =
      "Your password needs to be at least 6 characters long. Please try again.";
  final int _minPassLen = 6;

  /*
   * Name: _goToHomeScreen
   * Parameters:  context - build context of the current widget its being called from
   * Description: Will eventually handle account verification, at the moment,
   *              only checks if a username and password has been provided. If so
   *              then the function will take the user to the home page of the app.
   *              Otherwise, it prompts the user for their information again.
   */
  void _goToHomeScreen(BuildContext context) {
    // If no field is filled out
    if (_emailController.text == "" &&
        _passwordController.text == "" &&
        _repasswordController.text == "") {
      help.popupAlert(context, "C'mon yo, really??");
    }
    // If either the email wasn't provided
    else if (_emailController.text == "") {
      help.popupAlert(context, _invalidEmail);
    } else if ((_passwordController.text == "" ||
        _repasswordController.text == "")) {
      help.popupAlert(context, _invalidPassword);
    } else if (_passwordController.text.length < _minPassLen ||
        _repasswordController.text.length < _minPassLen) {
      help.popupAlert(context, _invalidPasswordLength);
    } else if (_passwordController.text != _repasswordController.text) {
      help.popupAlert(context, _mismatch);
    }
    // If the user provided a valid email and passwords match
    else {
      // Try to create a new user
      _currentUser = users
          .createUser(_emailController.text, _passwordController.text)
          .then((FirebaseUser user) {
        routes.goToHomeScreen(context);
      }).catchError((e) => help.popupAlert(context, e.message));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (BuildContext context) {
        help.scaffoldContext = context;
        return Container(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15.0),
              ),
              // NextUp Logo
              Image.asset(
                'Assets/plant.png',
                height: 150.0,
              ),
              Padding(
                padding: EdgeInsets.all(33.0),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15.0, 0.0, 25.0, 0.0),
                // Login components
                child: Column(
                  children: <Widget>[
                    // email text field
                    Container(
                      width: 325.0,
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'you@example.com',
                          labelText: 'E-mail Address',
                          icon: Icon(OMIcons.email),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(15.5)),
                    // Password text field
                    Container(
                      width: 325.0,
                      child: TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Enter your password',
                          icon: Icon(OMIcons.lock),
                        ),
                        obscureText: true,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(15.5)),
                    // Reenter password field
                    Container(
                      width: 325.0,
                      child: TextField(
                        controller: _repasswordController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Reenter your password.',
                          icon: Icon(OMIcons.lock),
                        ),
                        obscureText: true,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(15.5)),
                    //Log In Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //Sign up button
                        Container(
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            padding: EdgeInsets.only(
                                left: 75.0,
                                right: 75.0,
                                top: 10.0,
                                bottom: 10.0),
                            onPressed: () {
                              _goToHomeScreen(context);
                            },
                            color: Colors.green,
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(20.5)),
                    // Sign In Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //Sign Up text
                        Container(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Already have an account? ",
                                  style: TextStyle(
                                    color: Colors.black38,
                                  ),
                                ),
                                TextSpan(
                                  text: "   Sign-in",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap =
                                        () => routes.goToLoginScreen(context),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Gradient Background
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.9],
              colors: [
                Color(0xFFE6FFE6),
                Colors.green,
              ],
            ),
          ),
        );
      }),
    );
  }
}

