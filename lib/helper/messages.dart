
import 'package:flutter/material.dart';
BuildContext scaffoldContext;
/*
   * Name: _popupAlert
   * Parameters:  context - build context of the current screen that this method is being called on
   *              message - message to print to the snackBar
   * Description: displays a message on the bottom of the screen for 1 second
   * Error Conditions: Null message is passed in
   */
void popupAlert(BuildContext context, String message) {
  if (message == null) {
    debugPrint("Passed in empty message!");
    return;
  }
  SnackBar alert = SnackBar(
    content: Text(
      message,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: Colors.black38,
    duration: Duration(seconds: 3),
  );
  Scaffold.of(scaffoldContext).showSnackBar(alert);
}