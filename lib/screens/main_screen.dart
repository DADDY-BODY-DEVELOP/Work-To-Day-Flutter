import 'package:common_bottom_navigation_bar/constants.dart';
import 'package:common_bottom_navigation_bar/screens/screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../constants.dart';
// import '../pages/calendar_page.dart';
// import '../pages/home_page.dart';
import '../pages/location_page.dart';
import '../pages/profile_page.dart';
import '../pages/history_page.dart';
import '../pages/user/user_page.dart';
import '../pages/Report_page.dart';
// import '../pages/profile_page.dart';

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
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     Feather.home,
            //     color: kGoodLightGray,
            //   ),
            //   title: Text('HOME'),
            //   activeIcon: Icon(
            //     Feather.home,
            //     color: kGoodPurple,
            //   ),
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     FontAwesome.calendar,
            //     color: kGoodLightGray,
            //   ),
            //   title: Text('CALENDAR'),
            //   activeIcon: Icon(
            //     FontAwesome.calendar,
            //     color: kGoodPurple,
            //   ),
            // ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.location_on,
                color: kGoodLightGray,
                size: 36,
              ),
              title: Text('LOCATION'),
              activeIcon: Icon(
                Icons.location_on,
                color: kGoodPurple,
                size: 36,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                EvilIcons.user,
                color: kGoodLightGray,
                size: 36,
              ),
              title: Text('PROFILE'),
              activeIcon: Icon(
                EvilIcons.user,
                color: kGoodPurple,
                size: 36,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.history,
                color: kGoodLightGray,
                size: 36,
              ),
              title: Text('HISTORY'),
              activeIcon: Icon(
                Icons.history,
                color: kGoodPurple,
                size: 36,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.supervisor_account,
                color: kGoodLightGray,
                size: 36,
              ),
              title: Text('USERS'),
              activeIcon: Icon(
                Icons.supervisor_account,
                color: kGoodPurple,
                size: 36,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list_alt,
                color: kGoodLightGray,
                size: 36,
              ),
              title: Text('REPORT'),
              activeIcon: Icon(
                Icons.list_alt,
                color: kGoodPurple,
                size: 36,
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
          // HomePage(),
          // CalendarPage(
          //   onNext: _next,
          // ),
          LocationPage(),
          ProfilePage(),
          HistoryPage(),
          UserPage(
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
