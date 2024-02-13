import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:serasa/pages/checkout.dart';
import 'package:serasa/pages/help.dart';
import 'package:serasa/pages/menuFav.dart';
// import 'package:serasa/pages/payment.dart';
// import 'package:get/get.dart';
import 'package:serasa/widgets/carousel.dart';
import 'package:serasa/widgets/kategori.dart';
import 'package:serasa/utils/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isExpanded = false;

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF8),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            // height: 1000,
            margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Column(
              children: [
                // ATAS
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.color2,
                        ),
                        Text(
                          "Lokasi",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.currency_bitcoin_rounded,
                          color: AppColors.color3,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("320 Poin",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // TEXT SAMBUTAN
                Container(
                  alignment: Alignment.topLeft,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hai, Nathasya!",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            fontFamily: 'Poppins',
                          )),
                      Text("Sudah Siap Menjadi Food Hero Hari Ini?",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            fontFamily: 'Poppins',
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // SEARCH BAR
                SizedBox(
                  height: 30,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 10),
                      filled: true,
                      fillColor: AppColors.color4,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Checkout(),
                            ),
                          );
                        },
                        child: Transform.rotate(
                          angle: 1.57079632679, // 180 degrees in radians
                          child: const Icon(Icons.search,
                              color: Colors.black, size: 20),
                        ),
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),

                const SizedBox(height: 15),
                // KATEGORI
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Kategori(text: "Nasi"),
                    Kategori(text: "Minuman"),
                    Kategori(text: "Roti"),
                    Kategori(text: "Mie"),
                    Kategori(text: "Cemilan"),
                  ],
                ),
                const SizedBox(height: 15),
                // CAROUSEL

                CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1.1,
                    autoPlay: true,
                  ),
                  items: const [
                    Carousel(imageURL: 'assets/images/carousel1.png'),
                    Carousel(imageURL: 'assets/images/carousel2.png'),
                    Carousel(imageURL: 'assets/images/carousel3.png'),
                  ],
                ),

                const SizedBox(height: 15),
                // Restoran Terdekat
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Restoran Terdekat",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins'),
                        ),
                        Row(
                          children: [
                            const Text(
                              "Lihat Semua",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal),
                            ),
                            Transform.rotate(
                                angle: 3.14159265358 * (3 / 2),
                                child: const Icon(
                                  Icons.arrow_drop_down,
                                  size: 20,
                                )),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 60,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 15),
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.amberAccent,
                                borderRadius: BorderRadius.circular(10)),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                // Menu Favorit
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Menu Favorit",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins'),
                        ),
                        GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MenuFav(),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              const Text(
                                "Lihat Semua",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal),
                              ),
                              Transform.rotate(
                                  angle: 3.14159265358 * (3 / 2),
                                  child: const Icon(
                                    Icons.arrow_drop_down,
                                    size: 20,
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 60,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 15),
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.amberAccent,
                                borderRadius: BorderRadius.circular(10)),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                // Lihat Semua Restoran
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Lihat Semua Restoran",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins'),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isExpanded = !_isExpanded; // Toggle the state
                            });
                            Future.delayed(const Duration(milliseconds: 300),
                                () {
                              _scrollController.animateTo(
                                _scrollController.position.maxScrollExtent,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeOut,
                              );
                            });
                          },
                          child: Row(
                            children: [
                              const Text(
                                "Lihat Semua ",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Poppins'),
                              ),
                              Icon(
                                _isExpanded
                                    ? Icons.arrow_drop_up
                                    : Icons.arrow_drop_down,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: List.generate(2, (rowIndex) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(5, (index) {
                                return Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.amberAccent,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                );
                              }),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                          ],
                        );
                      }),
                    ),
                  ],
                ),
                if (_isExpanded)
                  Column(
                    children: List.generate(2, (rowIndex) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(5, (index) {
                              return Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.amberAccent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              );
                            }),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      );
                    }),
                  ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
