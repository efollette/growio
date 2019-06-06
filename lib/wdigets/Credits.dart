import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final String title = "TEAM REALLY INTO PLANTS\n";
final String someText = 
"Erik Antonio Follette-Romero - Project Manager\n\n"
"Grace Augustine Carlson - Business Analystn\n\n"
"Jaikrish Chitrarasu - Senior System Analyst\n\n"
"Yash Garde - Algorithm Specialist\n\n"
"Saurabh Kanhegaonkar - Software Development Lead\n\n"
"Paridhi Khaitan - Software Architect\n\n"
"Daniela Fernandez Molina - Quality Assurance Lead\n\n"
"Noella Moraa Ogamba - User Interface Specialist\n\n"
"Sandra Maria Pekelis - User Interface Specialist\n\n"
"Priyal Rakesh Suneja - Software Architect\n\n"
"Darya A. Verzhbinsky - Database Specialist\n\n";

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

class SubPage extends StatelessWidget {
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
            fontSize: 12,
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
        Padding(padding: EdgeInsets.all(10.0)),
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

