import 'package:flutter/material.dart';
import '../utils/users.dart' as users;
import '../utils/routes.dart' as routes;
import '../wdigets/plantOfTheDay.dart';

class Plantcyclopedia extends StatefulWidget {

  final bool showFab;

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
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width - 50.0,
            child: Text(
                "Plantcyclopedia",
              style: TextStyle(
                color: Color(0xFF8BE4BB),
                fontSize: 33,
                fontFamily: 'Quicksand',
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.all(10.0)),
          Container(
            width: MediaQuery.of(context).size.width - 50.0,
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
                fillColor: Color(0x388BE4BB),
                hintText: 'e.x. Daisy',
                labelText: 'Search for plants!',
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.all(10.0)),
          widget.showFab ? plantOfTheDay(context) : Container(),
        ],
      ),

    );
  }
}


