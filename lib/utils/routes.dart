import 'package:flutter/material.dart';
import '../ui/Login.dart';
import '../ui/myGarden.dart';
import '../ui/signUp.dart';

final routes = {
  '/login' : (BuildContext context) => new Login(),
  '/home' : (BuildContext context) => new MyGarden(),
  '/signUp' : (BuildContext context) => new SignUp(),

  // Default route
  '/' : (BuildContext context) => new MyGarden(),
};

/*
   * Name: goToSignUpScreen
   * Parameters:  context - build context of the current widget its being called from
   * Description: Sends user to sign up screen.
   */
void goToSignUpScreen(BuildContext context) {
  Navigator.pushNamed(context, '/signUp');
}

/*
   * Name: goToHomeScreen
   * Parameters:  context - build context of the current widget its being called from
   * Description: Sends user to home screen.
   */
void goToHomeScreen(BuildContext context) {
  Navigator.pushReplacementNamed(context, '/home');
}

/*
   * Name: goToLoginScreen
   * Parameters:  context - build context of the current widget its being called from
   * Description: Sends user to login screen.
   */
void goToLoginScreen(BuildContext context) {
  Navigator.pushNamed(context, '/login');
}

