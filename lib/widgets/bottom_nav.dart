import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    var _tabItem = 0;
    void _onItemTapped(int index) {
      setState(() {
        _tabItem = index;
      });
    }

    //Title is deprecated so still in progress (label can't contains Widget)
    //Or just use some third-party thing
    //Or custom tabbar
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(40),
        topLeft: Radius.circular(40),
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Text(
              'Home',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            title: showIndicator(_tabItem == 0),
          ),
          BottomNavigationBarItem(
            icon: const Text(
              'Favorite',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            title: showIndicator(_tabItem == 1),
          ),
          BottomNavigationBarItem(
            icon: const Text(
              'Shop',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            title: showIndicator(_tabItem == 2),
          ),
          BottomNavigationBarItem(
            icon: const Text(
              'Me',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            title: showIndicator(_tabItem == 3),
          ),
        ],
        showUnselectedLabels: true,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
        currentIndex: _tabItem,
      ),
    );
  }

  Widget showIndicator(bool show) {
    return show
        ? const Padding(
            padding: EdgeInsets.only(top: 4),
            child: Icon(
              Icons.brightness_1,
              size: 10,
              color: Colors.blue,
            ),
          )
        : const SizedBox();
  }
}
