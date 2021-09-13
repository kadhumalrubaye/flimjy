import 'package:flutter/material.dart';

import '../../statics/routes.dart';
import '../profile_screen.dart';
import 'setting_widget.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({
    Key key,
  }) : super(key: key);

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        switch (index) {
          case 0:
            Navigator.pushNamed(context, RouteName.profileScreen);
            break;

          case 1:
            Navigator.pushNamed(context, RouteName.moviesScreen);
            break;
          default:
        }
      });
    }

    return BottomNavigationBar(
      onTap: _onItemTapped,
      backgroundColor: Colors.transparent,
      currentIndex: _selectedIndex, // this will be set when a new tab is tapped
      items: [
        BottomNavigationBarItem(
          icon: new Icon(
            Icons.person,
            color: Color.fromRGBO(32, 142, 231, 1.0),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: new Icon(
            Icons.explore,
            color: Color.fromRGBO(32, 142, 231, 1.0),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          backgroundColor: Color.fromRGBO(32, 142, 231, 1.0),
          icon: SettingWidget(),
          label: '',
        )
      ],
    );
  }
}
