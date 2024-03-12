import 'package:flutter/material.dart';

class WidgetRiwayat extends StatelessWidget {
  const WidgetRiwayat(
      {super.key,
      required this.tanggal,
      required this.jumlah,
      required this.poin});

  final String tanggal;
  final String jumlah;
  final String poin;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 5),
          child: Container(
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
                  color: const Color(0xFFED6055).withOpacity(0.3),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: const Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tanggal,
                    style: const TextStyle(
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Daur Ulang $jumlah Kg",
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                        )),
                    Text("+$poin Poin",
                        style: const TextStyle(
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
        ),
      ],
    );
  }
}
