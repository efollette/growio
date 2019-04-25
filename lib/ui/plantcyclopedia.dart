import 'package:flutter/material.dart';
import '../utils/users.dart' as users;
import '../utils/routes.dart' as routes;
import '../wdigets/plantOfTheDay.dart';

class Plantcyclopedia extends StatefulWidget {
  @override
  _PlantcyclopediaState createState() => _PlantcyclopediaState();
}

class _PlantcyclopediaState extends State<Plantcyclopedia> {

  // Text controller for the search bar
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    // Check if the keyboard is up to determine if we need to show the FAB or not
    final bool _showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;

    // Handle Navigation
    void onTabTapped(int index) {
      setState(() {
        // Set current index equal to the page we wish to navigate to
        routes.currentIndex = index;
      });
      // If the current index is 0, go to MyGarden
      if ( routes.currentIndex == 0 ) routes.goToMyGardenScreen(context);
      // If the current index is 1, go to the Plantcyclopedia page
      if ( routes.currentIndex == 1 ) routes.goToPlantcyclopediaScreen(context);
    }

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
      body: Column(
        children: <Widget>[
          Padding(padding: const EdgeInsets.all(15.0)),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width - 50.0,
            child: Text(
                "Plantcyclopedia",
              style: TextStyle(
                color: Colors.green[900],
                fontSize: 50.0,
                fontFamily: 'Hojas de Plata',
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.all(10.0)),
          Container(
            width: MediaQuery.of(context).size.width - 50.0,
            child: TextFormField(
              textInputAction: TextInputAction.search,
              controller: _searchController,
              decoration: InputDecoration(
                hasFloatingPlaceholder: false,
                contentPadding: const EdgeInsets.only(left: 20.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.green,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                filled: true,
                fillColor: Colors.green,
                hintText: 'e.x. Daisy',
                labelText: 'Search for plants!',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => debugPrint("Search for plants boi"),
                ),
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.all(10.0)),
          _showFab ? plantOfTheDay(context) : Container(),
        ],
      ),
      floatingActionButton: _showFab ? FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add_a_photo),
        backgroundColor: Colors.greenAccent,
        elevation: 4.0,
      ) : null,
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: routes.currentIndex,
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
