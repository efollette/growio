import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Growio/wdigets/plantcyclopediaProfile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../api/garden_api.dart' as garden;
import '../utils/routes.dart' as routes;

void _showDialog(BuildContext context, String commonName, String scientificName,
    String plantUrl) {
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
              child: plantcyclopediaProf(
                  context, commonName, scientificName, plantUrl),
            ),
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 300),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {});
}

/* button to add a plant */
Container _addButton(BuildContext context, String plantName,
    String scientificName, String plantUrl) {
  TextEditingController _nicknameController = TextEditingController();

  return Container(
      child: OutlineButton(
    borderSide: BorderSide(
      color: Color(0xFF278478),
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
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
                if (text == "") return "You must give your plant a nickname!";
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
                  // NEED A ADDLOADING HERE -- DONE
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Material(
                          type: MaterialType.transparency,
                          child: Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFF8BE4BB)),
                            ),
                          ),
                        );
                      });
                  bool response = await garden.addToGarden(
                      scientificName, _nicknameController.text, plantUrl);

                  if (response) {
                    if (_nicknameController.text != "") {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    }
                    routes.goToMyGardenScreen(context);
                  }
                  else {
                    routes.makeToast("There was an error adding your plant to myGarden, please try again!");
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          );
        }),
    child: Column(
      children: <Widget>[
        Container(
          width: 140.0,
          child: Text(
            "Add to MyGarden",
            style: TextStyle(
              fontSize: 13.0,
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

FlatButton plantTile(BuildContext context, String commonName,
    String scientificName, String plantUrl) {
  return FlatButton(
    splashColor: Color(0xFFF3FCF8),
    onPressed: () => _showDialog(context, commonName, scientificName, plantUrl),
    child: Container(
      height: 130,
      child: Row(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(5.0)),
          /* Plant Image */
          Container(
              height: 100.0,
              width: 110.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(color: Colors.grey[100], blurRadius: 10.0)
                  ]),
              // Poster's profile picture
              child: CircleAvatar(
                radius: 80.0,
                backgroundColor: Colors.transparent,
                child: (plantUrl != null)
                    ? CachedNetworkImage(
                        imageUrl: plantUrl,
                        placeholder: (context, url) => Icon(
                              Icons.local_florist,
                              color: Color(0xFF278478),
                              size: 40,
                            ),
                        errorWidget: (context, url, error) => Icon(
                              Icons.local_florist,
                              color: Color(0xFF278478),
                              size: 40,
                            ),
                      )
                    : Icon(Icons.local_florist),
              )),
          /* Information */
          Padding(padding: EdgeInsets.all(10.0)),
          Column(
            children: <Widget>[
              Padding(padding: const EdgeInsets.all(5)),
              Container(
                width: MediaQuery.of(context).size.width - 190.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Color(0xFFF3FCF8),
                  borderRadius: BorderRadius.circular(40.0),
                  border: Border.all(color: Colors.transparent),
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
                          commonName,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Quicksand',
                            color: Color(0xFF278478),
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
                          scientificName,
                          style: TextStyle(
                              fontSize: 8.0,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Quicksand',
                              color: Color(0xFF726767)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(padding: const EdgeInsets.all(3)),
              _addButton(context, commonName, scientificName, plantUrl),
            ],
          )
        ],
      ),
    ),
  );
}
