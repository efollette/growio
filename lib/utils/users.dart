import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import '../helper/messages.dart' as help;

final FirebaseAuth _auth = FirebaseAuth.instance;
String userEmail = "Test";

Future<FirebaseUser> createUser( String email, String password ) async {
  final FirebaseUser user = await _auth.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );

  assert( user != null );
  assert( await user.getIdToken() != null );
  userEmail = email;
  return user;
}

Future<FirebaseUser> signInUser ( String email, String password ) async {
  final FirebaseUser user = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password
  );

  assert( user != null );
  assert( await user.getIdToken() != null );

  final FirebaseUser currentUser  = await _auth.currentUser();
  assert( user.uid == currentUser.uid );
  userEmail = email;
  return user;
}

void signOutUser (BuildContext context) async {
  // Sign the user out
  await _auth.signOut().catchError((e) => help.popupAlert(context, e.message));
}