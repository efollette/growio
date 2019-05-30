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

String userEmail = "Test";

String token = "";

Future<void> handleSignIn() async {
  try {
    await googleSignIn.signIn().then((result){
      result.authentication.then((googleKey){
        print(googleKey.accessToken);
        print(googleKey.idToken);
        print(googleSignIn.currentUser.displayName);
      }).catchError((err){
        print('inner error');
      });
    }).catchError((err){
      print('error occured');
    });
  } catch (error) {
    print(error);
  }
}

Future<void> handleSignOut() async {
  googleSignIn.disconnect();
}