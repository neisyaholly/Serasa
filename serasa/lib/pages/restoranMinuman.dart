import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serasa/pages/navbar.dart';
import 'package:serasa/widgets/test.dart';

class RestoranMinuman extends StatefulWidget {
  const RestoranMinuman({super.key});

  @override
  State<RestoranMinuman> createState() => _RestoranMinumanState();
}

class _RestoranMinumanState extends State<RestoranMinuman> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFFEF8),
        body: SafeArea(
          child: SingleChildScrollView(
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
                            'Restoran Dengan Minuman',
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
                                Get.to(() => const Test());
                              },
                              child: const Icon(Icons.search,
                                  color: Colors.black, size: 20)),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
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
                        // box resto
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 3, right: 3),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 0.5,
                                  blurRadius: 2,
                                  offset: const Offset(
                                      -0.5, 4), // changes position of shadow
                                ),
                              ],
                              border: Border.all(
                                  color: const Color(0xFFFACFC6), width: 1)),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/restoran/janjiw.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                width: 75,
                                height: 75,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Janji Jiwa Jungleland Sentul",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Kategori: Minuman, Roti",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Color(0xFFD5AB55),
                                        size: 18,
                                      ),
                                      Text(
                                        "4.7",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        " 150 ",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        " | 5 km",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 3, right: 3),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 0.5,
                                  blurRadius: 2,
                                  offset: const Offset(
                                      -0.5, 4), // changes position of shadow
                                ),
                              ],
                              border: Border.all(
                                  color: const Color(0xFFFACFC6), width: 1)),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/restoran/boost.jpg'),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                width: 75,
                                height: 75,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Boost Juice Bar AEON Sentul",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Kategori: Minuman",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Color(0xFFD5AB55),
                                        size: 18,
                                      ),
                                      Text(
                                        "4.9",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        " 250 ",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        " | 6 km",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 3, right: 3),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 0.5,
                                  blurRadius: 2,
                                  offset: const Offset(
                                      -0.5, 4), // changes position of shadow
                                ),
                              ],
                              border: Border.all(
                                  color: const Color(0xFFFACFC6), width: 1)),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/restoran/chatime.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                width: 75,
                                height: 75,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Chatime AEON Sentul",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Kategori: Minuman",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Color(0xFFD5AB55),
                                        size: 18,
                                      ),
                                      Text(
                                        "4.9",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        " 150 ",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        " | 5 km",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 3, right: 3),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 0.5,
                                  blurRadius: 2,
                                  offset: const Offset(
                                      -0.5, 4), // changes position of shadow
                                ),
                              ],
                              border: Border.all(
                                  color: const Color(0xFFFACFC6), width: 1)),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/restoran/krispy_kreme.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                width: 75,
                                height: 75,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Krispy Kreme AEON Sentul",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Kategori: Roti, Camilan,Minuman",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Color(0xFFD5AB55),
                                        size: 18,
                                      ),
                                      Text(
                                        "4.9",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        " 150 ",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        " | 5 km",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 3, right: 3),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 0.5,
                                  blurRadius: 2,
                                  offset: const Offset(
                                      -0.5, 4), // changes position of shadow
                                ),
                              ],
                              border: Border.all(
                                  color: const Color(0xFFFACFC6), width: 1)),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/restoran/subway.jpg'),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                width: 75,
                                height: 75,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Subway AEON Sentul",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Kategori: Roti, Minuman",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Color(0xFFD5AB55),
                                        size: 18,
                                      ),
                                      Text(
                                        "4.9",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        " 150 ",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        " | 5 km",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 3, right: 3),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 0.5,
                                  blurRadius: 2,
                                  offset: const Offset(
                                      -0.5, 4), // changes position of shadow
                                ),
                              ],
                              border: Border.all(
                                  color: const Color(0xFFFACFC6), width: 1)),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/restoran/starbucks.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                width: 75,
                                height: 75,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Starbucks Sentul City",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Kategori: Minuman, Roti",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Color(0xFFD5AB55),
                                        size: 18,
                                      ),
                                      Text(
                                        "4.9",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        " 150 ",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        " | 5 km",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 3, right: 3),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 0.5,
                                  blurRadius: 2,
                                  offset: const Offset(
                                      -0.5, 4), // changes position of shadow
                                ),
                              ],
                              border: Border.all(
                                  color: const Color(0xFFFACFC6), width: 1)),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/restoran/burger_king.jpeg'),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                width: 75,
                                height: 75,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Burger King, West Sentul",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Kategori: Nasi, Minuman",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Color(0xFFD5AB55),
                                        size: 18,
                                      ),
                                      Text(
                                        "4.7",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        " 150 ",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        " | 5 km",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 3, right: 3),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 0.5,
                                  blurRadius: 2,
                                  offset: const Offset(
                                      -0.5, 4), // changes position of shadow
                                ),
                              ],
                              border: Border.all(
                                  color: const Color(0xFFFACFC6), width: 1)),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/restoran/gacoan.jpeg'),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                width: 75,
                                height: 75,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Mie Gacoan, Bogor",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Kategori: Nasi, Minuman",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Color(0xFFD5AB55),
                                        size: 18,
                                      ),
                                      Text(
                                        "4.6",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        " 150 ",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        " | 5 km",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
