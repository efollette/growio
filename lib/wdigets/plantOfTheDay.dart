import 'package:flutter/material.dart';

Column plantOfTheDay(BuildContext context) {
  return Column(
    children: <Widget>[
      Divider(
        height: 15.5,
        color: Color(0xFFE2F8EE),
      ),
      // Plant Of The Day Title Text
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Plant of the Day!",
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 30.0,
              color: Color(0xFF278478),
            ),
          ),
        ],
      ),
      // Plant Tile
      Column(
        children: <Widget>[
          Padding(padding: const EdgeInsets.all(7.25)),
          // Plant Image
          Container(
            height: 140.0,
            width: 140.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
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
                      "Plant Name",
                      style: TextStyle(
                        fontSize: 25.0,
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
                      "Scientific Name",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Quicksand',
                        color: Color(0xFF726767)
                      ),
                    ),
                  ),
                ),
              ],
            )
          ),
          Container(
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
                      child: Text("Watering Frequency: ",
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      child: Text("Sunlight: ",
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      child: Text("Optimal Temperature",
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      child: Text("Every 14 Days",
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      child: Text("Full/Partial",
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(">40°",
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
          ),

          Padding(padding: const EdgeInsets.all(7.25)),
        ],
      ),
      Padding(padding: const EdgeInsets.all(7.25)),
      // More info about the plant of the day
    ],
  );
}
