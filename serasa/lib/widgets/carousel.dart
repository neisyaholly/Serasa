import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key, required this.imageURL});

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 380,
      height: 160,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imageURL,
            fit: BoxFit.fill,
          )),
    );
  }
}
