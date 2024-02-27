import 'package:flutter/material.dart';

class Kategori extends StatelessWidget {
  const Kategori({super.key, required this.text, required this.image});
  final String image;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)),
          child: Image.asset(image),
        ),
        Text(
          text,
          style: const TextStyle(
              fontSize: 10,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
