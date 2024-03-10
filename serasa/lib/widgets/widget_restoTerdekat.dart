import 'package:flutter/material.dart';

class WidgetRestoTerdekat extends StatelessWidget {
  const WidgetRestoTerdekat(
      {super.key,
      required this.nama,
      required this.kategori,
      required this.rate,
      required this.logo,
      required this.jumlahRate,
      required this.jarak});

  final String nama;
  final String kategori;
  final String rate;
  final String logo;
  final String jumlahRate;
  final String jarak;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10, left: 3, right: 3),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0.5,
              blurRadius: 2,
              offset: const Offset(-0.5, 4), // changes position of shadow
            ),
          ],
          border: Border.all(color: const Color(0xFFFACFC6), width: 1)),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                // color: Colors.amber, borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: NetworkImage(logo))),
            width: 75,
            height: 75,
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nama,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Kategori: $kategori",
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Color(0xFFD5AB55),
                    size: 18,
                  ),
                  Text(
                    rate,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    " ($jumlahRate) ",
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    " | $jarak km",
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
