import 'package:flutter/material.dart';

// Plant of the Day! title
Row _title = Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Text(
      "Plant of the Day!",
      style: TextStyle(
          fontFamily: 'Fredoka One Regular',
          fontSize: 30.0,
          color: Color(0xFF278478)
      ),
    ),
  ],
);

Column plantOfTheDay(BuildContext context) {
  return Column(
    children: <Widget>[
      Divider(
        height: 15.5,
        color: Color(0xFFE2F8EE),
      ),
      // Plant Of The Day Title Text
      _title,
      // Plant Tile
      Column(
        children: <Widget>[
          Padding(padding: const EdgeInsets.all(7.25)),
          // Plant Image
          Container(
            height: 140.0,
            width: 140.0,
            // Picture of plant
            child: IconButton(
              icon: Image.asset("Assets/TestSucculent.png"),
              onPressed: () => debugPrint("Go to plant"),
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
                        fontFamily: 'ABeeZee Italic',
                        color: Color(0xFF726767)
                      ),
                    ),
                  ),
                ),
              ],
            )
          ),
          Padding(padding: const EdgeInsets.all(7.25)),
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
                          //height: 1.2,
                        ),
                      ),
                    ),
                    Container(
                      child: Text("Sunlight: ",
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.black,
                          //height: 1.2,
                        ),
                      ),
                    ),
                    Container(
                      child: Text("Optimal Temperature",
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.black,
                          //height: 1.2,
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
          // More info about the plant of the day
        ],
      ),
      Padding(padding: const EdgeInsets.all(7.25)),
      // Additional Info
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("Additional Info:",
                textAlign: TextAlign.start,
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
              child: Text("Add dilute solution fertilizer once a month in the summer. \n"
                  "Little need for pruning. \n"
                  "Humidity is not an issue. \n"
                  "Avoid wet soil and foliage when temperatures are cool.",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  color: Colors.black,
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.all(7.25)),
          ],
        ),
      ),
    ],
  );
}
