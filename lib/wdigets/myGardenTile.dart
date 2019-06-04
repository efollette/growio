import 'package:flutter/material.dart';
import 'package:Growio/wdigets/plantProfile.dart';
import 'package:Growio/ui/myGarden.dart';

void _showDialog(BuildContext context, String plantName, String scientificName, String plantImage, String nickname, String temp, String light, String moisture) {
  // flutter defined function
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
              child: plantProf(context, plantName, scientificName, plantImage, nickname, temp, light, moisture),
            ),
            // child: PlantProfile(plantName, scientificName, plantImage, nickname,temp, light, moisture ),
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 300),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {});
}

Column myGardenTile(
    BuildContext context, int index, String plantName, String scientificName, String plantImage, String nickname, String temp, String light, String moisture) {
  return Column(
    children: <Widget>[
      FlatButton(
        onPressed: () => _showDialog(context, plantName, scientificName, plantImage, nickname, temp, light, moisture),
        child: Container(
          width: 190.0,
          height: 200.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35.0),
            color: Color(0xFFDFFFF0),
          ),
          child: Column(
            children: <Widget>[
              Divider(
                height: 5.5,
                color: Color(0xFFE2F8EE),
              ),
              // Plant Tile
              Column(
                children: <Widget>[
                  Padding(padding: const EdgeInsets.all(5.25)),
                  // Plant Image
                  Hero(
                    tag: 'plantProf$index',
                    child: Container(
                      height: 73.0,
                      width: 87.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                      ),
                      // Poster's profile picture
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(80.0),
                        child: IconButton(
                          icon: Image.network(
                            plantImage,
                          ),
                          onPressed: () => debugPrint("Go to plant"),
                          iconSize: 40.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.all(5.25)),
                  // Plant Info: Name, Scientific name, etc.
                  Container(
                      width: MediaQuery.of(context).size.width - 213.5,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFDFFFF0)),
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            width: double.infinity,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                nickname,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: 'Quicksand',
                                  color: Color(0xFF312F2F),
                                ),
                              ),
                            ),
                          ),
                          Padding(padding: const EdgeInsets.all(1.5)),
                          SizedBox(
                            width: double.infinity,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                plantName,
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Quicksand',
                                    color: Color(0xFF726767)),
                              ),
                            ),
                          ),
                        ],
                      )),
                  Padding(padding: const EdgeInsets.all(3.5)),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              child: Image.asset('Assets/WaterDrop.png'),
                            ),
                            Padding(padding: const EdgeInsets.all(20.0)),
                            Container(
                              child: Image.asset('Assets/SunIcon.png'),
                            ),
                            Padding(padding: const EdgeInsets.all(20.0)),
                            Container(
                              child: Image.asset('Assets/Thermostat.png'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(padding: const EdgeInsets.all(1.5)),
            ],
          ),
        ),
      ),
    ],
  );
}
