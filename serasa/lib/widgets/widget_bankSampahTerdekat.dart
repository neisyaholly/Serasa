import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetBankSampahTerdekat extends StatelessWidget {
  const WidgetBankSampahTerdekat(
      {super.key,
      required this.nama,
      required this.daerah,
      required this.jarak});

  final String nama;
  final String daerah;
  final String jarak;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              color: const Color(0xFF51BA6C).withOpacity(0.7),
              spreadRadius: -1,
              blurRadius: 5,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Bank Sampah $nama",
                    style: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal)),
                Text(daerah,
                    style: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal)),
              ],
            ),
            Text("$jarak km",
                style: const TextStyle(
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF1D8C35))),
          ],
        ),
      ),
    );
  }
}
