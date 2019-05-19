import 'package:flutter/material.dart';
import '../ui/Login.dart';
import '../ui/myGarden.dart';
import '../ui/plantcyclopedia.dart';
import '../ui/mainPage.dart';

final routes = {
  '/login' : (BuildContext context) => Login(),
  '/myGarden' : (BuildContext context) => MyGarden(),
  '/plantcyclopedia' : (BuildContext context) => Plantcyclopedia(true),

  // Default route
  '/' : (BuildContext context) => MainPage(),
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
