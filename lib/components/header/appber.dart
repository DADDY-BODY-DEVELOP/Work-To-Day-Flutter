import 'package:common_bottom_navigation_bar/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class AppBarTab extends StatefulWidget {
  @override
  _AppBarTabState createState() => _AppBarTabState();
}

class _AppBarTabState extends State<AppBarTab> {
  int _selectedIndex = 0;

  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_selectedIndex].currentState.maybePop();

        print(
            'isFirstRouteInCurrentTab: ' + isFirstRouteInCurrentTab.toString());

        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.location_on,
                color: Colors.black,
              ),
              label: 'Location',
              activeIcon: Icon(
                Icons.location_on,
                size: 36,
              ),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                label: 'Profile',
                activeIcon: Icon(
                  Icons.person,
                  size: 36,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.history,
                  color: Colors.black,
                ),
                label: 'History',
                activeIcon: Icon(
                  Icons.history,
                  size: 36,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.supervisor_account,
                  color: Colors.black,
                ),
                label: 'User',
                activeIcon: Icon(
                  Icons.supervisor_account,
                  size: 36,
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt, color: Colors.black),
                label: 'Report',
                activeIcon: Icon(
                  Icons.list_alt,
                  size: 36,
                )),
          ],
          selectedItemColor: Colors.amber[800],
          // onTap: _onItemTapped,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
