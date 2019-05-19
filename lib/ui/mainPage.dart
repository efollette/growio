import 'package:flutter/material.dart';
import 'plantcyclopedia.dart';
import 'myGarden.dart';
import '../utils/users.dart' as users;

// Controller that indicated which page we're at
final controller = PageController(
  initialPage: 0,
);

// Current page
int currentPage = 0;

/*
 * Name: _handleLogOut
 * Parameters:  context - build context of the current widget its being called from
 * Description: Logs the user out from Growio and removes all previous routes
 *              from the navigator making it impossible for the user to return
 *              to where they were in the app without first logging in
 */
void _handleLogOut(BuildContext context) {
  Navigator.of(context)
      .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  // AppBar for both of our pages
  final AppBar _appBar = AppBar(
    title: Image.asset(
      "Assets/plant.png",
       color: Color(0xFF8BE4BB),
      height: 36,
    ),
    backgroundColor: Colors.white,
    centerTitle: true,
    iconTheme: IconThemeData(color: Color(0xFF278478)),
    elevation: 0,
  );

  // Floating action button to go to camera
  final FloatingActionButton _fab = FloatingActionButton(
    onPressed: () {},
    tooltip: 'Add a plant',
    child: Icon(Icons.camera_enhance),
    backgroundColor: Colors.greenAccent,
    elevation: 4.0,
  );

  // Navigation method
  void _onTabTapped(int index) {
    setState(() {
      // Set current index equal to the page we wish to navigate to
      currentPage = index;
    });
    //Animate to the page we want
    controller.animateToPage(
        currentPage,
        duration: Duration(
          milliseconds: 850,
        ),
        curve: Curves.ease,
    );
  }

  // Event for when the page is scrolled to be called in the scroll listener
  void _pageSwiped() {
    // If the user is scrolling to plantcyclopedia, set the nav index to 1
    if( controller.page >= 0.5 ) {
      setState(() {
        currentPage = 1;
      });
    }
    // If the user is scrolling to myGarden, set the nav index to 0
    else {
      setState(() {
        currentPage = 0;
      });
    }
  }

  // Bottom navigation bar that can also navigate to the pages
  Theme _createBottomNavBar(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xFF278478),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF278478),
            border: Border(
              top: BorderSide(
                color: Color(0xFF278478),
                width: 7/812 * MediaQuery.of(context).size.height,
              ),
              bottom: BorderSide(
                color: Color(0xFF278478),
                width: 7/812 * MediaQuery.of(context).size.height,
              ),
            )
          ),
          child: BottomNavigationBar(
            elevation: 0.0,
            onTap: _onTabTapped,
            currentIndex: currentPage,
            items: [
              BottomNavigationBarItem(
                title: Text(
                  "MyGarden",
                  style: TextStyle(
                    color: Color(0xFF8BE4BB),
                  ),
                ),
                icon: Icon(
                  Icons.local_florist,
                  color: Color(0xFF8BE4BB),
                  size: 38.5,
                ),
              ),
              BottomNavigationBarItem(
                title: Text(
                  "Plantcyclopedia",
                  style: TextStyle(
                    color: Color(0xFF8BE4BB),
                  ),
                ),
                icon: Icon(
                  Icons.find_in_page,
                  color: Color(0xFF8BE4BB),
                  size: 38.5,
                ),
              ),
            ],
          ),
        ),
    );
  }

  // Drawer that contains the settings and logout buttons
  Drawer _makeDrawer( BuildContext context) {
    return Drawer(
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
    );
  }

  @override
  Widget build(BuildContext context) {

    // Add a listener for page transition
    controller.addListener( _pageSwiped );

    // Check if the keyboard is up to determine if we need to show the FAB or not
    final bool _showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;

    return Scaffold(
      appBar: _appBar,
      drawer: _makeDrawer(context),
      body: PageView(
        controller: controller,
        children: <Widget>[
          MyGarden(),
          Plantcyclopedia(_showFab),
        ],
      ),
      bottomNavigationBar: _createBottomNavBar(context),
      floatingActionButton: _showFab ? Container(
        height: 85/819 * MediaQuery.of(context).size.height,
        child: FittedBox(
          child: _fab,
        ),
      ) : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
