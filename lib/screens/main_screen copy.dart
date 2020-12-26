import 'package:common_bottom_navigation_bar/constants.dart';
import 'package:common_bottom_navigation_bar/screens/screen2.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_icons/flutter_icons.dart';

import '../constants.dart';
import '../pages/location_page.dart';
import '../pages/profile_page.dart';
import '../pages/history_page.dart';
import '../pages/users_page.dart';
import '../pages/report_page.dart';

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
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.location_on,
                color: kGoodLightGray,
              ),
              title: Text('Location'),
              activeIcon: Icon(
                Icons.location_on,
                color: kGoodPurple,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: kGoodLightGray,
              ),
              title: Text('Profile'),
              activeIcon: Icon(
                Icons.person,
                color: kGoodPurple,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.history,
                color: kGoodLightGray,
              ),
              title: Text('History'),
              activeIcon: Icon(
                Icons.history,
                color: kGoodPurple,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.supervisor_account,
                color: kGoodLightGray,
              ),
              title: Text('User'),
              activeIcon: Icon(
                Icons.supervisor_account,
                color: kGoodPurple,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list_alt,
                color: kGoodLightGray,
              ),
              title: Text('Report'),
              activeIcon: Icon(
                Icons.list_alt,
                color: kGoodPurple,
              ),
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
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
      ),
    );
  }

  void _next() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2()));
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          LocationPage(),
          ProfilePage(),
          HistoryPage(),
          UsersPage(
            onNext: _next,
          ),
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
