import 'package:flutter/material.dart';
import '../wdigets/plantOfTheDay.dart';
import '../wdigets/plantTile.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../model/plantWeek_model.dart';
import '../model/plantcyclopediaPlant_model.dart';
import '../api/weekPlant_api.dart' as weekPlant;
import '../api/searchPlant_api.dart' as searchPlant;
import 'package:fluttertoast/fluttertoast.dart';

class Plantcyclopedia extends StatefulWidget {
  final bool showFab;

  Plantcyclopedia(this.showFab);

  @override
  _PlantcyclopediaState createState() => _PlantcyclopediaState();
}

class _PlantcyclopediaState extends State<Plantcyclopedia> {
  Future<PlantWeek> _plantWeek;

  // Declare a var that stores the searched plant after api call
  PlantcycPlant _plantSearchResult;

  @override
  void initState() {
    super.initState();
    _plantWeek = weekPlant.getPlantOfTheWeek();
    _plantSearchResult = null;
  }

  // User's search after they've pressed enter
  String plantSearch = '';
  String plantType = 'commonName';

  bool showList = false;

  /* button to exit searching mechanism */
  Container _returnButton(BuildContext context) {
    return Container(
        child: OutlineButton(
      borderSide: BorderSide(
        color: Color(0xFF278478),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200.0)),
      splashColor: Color(0xFF278478),
      onPressed: () {
        setState(() {
          showList = false;
        });
      },
      child: Column(
        children: <Widget>[
          Container(
            child: Icon(
              Icons.close,
              color: Color(0xFF278478),
            ),
          ),
        ],
      ),
    ));
  }

  ListView _plantList(BuildContext context, PlantcycPlant searchedPlant) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Column(
          children: <Widget>[
            ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: plantTile(
                          context,
                          searchedPlant.commonName,
                          searchedPlant.scientificName,
                          searchedPlant.plantImage),
                    ),
                  );
                }),
            widget.showFab ? _returnButton(context) : Container(),
          ],
        )
      ],
    );
  }

  /* Text controller for the search bar */
  TextEditingController _searchController = TextEditingController();

  /* Plantcyclopedia title */
  Container _title(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * (247 / 375),
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
        style: TextStyle(color: Color(0xFF278478), fontFamily: 'Quicksand'),
        enableInteractiveSelection: true,
        maxLines: 1,
        autocorrect: true,
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
            hintStyle:
                TextStyle(fontFamily: 'Quicksand', fontSize: 15.0, height: 0),
            labelStyle: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 13.0,
                color: Color(0xFF8BE4BB)),
            labelText: 'Type the name of your plant here.',
            prefixIcon: Icon(
              Icons.search,
              color: Color(0xFF278478),
            )),
        cursorColor: Colors.green,
        // Functionality of search
        onSubmitted: (text) async {
          plantSearch = text;
          setState(() {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Material(
                    type: MaterialType.transparency,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xFF8BE4BB)),
                      ),
                    ),
                  );
                });
          });
          PlantcycPlant responsePlant =
              await searchPlant.searchByName(plantSearch, plantType);
          setState(() {
            Navigator.pop(context);
            if (responsePlant.commonName != null) {
              _plantSearchResult = responsePlant;
              showList = true;
            } else
              Fluttertoast.showToast(
                msg: "There was no plant found with the name $plantSearch.",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIos: 1,
                backgroundColor: Color(0xFF278478),
                textColor: Color(0xFF8BE4BB),
                fontSize: 16.0,
              );
          });
        },
      ),
    );
  }

  int _radioValue = 0;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          plantType = "commonName";
          break;
        case 1:
          plantType = "sciName";
          break;
      }
    });
  }

  /* buttons to control searching */
  Container _nameSearchChoice(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Radio(
          value: 0,
          groupValue: _radioValue,
          onChanged: _handleRadioValueChange,
          activeColor: Color(0xFF278478),
        ),
        Text("Common Name"),
        Radio(
          value: 1,
          groupValue: _radioValue,
          onChanged: _handleRadioValueChange,
          activeColor: Color(0xFF278478),
        ),
        Text("Scientific Name"),
      ],
    ));
  }

  /* Plant of the day */
  Container _plantOfDay(BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: plantOfTheDay(context, snapshot),
    );
  }

  @override
  Widget build(BuildContext context) {
    //print('plantSearch: ' + plantSearch);
    return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder<PlantWeek>(
            future: _plantWeek,
            builder: (context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xFF8BE4BB)),
                    ),
                  );
                default:
                  if (snapshot.hasError)
                    return Center(
                      child: AutoSizeText(
                        "Sorry, there was an error loading the Plant of the Day :(",
                        style: TextStyle(
                          fontFamily: "Quicksand",
                          color: Color(0xFF8BE4BB),
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  else
                    return Column(
                      children: <Widget>[
                        _title(context),
                        Padding(padding: const EdgeInsets.all(5.0)),
                        _nameSearchChoice(context),
                        Padding(padding: const EdgeInsets.all(3.0)),
                        _searchBar(context),
                        Padding(padding: const EdgeInsets.all(10.0)),
                        // Plant of the Day
                        showList
                            ? _plantList(context, _plantSearchResult)
                            : widget.showFab
                                ? _plantOfDay(context, snapshot)
                                : Container(),

                        Padding(padding: const EdgeInsets.all(10.0)),
                      ],
                    );
              }
            }));
  }
}
