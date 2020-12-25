import 'package:boba_app/screens/MainListScreen/main_list_screen.dart';
import 'package:boba_app/screens/MetricsScreen/metrics_screen.dart';
import 'package:boba_app/screens/Settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:boba_app/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ScreenController extends StatefulWidget {
  @override
  _ScreenControllerState createState() => _ScreenControllerState();
}

class _ScreenControllerState extends State<ScreenController> {
  int _currentIndex = 0;

  List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      MainListScreen(),
      MetricsScreen(),
      SettingsScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 23,
        currentIndex: _currentIndex,
        selectedItemColor: lightIconColor,
        unselectedItemColor: darkIconColor,
        backgroundColor: primaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(MdiIcons.coffee),
            title: Text('Boba History'),
            backgroundColor: darkIconColor,
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.assessment),
            title: Text('Metrics'),
            backgroundColor: darkIconColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            backgroundColor: darkIconColor,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
      ),
    );
  }
}
