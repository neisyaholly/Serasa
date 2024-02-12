import 'package:flutter/material.dart';

class WidgetCommunity extends StatelessWidget {
  const WidgetCommunity(
      {super.key,
      required this.nama,
      required this.harga,
      required this.exp,
      required this.jarak});

  final String nama;
  final String harga;
  final String exp;
  final String jarak;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 160,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFFFFEF8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(1),
              spreadRadius: -4,
              blurRadius: 6,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
          border: Border.all(color: const Color(0xFFFACFC6), width: 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 102,
            decoration: BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.circular(10)),
          ),
          Text(
            nama,
            style: const TextStyle(
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500),
          ),
          Text(
            "Rp$harga",
            style: const TextStyle(
                fontSize: 10,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "exp. $exp",
                style: const TextStyle(
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "$jarak km",
                style: const TextStyle(
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
