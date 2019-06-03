import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



Container plantTile(BuildContext context, String commonName, String scientificName, String plantUrl){
  return Container(
    child: Row(
      children: <Widget>[
        /* Plant Image */
        Container(
           height: 73.0,
            width: 87.0,
            decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(80.0),
             color: Colors.greenAccent,
            ),
            // Poster's profile picture
            child: CircleAvatar(
              radius: 50.0,
              backgroundImage:
              NetworkImage(plantUrl),
              backgroundColor: Colors.transparent,
            )
        ),
        /* Information */
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
                                  commonName,
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
                                  scientificName,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontStyle: FontStyle.italic,
                                      fontFamily: 'Quicksand',
                                      color: Color(0xFF726767)),
                                ),
                              ),
                            ),
                          ],
                        )
        ),
      ],
    )
  );
}

/*
Column plantTile(BuildContext context) {
  return Column(
    children: <Widget>[
      Divider(
        height: 15.5,
        color: Colors.white,
      ),
      // Plant Tile
      Row(
        children: <Widget>[
          Padding(padding: const EdgeInsets.all(7.25)),
          // Plant Image
          Container(
            height: 170.0,
            width: 170.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              color: Colors.greenAccent,
            ),
            // Poster's profile picture
            child: IconButton(
              icon: Icon(Icons.local_florist),
              onPressed: () => debugPrint("Go to plant"),
              iconSize: 40.0,
            ),
          ),
          Padding(padding: const EdgeInsets.all(7.25)),
          Container(
            height: 170,
            width: MediaQuery.of(context).size.width - 213.5,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.green,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Plant Name",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
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
                      "Scientific Name",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black26,
                      ),
                    ),
                  ),
                ),
                Padding(padding: const EdgeInsets.all(5.5)),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Water:",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Padding(padding: const EdgeInsets.all(5.5)),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sunlight:",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Padding(padding: const EdgeInsets.all(5.5)),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Growth Cycle:",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Padding(padding: const EdgeInsets.all(5.5)),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Difficulty:",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: const EdgeInsets.all(7.25)),
        ],
      ),
      Divider(
        height: 15.5,
        color: Colors.white,
      ),
    ],
  );
}*/
