import 'package:flutter/material.dart';
import 'package:resep_jajan_tradisional/home.dart'; // Pastikan file AboutPage diimpor
import 'about.dart';
import 'profile.dart'; // Pastikan file ProfilePage diimpor

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    MyHome(),
    AboutPage(),
    Profile(),
  ];

  void _onTaped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.info_outline), label: "About"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "MyProfile"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onTaped,
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
