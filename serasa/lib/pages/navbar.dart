import 'package:flutter/material.dart';
import 'package:serasa/pages/akun.dart';
import 'package:serasa/pages/community.dart';
import 'package:serasa/pages/home.dart';
import 'package:serasa/pages/recycle.dart';
// import 'package:serasa/RecyclePage/recycle.dart';
import 'package:serasa/utils/color.dart';

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Recycle(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Community(),
    Akun(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Beranda',
                backgroundColor: AppColors.color2),
            BottomNavigationBarItem(
                icon: Icon(Icons.recycling),
                label: 'Daur Ulang',
                backgroundColor: AppColors.color2),
            BottomNavigationBarItem(
                icon: Icon(Icons.receipt),
                label: 'Pesanan',
                backgroundColor: AppColors.color2),
            BottomNavigationBarItem(
                icon: Icon(Icons.groups_rounded),
                label: 'Komunitas',
                backgroundColor: AppColors.color2),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Akun',
                backgroundColor: AppColors.color2),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
