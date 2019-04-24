import 'package:flutter/material.dart';
import '../utils/users.dart' as users;
import '../utils/routes.dart' as routes;

class MyGarden extends StatefulWidget {
  @override
  _MyGardenState createState() => _MyGardenState();
}

class _MyGardenState extends State<MyGarden> {
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
              accountEmail: Text(users.userEmail),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.green[600],
                child: Text(
                  users.userEmail[0].toUpperCase(),
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
              onTap: () => _handleLogOut(context),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (BuildContext context, int position) {
          return Column(
            children: <Widget>[
              Divider(
                height: 15.5,
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
                        Padding(padding: const EdgeInsets.all(3.5)),
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
                        Padding(padding: const EdgeInsets.all(3.5)),
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
                      ],
                    ),
                  ),
                  Padding(padding: const EdgeInsets.all(7.25)),
                ],
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

/*
 * Name: _handleLogOut
 * Parameters:  context - build context of the current widget its being called from
 * Description: Logs the user out from Growio and removes all previous routes
 *              from the navigator making it impossible for the user to return
 *              to where they were in the app
 */
void _handleLogOut(BuildContext context) {
  users.signOutUser(context);
  Navigator.of(context)
      .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
}
