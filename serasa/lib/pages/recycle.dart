import 'package:flutter/material.dart';
import 'package:serasa/pages/bankSampahTerdekat.dart';
import 'package:serasa/pages/qr.dart';
import 'package:serasa/pages/riwayatPenukaran.dart';

class Recycle extends StatefulWidget {
  const Recycle({super.key});

  @override
  State<Recycle> createState() => _RecycleState();
}

class _RecycleState extends State<Recycle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Column(
              children: [
                // Text Daur Ulang Sampah Organik
                const SizedBox(
                  child: Text(
                    'Daur Ulang Sampah Organik',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 15),

                // Jumbotron
                Container(
                  width: 350,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber),
                ),
                const SizedBox(height: 20),

                // Scan
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const QRPage(),
                        ),
                      );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 250,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[
                          Color(0xFF6AB384),
                          Color(0xFFF2A096),
                        ],
                      ),
                    ),
                    child: const Text(
                      "SCAN UNTUK TUKAR SAMPAHMU",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Box Poin
                Container(
                  width: 300,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[
                        Color(0xFF6AB384),
                        Color(0xFFF2A096),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 15,
                          right: 10,
                          bottom: 10,
                        ),
                        width: 320,
                        height: 100,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              spreadRadius: -2,
                              blurRadius: 8,
                              offset: const Offset(
                                  0, 2), // changes position of shadow
                            ),
                          ],
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: <Color>[
                              Color(0xFF6AB384),
                              Color(0xFFF2A096),
                            ],
                          ),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sampah Organik yang Sudah Kamu Daur Ulang",
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text("32 Kilogram",
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontFamily: 'Poppins',
                                  fontSize: 27,
                                  fontWeight: FontWeight.w700,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 15,
                          right: 10,
                          bottom: 10,
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Your Poin",
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                )),
                            Text("320",
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontFamily: 'Poppins',
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    children: [
                      // Bank Sampah di Dekat
                      SizedBox(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Bank Sampah Terdekat",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500),
                                ),
                                GestureDetector(
                                  child: Row(
                                    children: [
                                      const Text("Lihat Semua",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.normal)),
                                      Transform.rotate(
                                          angle: 3.14159265358 * (3 / 2),
                                          child: const Icon(
                                            Icons.arrow_drop_down,
                                            size: 20,
                                          )),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const BankSampahTerdekat(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                                left: 20,
                                right: 15,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF51BA6C)
                                        .withOpacity(0.7),
                                    spreadRadius: -1,
                                    blurRadius: 5,
                                    offset: const Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Bank Sampah Serasa",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.normal)),
                                      Text("Rumah Talenta BCA",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.normal)),
                                    ],
                                  ),
                                  Text("0,4 km",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xFF1D8C35))),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      // Riwayat Penukaran
                      SizedBox(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Riwayat Penukaran",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500)),
                                GestureDetector(
                                  child: Row(
                                    children: [
                                      const Text("Lihat Semua",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.normal)),
                                      Transform.rotate(
                                          angle: 3.14159265358 * (3 / 2),
                                          child: const Icon(
                                            Icons.arrow_drop_down,
                                            size: 20,
                                          )),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RiwayatPenukaranSampah(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                                left: 20,
                                right: 15,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFFED6055)
                                        .withOpacity(0.3),
                                    spreadRadius: 0,
                                    blurRadius: 4,
                                    offset: const Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Oktober 31, 2023 12:09:01",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500)),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Daur Ulang 1 Kg",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.normal)),
                                      Text("+10 Poin",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFF1D8C35),
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 20,
                                right: 15,
                                bottom: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFFED6055)
                                        .withOpacity(0.3),
                                    spreadRadius: 0,
                                    blurRadius: 4,
                                    offset: const Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Oktober 31, 2023 12:09:01",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      )),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Daur Ulang 1 Kg",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.normal,
                                          )),
                                      Text("+10 Poin",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFF1D8C35),
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            // Container(
                            //   alignment: Alignment.topLeft,
                            //   padding: const EdgeInsets.all(10),
                            //   decoration: BoxDecoration(
                            //     color: Colors.white,
                            //     borderRadius: BorderRadius.circular(10),
                            //     boxShadow: [
                            //       BoxShadow(
                            //         color: const Color(0xFFED6055).withOpacity(0.5),
                            //         spreadRadius: -2,
                            //         blurRadius: 8,
                            //         offset: const Offset(
                            //             0, 0), // changes position of shadow
                            //       ),
                            //     ],
                            //   ),
                            //   child: const Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       Text("Oktober 31, 2023 12:09:01"),
                            //       Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           Text("Daur Ulang 1 Kg"),
                            //           Text("+10 Poin")
                            //         ],
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
