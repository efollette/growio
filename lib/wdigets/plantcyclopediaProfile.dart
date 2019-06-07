import 'dart:core';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../api/garden_api.dart' as garden;
import '../utils/constants.dart' as constant;
import '../utils/users.dart' as users;

// Group to scale size of text for water, sun and temp
var _group = AutoSizeGroup();


/* button to add plant */
Container _addButton(BuildContext context, String plantName, String scientificName, String plantUrl) {

  TextEditingController _nicknameController = TextEditingController();

  return Container(
      child: OutlineButton(
        borderSide: BorderSide(
          color: Color(0xFF278478),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0)),
        splashColor: Color(0xFF278478),
        onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  "Give your Plant A Nickname!",
                  style: TextStyle(
                    color: Color(0xFF278478),
                  ),
                ),
                content: TextFormField(
                  autovalidate: true,
                  controller: _nicknameController,
                  validator: (text) {
                    if (text == "")
                      return "You must give your plant a nickname!";
                  },
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      "Return to Suggestions",
                      style: TextStyle(
                        color: Color(0xFF8BE4BB),
                      ),
                    ),
                    onPressed: () {
                      // Return to the list of options
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Color(0xFF8BE4BB),
                      ),
                    ),
                    onPressed: () async {
                      // Add to garden func goes here, passing in _nicknameContoller.text as the param
                      // NEED A ADDLOADING HERE
                      bool response = await garden.addToGarden(scientificName, _nicknameController.text, plantUrl);

                      if (response) {
                        if (_nicknameController.text != "") {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        }
                        Navigator.pushNamed(
                            context, '/myGarden');
                      }

                      // Pop off both dialog boxes

                    },
                  ),
                ],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              );
            }
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: 190.0,
              child: Text(
                "Add To MyGarden",
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

/* button to exit the page */
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
Dialog plantcyclopediaProf(BuildContext context, String plantName, String scientificName, String plantUrl) {
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
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150.0),
                  color: Colors.transparent,
                ),
                child: CircleAvatar(
                  radius: 150.0,
                  backgroundColor: Colors.transparent,
                  child: (plantUrl != null)
                      ? CachedNetworkImage(
                    imageUrl: plantUrl,
                    placeholder: (context, url) => Icon(Icons.local_florist, color: Color(0xFF278478), size: 40,),
                    errorWidget: (context, url, error) => Icon(Icons.local_florist, color: Color(0xFF278478), size: 40,),
                  )
                      : Icon(Icons.local_florist),
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
                  width: MediaQuery.of(context).size.width * (104 / 375),
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    plantName,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'Quicksand',
                      color: Color(0xFF312F2F),
                    ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: const EdgeInsets.all(1.5)),
          Container(
            width: MediaQuery.of(context).size.width * (92 / 375),
            alignment: Alignment.center,
            child: AutoSizeText(
              scientificName,
              style: TextStyle(
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'ABeeZee Italic',
                  color: Color(0xFF726767)),
              maxLines: 1,
              minFontSize: 5.0,
            ),
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
          // adding the button to the bottom
          Padding(padding: EdgeInsets.all(60.0)),
          _addButton(context, plantName, scientificName, plantUrl),
        ],
      ),
    ),
  );
}