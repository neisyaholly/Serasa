import 'package:flutter/material.dart';
import 'package:serasa/classes/detail_pesanan.dart';

class PopUpRiwayat extends StatefulWidget {
  const PopUpRiwayat(
      {super.key, required this.closePopUp, required this.popupParams});

  final VoidCallback closePopUp;
  final Map<String, dynamic> popupParams;

  @override
  State<PopUpRiwayat> createState() => _PopUpRiwayatState();
}

class _PopUpRiwayatState extends State<PopUpRiwayat> {
  @override
  Widget build(BuildContext context) {
    String nama = widget.popupParams['nama'];
    List<DetailPesanan> jumlah = widget.popupParams['jumlah'];
    List<String> namaProduk = widget.popupParams['namaProduk'];
    int totalHarga = widget.popupParams['totalHarga'];
    String foto = widget.popupParams['foto'];
    String status = widget.popupParams['status'];
    List<int> harga = widget.popupParams['harga'];
    int subtotal = widget.popupParams['subtotal'];
    int pajak = widget.popupParams['pajak'];
    int ongkir = widget.popupParams['ongkir'];
    String pembayaran = widget.popupParams['pembayaran'];
    print(nama);
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 70, left: 24, right: 24),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: widget.closePopUp,
            child: Container(
              alignment: Alignment.topRight,
              child: const Text("x",
                  style: TextStyle(color: Color(0xFFED6055), fontSize: 24)),
            ),
          ),
          Column(
            children: [
              const Text("Ringkasan Pesanan",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xFF2F2D2C))),
              Text(nama,
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Color(0xFF2F2D2C))),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Status Pesanan",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Color(0xFF2F2D2C))),
              Text(status,
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Color(0xFF2F2D2C))),
            ],
          ),
          Container(
            height: jumlah.length * 20.0,
            child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: jumlah.length,
                itemBuilder: (_, index) {
                  return Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${jumlah[index].qty}x",
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xFF2F2D2C))),
                        Container(
                          width: 250,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(namaProduk[index],
                                  style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: Color(0xFF2F2D2C))),
                            ],
                          ),
                        ),
                        Text(harga[index].toString(),
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xFF2F2D2C))),
                      ],
                    ),
                  );
                }),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Subtotal",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Color(0xFF2F2D2C))),
                  Text(subtotal.toString(),
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: Color(0xFF2F2D2C))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Pajak",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Color(0xFF2F2D2C))),
                  Text(pajak.toString(),
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: Color(0xFF2F2D2C))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Ongkos",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Color(0xFF2F2D2C))),
                  Text(ongkir.toString(),
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: Color(0xFF2F2D2C))),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.black.withOpacity(0.3),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                      color: Color(0xFF2F2D2C))),
              Text(totalHarga.toString(),
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Color(0xFF2F2D2C))),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Pembayaran",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Color(0xFF2F2D2C))),
              Text(pembayaran,
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Color(0xFF2F2D2C))),
            ],
          ),
        ],
      ),
    );
  }
}
