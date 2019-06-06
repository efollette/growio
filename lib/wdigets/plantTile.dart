import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Growio/wdigets/plantcyclopediaProfile.dart';

void _showDialog(BuildContext context, String commonName, String scientificName, String plantUrl) {
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
              child: plantcyclopediaProf(context, commonName, scientificName, plantUrl),
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
Container _addButton(BuildContext context) {
  return Container(
      child: OutlineButton(
        borderSide: BorderSide(
          color: Color(0xFF278478),
        ),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(50.0)),
        splashColor: Color(0xFF278478),
        onPressed: () => {},
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

FlatButton plantTile(BuildContext context, String commonName, String scientificName, String plantUrl){
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
                boxShadow: [new BoxShadow(
                    color: Colors.grey[100],
                    blurRadius: 10.0
                )]
            ),
            // Poster's profile picture
            child: CircleAvatar(
              radius: 80.0,
              backgroundImage:
              NetworkImage(plantUrl),
              backgroundColor: Colors.transparent,
            )
        ),
        /* Information */
        Padding(padding: EdgeInsets.all(10.0)),
        Column (
  children: <Widget> [
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
                          _addButton(context),
      ],
    )
  ],
  ),
    ),
  );
}
