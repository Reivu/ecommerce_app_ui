// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

//Title is deprecated so still in progress (label can't contains Widget)
//Or just use some third-party thing
//Or custom tabbar
//Or bottom appbar
class _BottomNavState extends State<BottomNav> {
  var _tabItem = 0;
  void _onItemTapped(int index) {
    setState(() {
      _tabItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Text(
              'Home',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _tabItem == 0 ? Colors.blue : Colors.black,
              ),
            ),
            title: showIndicator(_tabItem == 0),
          ),
          BottomNavigationBarItem(
            icon: Text(
              'Favourite',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _tabItem == 1 ? Colors.blue : Colors.black,
              ),
            ),
            title: showIndicator(_tabItem == 1),
          ),
          BottomNavigationBarItem(
            icon: Text(
              'Shop',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _tabItem == 2 ? Colors.blue : Colors.black,
              ),
            ),
            title: showIndicator(_tabItem == 2),
          ),
          BottomNavigationBarItem(
            icon: Text(
              'Me',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _tabItem == 3 ? Colors.blue : Colors.black,
              ),
            ),
            title: showIndicator(_tabItem == 3),
          ),
        ],
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget showIndicator(bool show) {
    return show
        ? const Padding(
            padding: EdgeInsets.only(top: 4),
            child: Icon(
              Icons.brightness_1,
              size: 7.0,
              color: Colors.blue,
            ),
          )
        : const SizedBox();
  }
}
