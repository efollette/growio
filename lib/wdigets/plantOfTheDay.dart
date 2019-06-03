import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../wdigets/plantProfile.dart';

// Group to scale size of text for water, sun and temp
var _group = AutoSizeGroup();

void _showDialog(BuildContext context, String commonName, String scientificName, String imageUrl) {
  // flutter defined function
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: PlantProfile(commonName, scientificName, imageUrl),
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 300),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {});
}

Container plantOfTheDay(BuildContext context, AsyncSnapshot snapshot) {
  return Container(
    padding: const EdgeInsets.only(top: 10.0),
    width: MediaQuery.of(context).size.width - 75.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(24.0),
      color: Color(0xFFDFFFF0),
    ),
    child: Column(
    children: <Widget>[

      Divider(
        height: 15.5,
        color: Color(0xFFE2F8EE),
      ),
      // Plant Of The Day Title Text
      Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * (247/375),
        child: AutoSizeText(
          "Plant of the Week!",
          style: TextStyle(
            fontFamily: 'Fredoka One Regular',
            fontSize: 30.0,
            color: Color(0xFF278478)
          ),
          maxLines: 1,
        ),
      ),
      Column(
        children: <Widget>[
          // Plant Image
          Container(
            height: MediaQuery.of(context).size.height * (106/812),
            width:  MediaQuery.of(context).size.width * (122/375),
            // Picture of plant
            child: IconButton(
              icon: Image.network(snapshot.data.plantImage),
              onPressed: () => _showDialog(context, snapshot.data.commonName, snapshot.data.scientificName, snapshot.data.plantImage),
            ),
          ),
          // Plant Info: Name, Scientific name
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * (304/375),
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    snapshot.data.commonName,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Quicksand',
                      color: Color(0xFF312F2F),
                    ),
                    maxLines: 1,
                  ),
                  ),
                Padding(padding: const EdgeInsets.all(1.5)),
                Container(
                  width: MediaQuery.of(context).size.width * (192/375),
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    snapshot.data.scientificName,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'ABeeZee Italic',
                      color: Color(0xFF726767)
                    ),
                    maxLines: 1,
                    minFontSize: 10.0,
                  ),
                ),
              ],
            )
          ),
          Padding(padding: const EdgeInsets.all(7.25)),
          // Additional plant info: water, sunlight
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset('Assets/WaterDrop.png'),
                    ),
                    Container(
                      child: Image.asset('Assets/SunIcon.png'),
                    ),
                    Container(
                      child: Image.asset('Assets/Thermostat.png'),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * (138/375),
                      child: AutoSizeText("Watering Frequency: ",
                        group: _group,
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.black,
                          height: 1.2
                          //height: 1.2,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * (69/375),
                      child: AutoSizeText("Sunlight: ",
                        group: _group,
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.black,
                          height: 1.2
                          //height: 1.2,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * (135/375),
                      child: AutoSizeText("Optimal Temperature",
                        maxLines: 1,
                        minFontSize: 5.0,
                        group: _group,
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.black,
                          height: 1.2
                          //height: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      child: AutoSizeText("Every 14 Days",
                        maxLines: 1,
                        minFontSize: 5.0,
                        group: _group,
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      child: AutoSizeText("Full/Partial",
                        maxLines: 1,
                        minFontSize: 5.0,
                        group: _group,
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      child: AutoSizeText(">40°",
                        maxLines: 1,
                        minFontSize: 5.0,
                        group: _group,
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ), // Container to close row
          Divider(
            height: 15.5,
            color: Color(0xFFE2F8EE),
          ),
        ]
      )
    ],
  )
  );
}
