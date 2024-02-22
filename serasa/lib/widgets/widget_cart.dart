import 'package:flutter/material.dart';

class WidgetCart extends StatelessWidget {
  const WidgetCart(
      {super.key,
      required this.nama,
      required this.jumlah,
      required this.jenis});

  final String nama;
  final String jumlah;
  final String jenis;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      // color: Colors.amber,
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
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
        padding: const EdgeInsets.all(3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(10)),
              width: 75,
              height: 75,
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              // decoration: const BoxDecoration(color: Colors.amber),
              padding: EdgeInsets.symmetric(vertical: 10),
              width: MediaQuery.of(context).size.width * 0.56,
              height: MediaQuery.of(context).size.width * 0.24,
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
                      padding: const EdgeInsets.only(top: 5),
                      itemCount: 3,
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
                  const Text(
                    "...",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
