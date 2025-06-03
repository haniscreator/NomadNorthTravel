// main_nav.dart

import 'package:flutter/material.dart';
import 'package:travel_in_chiangmai/pages/profile_screen.dart';
import 'package:travel_in_chiangmai/screens/home/home_screen.dart';
import 'package:travel_in_chiangmai/screens/package/travel_package_screen.dart';
//import 'package:travel_in_chiangmai/screens/home/home_screen.dart';

//import 'package:travel_in_chiangmai/screens/package/travel_package_screen.dart';

class MainNav extends StatefulWidget {
  final int selectedIndex;
  const MainNav({super.key, this.selectedIndex = 0}); // <--- default is home tab

  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  late int _currentIndex;

  final List<Widget> _screens = [
    HomeScreen(),
    TravelPackageScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.selectedIndex; // <--- use passed index
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: 'Packages'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
