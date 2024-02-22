import 'package:flutter/material.dart';

class WidgetPesanan extends StatelessWidget {
  const WidgetPesanan(
      {super.key,
      required this.nama,
      required this.jumlah,
      required this.jenis,
      required this.harga});

  final String nama;
  final String jumlah;
  final String jenis;
  final String harga;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ],
          border: Border.all(color: const Color(0xFFFACFC6))),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(10)),
            width: 75,
            height: 75,
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            // decoration: const BoxDecoration(color: Colors.amber),
            width: MediaQuery.of(context).size.width * 0.59,
            height: MediaQuery.of(context).size.width * 0.18,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama,
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal,
                      fontSize: 14),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: 6,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (_, index) {
                      return Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                jumlah,
                                style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12),
                              ),
                              const Text(
                                "x ",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12),
                              )
                            ],
                          ),
                          Text(
                            jenis,
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.normal,
                                fontSize: 12),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Text(
                  "Total Harga: Rp$harga",
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
