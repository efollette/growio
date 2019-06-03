import 'package:flutter/material.dart';
import '../utils/users.dart' as users;
import '../ui/mainPage.dart' as mp;
import '../wdigets/plantOfTheDay.dart';
import '../wdigets/plantList.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../model/plantWeek_model.dart';
import '../api/weekPlant_api.dart' as weekPlant;

class Plantcyclopedia extends StatefulWidget {
  final bool showFab;

  Plantcyclopedia(this.showFab);

  @override
  _PlantcyclopediaState createState() => _PlantcyclopediaState();
}

class _PlantcyclopediaState extends State<Plantcyclopedia> {
  Future<PlantWeek> _plantWeek;

  @override
  void initState() {
    this._plantWeek = weekPlant.getPlantOfTheWeek();
  }

  bool showList = false;

  /* Plant list */
  final List<String> _plants = [
    'Daisy',
    'Sunflower',
    'Poppy',
    'Lavender',
    'Rose',
    'Tiger Lily',
    'Carnation',
    'Tulip',
    'Orchid',
    'Peonie'
  ];

  /* Duplicate to store the plant list */
  final List<String> _plantsDup = [
    'Daisy',
    'Sunflower',
    'Poppy',
    'Lavender',
    'Rose',
    'Tiger Lily',
    'Carnation',
    'Tulip',
    'Orchid',
    'Peonie'
  ];

  /* List that will change based on the query */
  var _plantsQuery = List<String>();

  Expanded _plantList(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: _plantsQuery.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  child: ListTile(
                      title: Text('${_plantsQuery[index]}',
                          style: TextStyle(fontFamily: 'Quicksand'))));
            }));
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
        textCapitalization: TextCapitalization.sentences,
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
        onChanged: (value) {
          showList = true;
          _filterSearchResults(value);
        },
      ),
    );
  }

  /* Plant of the day */
  Container _plantOfDay(BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: plantOfTheDay(context, snapshot),
    );
  }

  /* Function to search and list the new items */
  void _filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(_plantsDup);
    if (query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        _plantsQuery.clear();
        _plantsQuery.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        _plantsQuery.clear();
        _plantsQuery.addAll(_plantsDup);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: new FutureBuilder<PlantWeek>(
            future: this._plantWeek,
            builder: (context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                default:
                  if (snapshot.hasError)
                    return Text('Error: ${snapshot}');
                  else
                    return Column(
                      children: <Widget>[
                        _title(context),
                        Padding(padding: const EdgeInsets.all(10.0)),
                        _searchBar(context),
                        Padding(padding: const EdgeInsets.all(20.0)),
                        // Plant of the Day
                        widget.showFab
                            ? _plantOfDay(context, snapshot)
                            : Container(),
                        Padding(padding: const EdgeInsets.all(10.0)),
                      ],
                    );
              }
            }));
  }
}
