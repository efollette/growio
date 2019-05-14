import 'package:flutter/material.dart';
import '../helper/messages.dart' as help;
import '../utils/routes.dart' as routes;
import '../utils/users.dart' as users;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

Future<Post> handleLogin(temp) async {
  final response =
  await http.get('http://10.0.2.2:3000/auth/google');

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}


class _LoginState extends State<Login> {
  // Gradient for the login screen
  final BoxDecoration gradient = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [
          0.2,
          1
        ],
        colors: [
          Color(0xFF8BE4BB),
          Color(0xFF0A4655),
        ]),
  );

  // Login button
  Container makeLoginButton(BuildContext context) {
    final Container loginButton = Container(
      child: FlatButton(
        onPressed: () => handleLogin(context),
        padding: const EdgeInsets.only(
            left: 95.0,
            right: 95.0,
            top: 12.0,
            bottom: 12.0
        ),
        child: Text(
          "Log In",
          style: TextStyle(
            fontFamily: 'Quicksand',
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.white,
              width: 2.7,
            ),
            borderRadius: BorderRadius.circular(15.0)
        ),
      ),
    );
    return loginButton;
  }

  // Growio Text/Logo with group name
  final Image logo = Image.asset(
    "Assets/GrowioIconWhite.png",
    width: 500.0,
  );

  // Padding between top and logo
  final Padding padding1 = Padding(
    padding: const EdgeInsets.all(25.0),
  );

  // Padding between logo and button
  final Padding padding2 = Padding(
    padding: const EdgeInsets.all(40.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            padding1,
            logo,
            makeLoginButton(context),
            padding2,
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        // Gradient Background
        decoration: gradient,
      ),
    );
  }
}