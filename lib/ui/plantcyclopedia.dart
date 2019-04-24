import 'package:flutter/material.dart';
import '../utils/users.dart' as users;
import '../utils/routes.dart' as routes;

class Plantcyclopedia extends StatefulWidget {
  @override
  _PlantcyclopediaState createState() => _PlantcyclopediaState();
}

class _PlantcyclopediaState extends State<Plantcyclopedia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("Assets/plant.png"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightGreen,
              ),
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
      body: Container(),
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
