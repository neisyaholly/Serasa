import 'package:flutter/material.dart';
import 'package:serasa/classes/riwayatTukarSampah.dart';
import 'package:serasa/classes/bankSampah.dart';
import 'package:serasa/pages/bankSampahTerdekat.dart';
import 'package:serasa/pages/qr.dart';
import 'package:serasa/pages/riwayatPenukaran.dart';
import 'package:serasa/functions/functions.dart';
import 'package:serasa/service/http_service.dart';
import 'package:intl/intl.dart';

class Recycle extends StatefulWidget {
  const Recycle({super.key});

  @override
  State<Recycle> createState() => _RecycleState();
}

class _RecycleState extends State<Recycle> {
  late Future<List<RiwayatTukarSampah>> _riwayatTukarSampahFuture;
  late final Future<List<BankSampah>> _bankSampahFuture =
      fetchBankSampahFromAPI();
  double totalWeight = 0.0;

  @override
  void initState() {
    super.initState();
    _riwayatTukarSampahFuture = fetchRiwayatTukarSampah();
    // _bankSampahFuture = fetchBankSampahFromAPI();
  }

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
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QRPage(),
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
                FutureBuilder<List<RiwayatTukarSampah>>(
                  future: _riwayatTukarSampahFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      final List<RiwayatTukarSampah> riwayatTukarSampahs =
                          snapshot.data!;
                      final List<RiwayatTukarSampah> riwayatTukarSampah = riwayatTukarSampahs.where((riwayat) => riwayat.userID == currentUser!.id).toList();
                      totalWeight = riwayatTukarSampah.isNotEmpty
                          ? riwayatTukarSampah
                              .map<double>((e) => (e.berat ?? 0).toDouble())
                              .reduce((a, b) => a + b)
                          : 0;
                      return Container(
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Sampah Organik yang Sudah Kamu Daur Ulang",
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text("$totalWeight Kilogram",
                                      style: const TextStyle(
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Your Poin",
                                      style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontFamily: 'Poppins',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  Text("${currentUser?.poin ?? '0'}",
                                      style: const TextStyle(
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
                      );
                    }
                  },
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
                              child: FutureBuilder<List<BankSampah>>(
                                future: _bankSampahFuture,
                                builder: (context, snapshot) {
                                  // List<BankSampah> bankSampahList = [];
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Container();
                                  } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else if (snapshot.hasData) {
                                    final List<BankSampah> bankSampahList =
                                        snapshot.data!;
                                    final bank = bankSampahList.firstWhere(
                                        (element) => element.id == 1,
                                        orElse: () => BankSampah(null, "", ""));
                                    final String? bankName = bank.nama;
                                    if (bankName != null) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Bank Sampah Serasa",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              Text(
                                                bankName,
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Text(
                                            "0,4 km",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xFF1D8C35),
                                            ),
                                          ),
                                        ],
                                      );
                                    } else {
                                      return const Text('No data found');
                                    }
                                  }
                                  return Container();
                                },
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
                            FutureBuilder<List<RiwayatTukarSampah>>(
                              future: _riwayatTukarSampahFuture,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Container();
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else if (snapshot.hasData) {
                                  final List<RiwayatTukarSampah> riwayatList =
                                      snapshot.data!;
                                  final top2RiwayatList =
                                      riwayatList.take(2).toList();
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: top2RiwayatList.map((riwayat) {
                                      return Container(
                                        margin: const EdgeInsets.only(
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
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              riwayat.created_at != null
                                                  ? DateFormat(
                                                          'MMMM dd, yyyy HH:mm')
                                                      .format(DateTime.parse(
                                                          riwayat
                                                              .created_at!))
                                                  : 'No Date',
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  fontFamily: 'Poppins',
                                                  fontWeight:
                                                      FontWeight.w500),
                                            ),
                                            const SizedBox(height: 5),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Daur Ulang ${riwayat.berat} Kg",
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                                Text(
                                                  "+${riwayat.berat! * 10} Poin",
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.w700,
                                                    color:
                                                        Color(0xFF1D8C35),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  );
                                }
                                return Container();
                              },
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
             ],
        ),
      ),
    ),
      ),
    );
  }
}
