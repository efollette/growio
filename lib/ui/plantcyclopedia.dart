import 'package:flutter/material.dart';
import '../utils/users.dart' as users;
import '../utils/routes.dart' as routes;
import '../wdigets/plantOfTheDay.dart';

class Plantcyclopedia extends StatefulWidget {

  final bool showFab;

  // Constructor for plantcyclopedia
  Plantcyclopedia(this.showFab);

  @override
  _PlantcyclopediaState createState() => _PlantcyclopediaState();
}

class _PlantcyclopediaState extends State<Plantcyclopedia> {

  // Text controller for the search bar
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          // Title
          Container(
            color: Colors.white,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width - 50.0,
            child: Text(
                "Plantcyclopedia",
              style: TextStyle(
                color: Color(0xFF8BE4BB),
                fontSize: 33,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.all(10.0)),
          // Search bar
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width - 75.0,
            height: 35.0,
            child: TextFormField(
              style: TextStyle(
                color: Color(0xFF8BE4BB),
              ),
              textAlign: TextAlign.center,
              textInputAction: TextInputAction.search,
              controller: _searchController,
              decoration: InputDecoration(
                hasFloatingPlaceholder: false,
                contentPadding: const EdgeInsets.only(left: 20.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Color(0x388BE4BB),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0x388BE4BB),
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                filled: true,
                fillColor: Color(0xFFDFFFF0),
                hintText: 'e.x. Daisy',
                labelText: 'Type the name of your plant here.',

              ),
            ),
          ),
          Padding(padding: const EdgeInsets.all(10.0)),
          // Plant of the Day
          widget.showFab ? Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.only(top: 10.0),
              width: MediaQuery.of(context).size.width - 75.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                color: Color(0xFFDFFFF0),
              ),
              child: plantOfTheDay(context),
            )
          ) : Container(),
        ],
      ),

    );
  }
}


