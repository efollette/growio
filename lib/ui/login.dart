import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../helper/messages.dart' as help;
import '../utils/routes.dart' as routes;
import '../utils/users.dart' as users;

final FirebaseDatabase database = FirebaseDatabase.instance;

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  // Controller for username
  final TextEditingController _userController = new TextEditingController();
  // Controller for password
  final TextEditingController _passwordController = new TextEditingController();
  // String for incorrect login info
  final String loginFailedStr =
      "Incorrect username or password. Please try again!";


  /*
   * Name: _handleLogin
   * Parameters:  context - build context of the current widget its being called from
   * Description: Attempts to log the user in using the email and password provided
   */
  void _handleLogin(BuildContext context) {
    // If the user provided username and password
    if (_userController.text != "" && _passwordController.text != "") {
      users.signInUser( _userController.text, _passwordController.text ).then((FirebaseUser user) {
        routes.goToMyGardenScreen(context);
      }).catchError((e) => help.popupAlert(context, e.message));
    }
    // If either username or password weren't supplied
    else {
      help.popupAlert(context, loginFailedStr);
    }
  }

  /*
   * Login Page Design:
   * Logo, username and password text fields, missing password, login button, sign up
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (BuildContext context) {
        help.scaffoldContext = context;
        return Container(
          alignment: Alignment.topCenter,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
              ),
              // Growio Logo
              Image.asset(
                'Assets/plant.png',
                height: 150.0,
              ),
              Padding(
                padding: const EdgeInsets.all(33.0),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15.0, 0.0, 25.0, 0.0),
                // Login components
                child: Column(
                  children: <Widget>[
                    // Email text field
                    Container(
                      width: 325.0,
                      child: TextFormField(
                        controller: _userController,
                        decoration: InputDecoration(
                          hintText: 'you@example.com',
                          labelText: 'Enter your e-mail.',
                          icon: Icon(OMIcons.accountCircle),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(15.5)),
                    // Password text field
                    Container(
                      width: 325.0,
                      child: TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Enter your password.',
                          icon: Icon(OMIcons.lock),
                        ),
                        obscureText: true,
                      ),
                    ),
                    Padding(padding: const EdgeInsets.all(20.5)),
                    // Forgot Password Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // Forgot password text
                        Container(
                          child: InkWell(
                            onTap: () => Navigator.push(
                                context, MaterialPageRoute(builder: (context) => ForgottenPassword())),
                            child: Text(
                              "Forgot password?",
                              style: TextStyle(
                                color: Colors.black38,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: const EdgeInsets.all(20.5)),
                    //Log In Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //Log in button
                        Container(
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            padding: const EdgeInsets.only(
                                left: 75.0,
                                right: 75.0,
                                top: 10.0,
                                bottom: 10.0),
                            onPressed: () {
                              _handleLogin(context);
                            },
                            color: Colors.green[900],
                            child: Text(
                              "login",
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
                    Padding(padding: const EdgeInsets.all(35.5)),
                    // Sign in with Google/Facebook
                    // Sign Up Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //Sign Up text
                        Container(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Dont have an account? ",
                                  style: TextStyle(
                                    color: Colors.black38,
                                  ),
                                ),
                                TextSpan(
                                  text: "   Sign-up",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => routes.goToSignUpScreen(context),
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

/*
 * This class creates the forgotten password page.
 * The user will be able to type their email in to then have an
 * email sent to them so that they might reset it.
 */
class ForgottenPassword extends StatefulWidget {
  @override
  _ForgottenPasswordState createState() => _ForgottenPasswordState();
}

class _ForgottenPasswordState extends State<ForgottenPassword> {

  TextEditingController _emailController = TextEditingController();

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
                    // full name text field
                    Container(
                      width: 325.0,
                      child: TextFormField(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //Log in button
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
                              if ( _emailController.text != "" || _emailController.text != null ) {
                                routes.goToLoginScreen(context);
                              }
                              else {
                                help.popupAlert(context, "You have not entered an email! Please enter one and try again.");
                              }
                            },
                            color: Colors.green,
                            child: Text(
                              "Reset Password",
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
