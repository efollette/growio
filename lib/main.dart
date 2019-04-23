import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Sprout(),
    );
  }
}

class Sprout extends StatefulWidget {

  @override
  _SproutState createState() => _SproutState();
}

class _SproutState extends State<Sprout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Growio",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 20,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Erik Follette"),
              accountEmail: Text("erikfollette@sprout.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.green[600],
                child: Text(
                  "E",
                  style: TextStyle(
                    fontSize: 40.0,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text("Settings"),
              trailing: Icon(Icons.settings),
            ),
            ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.power_settings_new),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (BuildContext context, int position){
          return Column(
            children: <Widget>[
              Divider(
                height: 15.5,
              ),
              ListTile(
                leading: Container(
                  height: 80.0,
                  width: 100.0,
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
                title: Text(
                    "Plant Name"
                ),
                subtitle: Text(
                    "Here goes some information"
                ),
                onTap: () => debugPrint("Go to plant page"),
              ),
            ],
          );
        },
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: new Icon(Icons.add_a_photo),
        backgroundColor: Colors.greenAccent,
        elevation: 4.0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.green[900],
        items: [
          BottomNavigationBarItem(
            title: Text("MyGarden"),
            icon: Icon(Icons.local_florist),
          ),
          BottomNavigationBarItem(
            title: Text("Plantcyclopedia"),
            icon: Icon(Icons.search),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
