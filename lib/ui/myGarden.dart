import 'package:Growio/wdigets/myGardenTile.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../api/garden_api.dart' as garden;
import '../model/plant_model.dart';

class MyGarden extends StatefulWidget {
  @override
  _MyGardenState createState() => _MyGardenState();
}

class _MyGardenState extends State<MyGarden> {
  Future<List<Plant>> _plants;

  @override
  void initState() {
    this._plants = garden.getAllPlants();
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
        body: FutureBuilder<List<Plant>>(
            future: this._plants,
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
                        "Sorry, there was an error loading your plants :(",
                        style: TextStyle(
                          fontFamily: "Quicksand",
                          color: Color(0xFF8BE4BB),
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  else
                    return (snapshot.data.length == 0)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    _title(context),
                                    Expanded(child: Container()),
                                    AutoSizeText(
                                      "Your garden is empty :(",
                                      style: TextStyle(
                                        color: Color(0xFF8BE4BB),
                                        fontSize: 20,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Image.asset(
                                      "Assets/lilPlantDude.png",
                                      height: 100,
                                    ),
                                    AutoSizeText(
                                      "Add plants to \n your garden to \n see them here!",
                                      style: TextStyle(
                                        color: Color(0xFF8BE4BB),
                                        fontSize: 20,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Expanded(child: Container()),
                                  ])
                            ],
                          )
                        : Column(
                            children: <Widget>[
                              _title(context),
                              Padding(padding: const EdgeInsets.all(10.0)),
                              Expanded(
                                  child: GridView.builder(
                                physics: BouncingScrollPhysics(),
                                itemCount: snapshot.data.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemBuilder:
                                    (BuildContext context, int position) {
                                  return FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: myGardenTile(
                                      context,
                                      position,
                                      snapshot.data[position].commonName,
                                      snapshot.data[position].scientificName,
                                      snapshot.data[position].plantImage,
                                      snapshot.data[position].nickname,
                                      snapshot.data[position].temperature,
                                      snapshot.data[position].sunlight,
                                      snapshot.data[position].moistureUse)
                                  );
                                },
                              ))
                            ],
                          );
              }
            }));
  }
}
