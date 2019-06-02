import 'package:flutter/material.dart';
import '../ui/Login.dart';
import '../utils/users.dart' as users;
import '../ui/plantcyclopedia.dart';
import '../ui/mainPage.dart';
import '../ui/Camera.dart';

var routes = {
  '/login' : (BuildContext context) => Login(),
  '/myGarden' : (BuildContext context) => MainPage(),
  '/plantcyclopedia' : (BuildContext context) => Plantcyclopedia(true),
  '/camera' :(BuildContext context) => Camera(),

  // Default route
  '/' : (BuildContext context) => Login(),
};

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

void goToLoginFromLogout(BuildContext context) {
  Navigator.of(context)
      .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
}
