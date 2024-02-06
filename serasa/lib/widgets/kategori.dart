import 'package:flutter/material.dart';

class Kategori extends StatelessWidget {
  const Kategori({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.amberAccent,
              borderRadius: BorderRadius.circular(10)),
        ),
        Text(
          text,
          style: const TextStyle(
              fontSize: 10, fontFamily: 'Poppins', fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
