import 'package:flutter/material.dart';
import '../ui/Login.dart';
import '../ui/plantcyclopedia.dart';
import '../ui/mainPage.dart';
import '../ui/Camera.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool> makeToast ( String msg) {
return Fluttertoast.showToast(
  msg: "$msg",
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.CENTER,
  timeInSecForIos: 1,
  backgroundColor: Color(0xFF278478),
  textColor: Color(0xFF8BE4BB),
  fontSize: 16.0,
);
}

var routes = {
  '/login': (BuildContext context) => Login(),
  '/myGarden': (BuildContext context) => MainPage(),
  '/plantcyclopedia': (BuildContext context) => Plantcyclopedia(true),
  '/camera': (BuildContext context) => Camera(),

  // Default route
  '/': (BuildContext context) => Login(),
};

/*
   * Name: goToHomeScreen
   * Parameters:  context - build context of the current widget its being called from
   * Description: Sends user to MyGarden screen.
   */
void goToMyGardenScreen(BuildContext context) {
  Navigator.of(context)
      .pushNamedAndRemoveUntil('/myGarden', (Route<dynamic> route) => false);
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
