import 'package:flutter/material.dart';
import './utils/routes.dart' ;

void main() {
  var title = "Growio";
  runApp( new MaterialApp(
    theme: ThemeData(
      primaryColor: Color(0xFF278478),
    ),
    title: title,
    routes: routes,
  ));
}