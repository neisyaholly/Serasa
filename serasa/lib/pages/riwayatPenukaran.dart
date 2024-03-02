import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:serasa/pages/home.dart';
import 'package:serasa/pages/recycle.dart';
import 'package:serasa/widgets/widget_riwayatPenukaran.dart';

class RiwayatPenukaranSampah extends StatefulWidget {
  const RiwayatPenukaranSampah({super.key});

  @override
  State<RiwayatPenukaranSampah> createState() => _RiwayatPenukaranSampahState();
}

class _RiwayatPenukaranSampahState extends State<RiwayatPenukaranSampah> {
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
                        builder: (context) => const Recycle(),
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
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      // color: Colors.amber,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(0),
                        itemCount: 10,
                        itemBuilder: (_, index) {
                          return const WidgetRiwayat(
                              tanggal: "Oktober 31, 2023",
                              jumlah: "1",
                              poin: "10");
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
