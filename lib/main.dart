import 'package:flutter/material.dart';
import './utils/routes.dart' ;

void main() {
  var title = "Growio";
  runApp( new MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.green[900],
    ),
    title: title,
    routes: routes,
  ));
}