import 'dart:async';
import 'package:flutter/material.dart';
import '../helper/messages.dart' as help;
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert' as json;

GoogleSignIn googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
  ],
);

GoogleSignInAccount currentUser;

String userEmail = "";

String userName = "";

String token = "";

GoogleUserCircleAvatar userPic;

Future<void> handleSignIn(BuildContext context) async {
  try {
    await googleSignIn.signIn().then((result){
      result.authentication.then((googleKey){
        currentUser = googleSignIn.currentUser;
        token = googleKey.idToken;
        userName = currentUser.displayName;
        userEmail = currentUser.email;
        userPic = GoogleUserCircleAvatar(identity: currentUser);
      }).catchError((err){
        help.popupAlert(context, err);
      });
    }).catchError((err){
      help.popupAlert(context, err);
    });
  } catch (error) {
    help.popupAlert(context, error);
  }
}

Future<void> handleSignOut() async {
  googleSignIn.disconnect();
}