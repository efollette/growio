import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../api/garden_api.dart' as garden;
import '../utils/constants.dart' as constant;
import '../utils/users.dart' as users;
import 'package:http/http.dart' as http;

// Group to scale size of text for water, sun and temp
var _group = AutoSizeGroup();

/* button to edit the name */
Container _editButton(BuildContext context, String nickname) {
  return Container(
    height: 20,
    child: OutlineButton(
        borderSide: BorderSide(
          color: Color(0xFF278478),
        ),
        shape: CircleBorder(),
        splashColor: Color(0xFF278478),
        onPressed: () => _asyncInputDialog(context, nickname),
        child: Icon(
          Icons.edit,
          color: Color(0xFF278478),
          size: 10,
        )),
  );
}

/* used to change name */
Future<String> _asyncInputDialog(BuildContext context, String oldNickname) async {
  String nickName = " ";
  return showDialog<String>(
    context: context,
    barrierDismissible:
        false, // dialog is dismissible with a tap on the barrier
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        title: Text(
          "Give your plant a new name!",
          style: TextStyle(
            fontFamily: 'Quicksand',
          ),
        ),
        backgroundColor: Color(0xFFE2F8EE),
        content: Row(
          children: <Widget>[
            Expanded(
                child: TextField(
              autofocus: true,
              decoration:
                  InputDecoration(labelText: 'Nickname', hintText: 'eg. Groot'),
              onChanged: (value) {
                nickName = value;
              },
            ))
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Cancel',
              style: TextStyle(color: Color(0xFF278478)),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text(
              'Ok',
              style: TextStyle(color: Color(0xFF278478)),
            ),
            onPressed: () async {
              // this is where the API call will go I believe (Yash)
              String updateUrl = constant.apiUrl + "/garden/plant/nickname?token=";
              updateUrl += users.apiToken;
              final response = await http.put(updateUrl, body: {"oldNickname": oldNickname, "newNickname": nickName});
              //Navigator.of(context).pop();
              Navigator.pushNamed(context, '/myGarden');
            },
          ),
        ],
      );
    },
  );
}

/* button to remove plant */
Container _addButton(BuildContext context, String nickname) {
  return Container(
      child: OutlineButton(
    borderSide: BorderSide(
      color: Color(0xFF278478),
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
    splashColor: Color(0xFF278478),
    onPressed: () async {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Are you sure you wish to remove this plant from MyGarden?",
                style: TextStyle(
                  color: Color(0xFF278478),
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    "No",
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
                    "Yes",
                    style: TextStyle(
                      color: Color(0xFF8BE4BB),
                    ),
                  ),
                  onPressed: () async {
                    // Return to the list of options
                    //Navigator.of(context).pop();
                    bool response = await garden.removePlant(nickname);
                    if (response) {
                      Navigator.of(context).pop();
                    }
                    Navigator.pushNamed(context, '/myGarden');
                  },
                ),
              ],
            );
          });
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
Dialog plantProf(
    BuildContext context,
    String plantName,
    String scientificName,
    String plantUrl,
    String nickname,
    String temp,
    String light,
    String moisture) {
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
              Expanded(child: Container()),
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
                  backgroundImage:
                  NetworkImage(plantUrl),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(6.0)),
          // Nickname and edit nickname button
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(child: Container(),),
              Container(
                width: MediaQuery.of(context).size.width * (104 / 375),
                alignment: Alignment.center,
                child: AutoSizeText(
                  nickname,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontFamily: 'Quicksand',
                    color: Color(0xFF312F2F),
                  ),
                  maxLines: 1,
                ),
              ),
              _editButton(context, nickname),
            ],
          ),
          // Plant Info: Name, Scientific name
          Container(
            width: MediaQuery.of(context).size.width * (104 / 375),
            alignment: Alignment.center,
            child: AutoSizeText(
              plantName,
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
            width: MediaQuery.of(context).size.width * (92 / 375),
            alignment: Alignment.center,
            child: AutoSizeText(
              scientificName,
              style: TextStyle(
                  fontSize: 15.0,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'ABeeZee Italic',
                  color: Color(0xFF726767)),
              maxLines: 1,
              minFontSize: 8.0,
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
                        moisture,
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
                        light,
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
                        temp,
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
          Expanded(child: Container()),
          _addButton(context, nickname),
          Padding(padding: const EdgeInsets.all(5.0))
        ],
      ),
    ),
  );
}
