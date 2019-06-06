import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final String title = "Contact Us!\n";
final String someText =
  "growio@plants.com\n\n"
;

Container _exitButton(BuildContext context){
  return Container(
    child: FlatButton(
      onPressed:() => Navigator.pop(context),
      child: Icon(
        Icons.close,
        color: Colors.white,
      ),
    ),
  );
}

class SupPage extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.black,
    body: Center(
      child: Column( 
        children: <Widget> [
          Padding(padding: EdgeInsets.all(50.0)),
          Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontFamily: 'Quicksand',
            ),
        ),
        Text(
          someText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontFamily: 'Quicksand',
            ),
        ),
        Text(
          "Thank You!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontFamily: 'Quicksand',
            ),
        ),
         Padding(padding: EdgeInsets.all(130.0)),
         Text(
          "CSE 110 - Spring 2019",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontFamily: 'Quicksand',
            ),
        ),
        Padding(padding: EdgeInsets.all(5.0)),
        _exitButton(context),
        ],
    ),
    ),
  );
}
}