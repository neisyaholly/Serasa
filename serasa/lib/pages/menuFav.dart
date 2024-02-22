import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15, right: 30, top: 10),
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
                              builder: (context) =>
                                  const BottomNavigationBarExample(
                                      initialIndex: 0),
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
                          fontSize: 14,
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
                        Icon(
                          Icons.sort,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Sort By",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
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
                              resto: "nama restoran",
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
      ),
      // bottomNavigationBar: BottomNavigationBarExample(),
    );
  }
}
