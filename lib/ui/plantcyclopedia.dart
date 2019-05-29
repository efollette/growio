import 'package:flutter/material.dart';
import '../utils/users.dart' as users;
import '../utils/routes.dart' as routes;
import '../wdigets/plantOfTheDay.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Plantcyclopedia extends StatefulWidget {

  final bool showFab;

  Plantcyclopedia(this.showFab);

  @override
  _PlantcyclopediaState createState() => _PlantcyclopediaState();
}

class _PlantcyclopediaState extends State<Plantcyclopedia> {

  /* Text controller for the search bar */
  TextEditingController _searchController = TextEditingController();

  /* Plantcyclopedia title */
  Container _title(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * (247/375),
      child: AutoSizeText(
        "Plantcyclopedia",
        style: TextStyle(
          color: Color(0xFF8BE4BB),
          fontSize: 33,
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
        ),
        maxLines: 1,
      ),
    );
  }

  /* Search bar */
  Container _searchBar(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width - 75.0,
      height: 35.0,
      child: TextField(
        style: TextStyle(
          color: Color(0xFF278478),
        ),
        textAlign: TextAlign.left,
        textInputAction: TextInputAction.search,
        controller: _searchController,
        decoration: InputDecoration(
          hasFloatingPlaceholder: false,
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
          hintStyle: TextStyle(fontFamily: 'Quicksand',
              fontSize: 15.0, height: 0),
          labelStyle: TextStyle(fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold, fontSize: 13.0,
              color: Color(0xFF8BE4BB)
          ),
          labelText: 'Type the name of your plant here.',
        ),
        cursorColor: Colors.green,
      ),
    );
  }

  /* Plant of the day */
  Container _plantOfDay(BuildContext context) {
    return Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: plantOfTheDay(context),

    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          _title(context),
          Padding(padding: const EdgeInsets.all(10.0)),
          _searchBar(context),
          Padding(padding: const EdgeInsets.all(10.0)),
          // Plant of the Day
          widget.showFab ? _plantOfDay(context) : Container(),
          Padding(padding: const EdgeInsets.all(10.0)),
        ],
      ),
    );
  }
}


