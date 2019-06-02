import 'dart:async';
import 'package:flutter/material.dart';
import '../helper/messages.dart' as help;
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert' as json;
import 'package:http/http.dart' as http;
import '../utils/constants.dart' as constant;

GoogleSignIn googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
  ],
);

// Current user
GoogleSignInAccount currentUser;

// User's email
String userEmail = "";

// User's name
String userName = "";

// Token to ping the api
String apiToken = "";

// Token for access to our servers
String accessToken = "";

// User's profile pic
GoogleUserCircleAvatar userPic;

// Url for our own api
//String apiUrl = "https://growio-prod-test.herokuapp.com";

// Data from the api
Map data;

/*
 * Name: getAPIToken
 * Parameters: accessToken - User's unique access token to be able to access our server
 * Description: Gets the user's auth data from our server in JSON format
 */
Future<Map> getAPIToken(String accessToken) async {
  String authApiUrl = constant.apiUrl + "/auth/google?code=";
  authApiUrl += accessToken;
  http.Response response = await http.get(authApiUrl);
  return json.jsonDecode(response.body);
}

/*
 * Name: getGarden
 * Parameters: apiToken - User's unique api token to be able to access their garden
 * Description: Gets the user's garden data from our server in JSON format
 */
//Future<Map> getGarden(String apiToken) async {
//  apiUrl += "/garden/plants?token=";
//  apiUrl += apiToken;
//  http.Response response = await http.get(apiUrl);
//  return json.jsonDecode(response.body);
//}

Future<void> handleSignIn(BuildContext context) async {
  try {
    var result = await googleSignIn.signIn();
    var googleKey = await result.authentication;
    currentUser = googleSignIn.currentUser;
    accessToken = googleKey.accessToken;
    debugPrint(accessToken);
    userName = currentUser.displayName;
    userEmail = currentUser.email;
    userPic = GoogleUserCircleAvatar(identity: currentUser);
    if( accessToken != "" ) {
      data = await getAPIToken(accessToken);
    }
    apiToken = data['token'];
    debugPrint(apiToken);
  } catch (error) {
    debugPrint(error.toString());
  }
}

Future<void> handleSignOut() async {
  userEmail = "";
  userName = "";
  userPic = null;
  apiToken = "";
  accessToken = "";
  currentUser = null;
  googleSignIn.signOut();
}
