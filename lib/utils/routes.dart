import 'package:flutter/material.dart';
import '../ui/Login.dart';
import '../ui/myGarden.dart';
import '../ui/signUp.dart';
import '../ui/plantcyclopedia.dart';

int currentIndex = 0;

final routes = {
  '/login' : (BuildContext context) => new Login(),
  '/myGarden' : (BuildContext context) => new MyGarden(),
  '/signUp' : (BuildContext context) => new SignUp(),
  '/plantcyclopedia' : (BuildContext context) => new Plantcyclopedia(),

  // Default route
  '/' : (BuildContext context) => new Plantcyclopedia(),
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
   * Description: Sends user to MyGarden screen.
   */
void goToMyGardenScreen(BuildContext context) {
  Navigator.popAndPushNamed(context, '/myGarden');
}

/*
   * Name: goToLoginScreen
   * Parameters:  context - build context of the current widget its being called from
   * Description: Sends user to login screen.
   */
void goToLoginScreen(BuildContext context) {
  Navigator.pushNamed(context, '/login');
}

/*
   * Name: goToPlantcyclopediaScreen
   * Parameters:  context - build context of the current widget its being called from
   * Description: Sends user to Plantcyclopedia screen.
   */
void goToPlantcyclopediaScreen(BuildContext context) {
  Navigator.popAndPushNamed(context, '/plantcyclopedia');
}
