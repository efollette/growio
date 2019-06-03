import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../api/remove_api.dart' as remove;

// Group to scale size of text for water, sun and temp
var _group = AutoSizeGroup();

// Group to scale size of text for additional info
var _group2 = AutoSizeGroup();

class PlantProfile extends StatefulWidget {
  final String plantName;
  final String scientificName;
  final String plantUrl;

  PlantProfile(this.plantName, this.scientificName, this.plantUrl) : super();

  @override
  _PlantProfileState createState() => _PlantProfileState();
}

class _PlantProfileState extends State<PlantProfile> {
/* button top remove plant */
  Container _addButton(BuildContext context) {
    return Container(
        child: OutlineButton(
          borderSide: BorderSide(
            color: Color(0xFF278478),
          ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      splashColor: Color(0xFF278478),
      onPressed: () {
        remove.removePlant(widget.plantName);
      },
      child: Column(
        children: <Widget>[
          Container(
            width: 190.0,
            child: Text(
              "Remove",
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: 'Quicksand',
                color: Color(0xFF278478),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ));
  }

  Container _exitButton(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      child: FlatButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () => Navigator.pop(context),
        child: Icon(
          Icons.close,
          color: Color(0xFF278478),
        ),
      ),
    );
  }

/* Plant Profile Page */
  Dialog build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: Color(0xFFE2F8EE),
      child: Container(
        width: 250.0,
        height: 600.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.0),
          color: Color(0xFFDFFFF0),
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Divider(
                  height: 15.5,
                  color: Color(0xFFE2F8EE),
                ),
                Padding(padding: EdgeInsets.only(left: 230.0)),
                _exitButton(context),
              ],
            ),
            Column(
              children: <Widget>[
                // Plant Image
                Container(
                  height: MediaQuery.of(context).size.height * (106 / 812),
                  width: MediaQuery.of(context).size.width * (122 / 375),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80.0),
                    color: Colors.greenAccent,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.local_florist),
                    iconSize: 40.0,
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(6.0)),
            // Plant Info: Name, Scientific name
            Container(
                child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * (304 / 375),
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    widget.plantName,
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
                  width: MediaQuery.of(context).size.width * (192 / 375),
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    widget.scientificName,
                    style: TextStyle(
                        fontSize: 15.0,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'ABeeZee Italic',
                        color: Color(0xFF726767)),
                    maxLines: 1,
                    minFontSize: 8.0,
                  ),
                ),
              ],
            )),
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
                      Padding(padding: EdgeInsets.all(10.0)),
                      Container(
                        child: Image.asset('Assets/SunIcon.png'),
                      ),
                      Padding(padding: EdgeInsets.all(6.0)),
                      Container(
                        child: Image.asset('Assets/Thermostat.png'),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * (138 / 375),
                        child: AutoSizeText(
                          "Watering Frequency: ",
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
                      Padding(padding: EdgeInsets.all(5.0)),
                      Container(
                        width: MediaQuery.of(context).size.width * (69 / 375),
                        child: AutoSizeText(
                          "Sunlight: ",
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
                      Padding(padding: EdgeInsets.all(5.0)),
                      Container(
                        width: MediaQuery.of(context).size.width * (135 / 375),
                        child: AutoSizeText(
                          "Optimal Temperature",
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
                        child: AutoSizeText(
                          "Every 14 Days",
                          maxLines: 1,
                          minFontSize: 5.0,
                          group: _group,
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(5.0)),
                      Container(
                        child: AutoSizeText(
                          "Full/Partial",
                          maxLines: 1,
                          minFontSize: 5.0,
                          group: _group,
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(5.0)),
                      Container(
                        child: AutoSizeText(
                          ">40°",
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
            Padding(padding: const EdgeInsets.all(7.25)),
            // More info about the plant of the day
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: AutoSizeText(
                      "Additional Info:",
                      textAlign: TextAlign.start,
                      minFontSize: 5.0,
                      maxLines: 1,
                      group: _group2,
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.all(4.25)),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: AutoSizeText(
                      "Add dilute solution fertilizer once a month in the summer. \n"
                      "Little need for pruning. \n"
                      "Humidity is not an issue. \n"
                      "Avoid wet soil and foliage when temperatures are cool.",
                      minFontSize: 5.0,
                      maxLines: 6,
                      group: _group2,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        color: Colors.black,
                      ),
                    ),
                  ),
                  //Padding(padding: const EdgeInsets.all(7.25))
                ],
              ),
            ),
            // adding the button to the bottom
            Padding(padding: EdgeInsets.all(40.0)),
            _addButton(context),
          ],
        ),
      ),
    );
  }
}
