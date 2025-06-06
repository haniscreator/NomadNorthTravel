import 'package:flutter/material.dart';
import 'package:travel_in_chiangmai/pages/home_page.dart';
import 'package:travel_in_chiangmai/pages/package_page.dart';
import 'package:travel_in_chiangmai/pages/profile_page.dart';



class MainNav extends StatefulWidget {
  final int selectedIndex;
  const MainNav({super.key, this.selectedIndex = 0}); 

  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  late int _currentIndex;

  final List<Widget> _screens = [
    HomePage(),
    PackagePage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.selectedIndex; 
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
  selectedItemColor: Colors.teal,           // 👈 Selected icon and text color
  unselectedItemColor: Colors.grey,         // 👈 Unselected icon and text color
  selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold), // Optional
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.card_travel),
      label: 'Packages',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ],
),

    );
  }
}
