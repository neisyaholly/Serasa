import 'package:flutter/material.dart';
import 'package:serasa/classes/detail_pesanan.dart';
import 'package:serasa/classes/produk_resto.dart';

class WidgetPesanan extends StatelessWidget {
  const WidgetPesanan(
      {super.key,
      required this.nama,
      required this.jumlah,
      required this.namaProduk,
      required this.totalHarga,
      required this.foto,
      required this.status,
      required this.harga,
      required this.subtotal,
      required this.pajak,
      required this.ongkir,
      required this.pembayaran,
      this.onPressed});

  final String nama;
  final List<DetailPesanan> jumlah;
  final List<String> namaProduk;
  final int totalHarga;
  final String foto;
  final String status;
  final List<int> harga;
  final int subtotal;
  final int pajak;
  final int ongkir;
  final String pembayaran;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
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
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              width: 75,
              height: 75,
              child: Image.network(
                foto,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              // decoration: const BoxDecoration(color: Colors.amber),
              width: MediaQuery.of(context).size.width * 0.59,
              height: MediaQuery.of(context).size.width * 0.18,
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
                      padding: const EdgeInsets.all(0),
                      itemCount: namaProduk.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (_, index) {
                        return Row(
                          children: [
                            Row(
                              children: [
                                Text(
                                  jumlah[index].qty.toString(),
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
                              namaProduk[index],
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
                  Text(
                    "Total Harga: Rp$totalHarga",
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
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
