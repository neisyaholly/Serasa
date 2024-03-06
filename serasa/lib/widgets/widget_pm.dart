import 'package:flutter/material.dart';

class WidgetPM extends StatefulWidget {
  const WidgetPM({
    super.key,
    required this.nama,
    required this.detail,
    required this.harga,
    required this.foto,
  });

  final String nama;
  final String detail;
  final int harga;
  final String foto;

  @override
  State<WidgetPM> createState() => _WidgetPMState();
}

class _WidgetPMState extends State<WidgetPM> {
  int qty = 0;

  void incrementQty() {
    setState(() {
      qty++;
    });
  }

  void decrementQty() {
    setState(() {
      if (qty > 0) {
        qty--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 412,
      padding: const EdgeInsets.only(left: 45, right: 45),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFEDBDBD).withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(image: NetworkImage(widget.foto), fit: BoxFit.contain)),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              // color: Colors.black,
              width: MediaQuery.of(context).size.width / 2 + 25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.nama,
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        widget.detail,
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 11,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rp${widget.harga}',
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 32,
                        margin: const EdgeInsets.only(right: 15),
                        // width: 120,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 35,
                              // color: Colors.blue,
                              child: IconButton(
                                  padding: const EdgeInsets.all(0),
                                  onPressed: decrementQty,
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 15,
                                    color: Colors.black,
                                  )),
                            ),
                            Container(
                              alignment: Alignment.center,
                              // color: Colors.amber,
                              width: 20,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('$qty',
                                      style: const TextStyle(fontSize: 17)),
                                ],
                              ),
                            ),
                            Container(
                              width: 35,
                              // color: Colors.blue,
                              child: IconButton(
                                  padding: const EdgeInsets.all(0),
                                  onPressed: incrementQty,
                                  icon: const Icon(
                                    Icons.add,
                                    size: 15,
                                    color: Colors.black,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
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
