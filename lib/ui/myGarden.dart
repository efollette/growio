import 'package:Growio/wdigets/myGardenTile.dart';
import 'package:flutter/material.dart';
import '../wdigets/plantTile.dart';

class MyGarden extends StatefulWidget {
  @override
  _MyGardenState createState() => _MyGardenState();
}

class _MyGardenState extends State<MyGarden> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: GridView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 8,
        gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int position) {
          return myGardenTile(context);
        }, 
      ),
    );
  }
}
