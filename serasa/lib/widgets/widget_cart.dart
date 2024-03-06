import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:serasa/classes/detail_keranjang.dart';
import 'package:serasa/classes/produk_resto.dart';
import 'package:serasa/classes/resto.dart';
import 'package:serasa/functions/functions.dart';

class WidgetCart extends StatefulWidget {
  const WidgetCart({
    super.key,
    required this.nama,
    required this.jumlah,
    required this.jenis,
    required this.count,
    required this.onTap,
  });

  final Resto nama;
  final List<DetailKeranjang> jumlah;
  final List<DetailKeranjang> jenis;
  final int count;
  final VoidCallback onTap;

  @override
  State<WidgetCart> createState() => _WidgetCartState();
}

class _WidgetCartState extends State<WidgetCart> {
  late List<ProdukResto> _produkRestos = [];

  @override
  void initState() {
    super.initState();
    _fetchProdukRestos();
  }

  void _fetchProdukRestos() async {
    List<ProdukResto> fetchedProdukRestos = await fetchProdukRestos();
    setState(() {
      _produkRestos = fetchedProdukRestos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
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
                    image: DecorationImage(
                        image: NetworkImage(widget.nama.logo!),
                        fit: BoxFit.contain)),
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
                      widget.nama.nama!,
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                          fontSize: 14),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.only(top: 5),
                        itemCount: widget.count,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (_, index) {
                          ProdukResto produkResto = _produkRestos.firstWhere(
                            (detail) =>
                                detail.id == widget.jenis[index].produkID,
                            orElse: () => ProdukResto(-1, -1, "", "", -1, -1,
                                ""), // Default value if not found
                          );

                          return Row(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    widget.jumlah[index].qty.toString(),
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
                                produkResto.nama!,
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
      ),
    );
  }
}
