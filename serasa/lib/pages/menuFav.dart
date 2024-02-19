import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serasa/pages/home.dart';
import 'package:serasa/pages/navbar.dart';
import 'package:serasa/widgets/test.dart';
import 'package:serasa/widgets/widget_menuFav.dart';

class MenuFav extends StatefulWidget {
  const MenuFav({super.key});

  @override
  State<MenuFav> createState() => _MenuFavState();
}

class _MenuFavState extends State<MenuFav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF8),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFFED6055),
                        size: 20,
                      ),
                    ),
                    const Text(
                      'Menu Favorit',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: const Color(0xFFFACFC6),
                      borderRadius: BorderRadius.circular(100)),
                  child: Transform.rotate(
                    angle: 1.57079632679, // 180 degrees in radians
                    child: InkWell(
                        onTap: () {
                          Get.to(() => Test());
                        },
                        child: const Icon(Icons.search,
                            color: Colors.black, size: 20)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Icon(Icons.sort),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Sort By"),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      // shrinkWrap: true,
                      padding: const EdgeInsets.all(0),
                      itemCount: 10,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (_, index) {
                        return const WidgetMenuFav(
                            nama: "nama",
                            resto: "resto",
                            harga1: "harga1",
                            harga2: "harga2");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBarExample(),
    );
  }
}
