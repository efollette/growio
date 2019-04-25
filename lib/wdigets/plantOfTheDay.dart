import 'package:flutter/material.dart';

Column plantOfTheDay(BuildContext context) {
  return Column(
    children: <Widget>[
      Divider(
        height: 15.5,
        color: Colors.white,
      ),
      // Plant Of The Day Title Text
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Plant Of The Day",
            style: TextStyle(
              fontFamily: 'Hojas De Plata',
              fontSize: 35.0,
              color: Colors.green[900],
            ),
          ),
        ],
      ),
      Padding(padding: const EdgeInsets.all(7.25)),
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
          // Pant Info: Name, Scientific name, etc.
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
      Padding(padding: const EdgeInsets.all(7.25)),
      // More info about the plant of the day
      Row(
        children: <Widget>[
          Padding(padding: const EdgeInsets.all(7.25)),
          Container(
            height: 75.0,
            padding: const EdgeInsets.all(12.0),
            width: MediaQuery.of(context).size.width - 20.5,
            decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.circular(15.0)
            ),
            child: SizedBox(
              width: double.infinity,
              child: Container(
                  child: Text("This is sample text that might contain more information about the given plant. We'll see what's good")
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
