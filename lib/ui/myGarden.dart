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
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 12,
        itemBuilder: (BuildContext context, int position) {
          return plantTile(context);
        },
      ),
    );
  }
}

