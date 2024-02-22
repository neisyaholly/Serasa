import 'package:flutter/material.dart';

class WidgetPR extends StatelessWidget {
  const WidgetPR({super.key, required this.nama, required this.detail, required this.harga});

  final String nama;
  final String detail;
  final String harga;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFEDBDBD).withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(10)),
          ),
          const SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(nama),
              Text(detail),
              Row(
                children: [
                  Text(harga),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}