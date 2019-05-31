import 'package:Growio/wdigets/myGardenTile.dart';
import '../utils/users.dart' as users;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

Map _data = {};

Future<void> fetchPlants() async {
  Map waiting = await users.getGarden(users.apiToken);
  _data = waiting;
}

class MyGarden extends StatefulWidget {
  @override
  _MyGardenState createState() => _MyGardenState();
}

class _MyGardenState extends State<MyGarden> {

  @override
  void initState() {
    super.initState();
    fetchPlants();
  }

  @override
  Widget build(BuildContext context) {
    /* Plantcyclopedia title */
    Container _title(BuildContext context) {
      return Container(
        color: Colors.white,
        alignment: Alignment.topCenter,
        width: MediaQuery.of(context).size.width * (247 / 375),
        child: AutoSizeText(
          "MyGarden",
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          _title(context),
          Padding(padding: const EdgeInsets.all(10.0)),
          Expanded(
            child: GridView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: _data.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (BuildContext context, int position) {
                return myGardenTile(context, position, "Plant Name", "Scientific Name");
              },
            ),
          ),
        ],
      ),
    );
  }
}
