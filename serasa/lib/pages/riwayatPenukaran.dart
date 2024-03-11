import 'package:flutter/material.dart';
import 'package:serasa/classes/riwayatTukarSampah.dart';
import 'package:serasa/pages/navbar.dart';
import 'package:serasa/widgets/widget_riwayatPenukaran.dart';
import 'package:serasa/functions/functions.dart';

class RiwayatPenukaranSampah extends StatefulWidget {
  const RiwayatPenukaranSampah({super.key});

  @override
  State<RiwayatPenukaranSampah> createState() => _RiwayatPenukaranSampahState();
}

class _RiwayatPenukaranSampahState extends State<RiwayatPenukaranSampah> {
  late Future<List<RiwayatTukarSampah>> _riwayatFuture;

  @override
  void initState() {
    super.initState();
    _riwayatFuture = fetchRiwayatTukarSampah();
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Januari';
      case 2:
        return 'Februari';
      case 3:
        return 'Maret';
      case 4:
        return 'April';
      case 5:
        return 'Mei';
      case 6:
        return 'Juni';
      case 7:
        return 'Juli';
      case 8:
        return 'Agustus';
      case 9:
        return 'September';
      case 10:
        return 'Oktober';
      case 11:
        return 'November';
      case 12:
        return 'Desember';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF74B06D),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 55, left: 15, right: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomNavigationBarExample(initialIndex: 1),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0xFFFFFEF8),
                    size: 20,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: 140,
                  height: 140,
                  decoration: const BoxDecoration(color: Colors.amber),
                ),
                Opacity(
                  opacity: 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFFED6055),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              decoration: const BoxDecoration(
                  color: Color(0xFFFFFEF8),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Column(
                children: [
                  const Text("Riwayat Penukaran",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: const Row(
                      children: [
                        Icon(Icons.sort),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Sort By",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 13,
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: FutureBuilder<List<RiwayatTukarSampah>>(
                      future: _riwayatFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Container();
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        } else if (snapshot.hasData) {
                          final List<RiwayatTukarSampah> riwayatLists = snapshot.data!;
                          final List<RiwayatTukarSampah> riwayatList = riwayatLists.where((riwayat) => riwayat.userID == currentUser!.id).toList();
                          return ListView.builder(
                            padding: const EdgeInsets.all(0),
                            itemCount: riwayatList.length,
                            itemBuilder: (context, index) {
                              final riwayat = riwayatList[index];
                              final DateTime? createdAt = riwayat.created_at != null ? DateTime.parse(riwayat.created_at!) : null;
                              final formattedDate = createdAt != null ? "${createdAt.day} ${_getMonthName(createdAt.month)}, ${createdAt.year}" : '';
                              final jumlah = riwayat.berat ?? 0;
                              final poin = jumlah * 10;

                              return WidgetRiwayat(
                                tanggal: formattedDate,
                                jumlah: jumlah.toString(),
                                poin: poin.toString(),
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: Text('No data available'),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}