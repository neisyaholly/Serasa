import 'package:flutter/material.dart';
import 'package:serasa/pages/akun.dart';
import 'package:serasa/pages/community.dart';
import 'package:serasa/pages/home.dart';
import 'package:serasa/pages/pesanan.dart';
import 'package:serasa/pages/recycle.dart';
import 'package:serasa/utils/color.dart';

class BottomNavigationBarExample extends StatefulWidget {
  final int initialIndex;
  const BottomNavigationBarExample({Key? key, required this.initialIndex})
      : super(key: key);

  @override
  State<BottomNavigationBarExample> createState() =>
      // ignore: no_logic_in_create_state
      _BottomNavigationBarExampleState(initialIndex);
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex;
  _BottomNavigationBarExampleState(this._selectedIndex);
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Recycle(),
    Pesanan(),
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
          backgroundColor: const Color(0xFFED6055),
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Beranda'),
            BottomNavigationBarItem(
                icon: Icon(Icons.recycling),
                label: 'Daur Ulang'),
            BottomNavigationBarItem(
                icon: Icon(Icons.receipt),
                label: 'Pesanan'),
            BottomNavigationBarItem(
                icon: Icon(Icons.groups_rounded),
                label: 'Komunitas'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Akun'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
          unselectedItemColor: const Color.fromARGB(191, 255, 255, 255),
          selectedLabelStyle: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.normal,
            fontFamily: 'Poppins',
            fontSize: 10,
          ),
          unselectedLabelStyle: const TextStyle(
            color: Color.fromARGB(191, 255, 255, 255),
            fontWeight: FontWeight.normal,
            fontFamily: 'Poppins',
            fontSize: 10,
          ),
          showUnselectedLabels: true,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
