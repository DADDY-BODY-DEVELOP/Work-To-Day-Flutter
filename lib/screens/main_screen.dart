import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:work_to_day/screens/home_screen.dart';

import '../pages/checkin/check_in_page.dart';
import '../pages/profile/profile_page.dart';
import '../pages/history/history_page.dart';
import '../pages/user/user_page.dart';
import '../pages/report/report_page.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];
  Future logoutPage() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  final nameTitleBar = ['CHECK IN', 'PROFILE', 'HISTORY', 'USER', 'REPORT'];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          final isFirstRouteInCurrentTab =
              !await _navigatorKeys[_selectedIndex].currentState.maybePop();
          // let system handle back button if we're on the first route
          return isFirstRouteInCurrentTab;
        },
        child: Scaffold(
          backgroundColor: Colors.black,
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
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          appBar: AppBar(
            title: Text(nameTitleBar[_selectedIndex]),
            actions: [
              ElevatedButton(
                child: Icon(Icons.exit_to_app),
                onPressed: logoutPage,
              ),
            ],
          ),
          body: Stack(
            children: [
              _buildOffstageNavigator(0),
              _buildOffstageNavigator(1),
              _buildOffstageNavigator(2),
              _buildOffstageNavigator(3),
              _buildOffstageNavigator(4),
            ],
          ),
        ));
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          CheckInPage(),
          ProfilePage(),
          HistoryPage(),
          UserPage(),
          ReportPage(),
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);
    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name](context),
          );
        },
      ),
    );
  }
}
