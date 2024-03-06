import 'package:flutter/material.dart';
import 'package:serasa/classes/detail_pesanan.dart';
import 'package:serasa/classes/pesanan.dart';
import 'package:serasa/classes/produk_komunitas.dart';
import 'package:serasa/functions/functions.dart';
import 'package:serasa/pages/detailproduk.dart';
import 'package:serasa/pages/navbar.dart';
import 'package:serasa/pages/paymentCommunity.dart';
import 'package:audioplayers/audioplayers.dart';

class Checkout2 extends StatefulWidget {
  const Checkout2({super.key, required this.produkKomunitas});

  final ProdukKomunitas produkKomunitas;

  @override
  State<Checkout2> createState() {
    return _Checkout2();
  }
}

void sementara() {
  return;
}

class _Checkout2 extends State<Checkout2> {
  String _selectedPaymentMethod = 'Cash on Delivery (CoD)';

  List<Pesanan> _pesanans = [];

  late Pesanan pesanan;
  late DetailPesanan detailPesanan;

  @override
  void initState() {
    super.initState();
    _fetchPesanans();
    pesanan =
        Pesanan(null, currentUser!.id, widget.produkKomunitas.userID, 0, 0, 0);
    detailPesanan =
        DetailPesanan(null, _pesanans.length, widget.produkKomunitas.id, 1);
  }

  void _fetchPesanans() async {
    List<Pesanan> fetchedPesanans = await fetchPesanans();
    setState(() {
      _pesanans = fetchedPesanans;
    });
  }

  int ongkosKirim = 0;

  int subtotal = 0;
  int calculateSubtotal() {
    subtotal = 0;
    subtotal = widget.produkKomunitas.harga!;
    return subtotal;
  }

  int total = 0;
  int calculateTotal(int subtotal, int ongkosKirim) {
    total = 0;
    total = subtotal + ongkosKirim;
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 254, 248, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Detailproduk(
                                  produkKomunitas: widget.produkKomunitas),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Color(0xFFED6055),
                          size: 20,
                        ),
                      ),
                      const Text(
                        'Check Out',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Opacity(
                        opacity: 0,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_back,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 18, right: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Image.asset(
                                  widget.produkKomunitas.foto!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(left: 20)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.produkKomunitas.nama.toString(),
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold)),
                                Text("Exp: ${widget.produkKomunitas.exp}",
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    widget.produkKomunitas.foto!,
                                    width: 30,
                                    fit: BoxFit.contain,
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(right: 15)),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("Penjual",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'Poppins',
                                                color: Colors.black54)),
                                        Text(widget.produkKomunitas.name!,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'Poppins',
                                                color: Colors.black)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Padding(
                                            padding: EdgeInsets.only(left: 15)),
                                        Image.asset(
                                            'assets/images/detailProduk/locationsymbol.png',
                                            width: 20),
                                        const Padding(
                                            padding: EdgeInsets.only(right: 5)),
                                        const Text("Lokasi",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'Poppins',
                                                color: Colors.black)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25, bottom: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Pilih Pengambilan Makanan",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                runSpacing: 15.0,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFF4F6F8),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: RadioListTile<String>(
                                      contentPadding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      title: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Ambil Sendiri',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          Text(
                                            'Rp0',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              fontFamily: 'Poppins',
                                            ),
                                          )
                                        ],
                                      ),
                                      value: 'Ambil Sendiri',
                                      groupValue: _selectedPaymentMethod,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedPaymentMethod = value!;
                                          ongkosKirim = 0;
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFF4F6F8),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: RadioListTile<String>(
                                      contentPadding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      title: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('GoSend',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16,
                                                    fontFamily: 'Poppins',
                                                  )),
                                              Text('Diantar ke Alamat Utama',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w100,
                                                    fontSize: 12,
                                                    fontFamily: 'Poppins',
                                                  ))
                                            ],
                                          ),
                                          Text('Rp9000',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                              ))
                                        ],
                                      ),
                                      value: 'GoSend',
                                      groupValue: _selectedPaymentMethod,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedPaymentMethod = value!;
                                          ongkosKirim = 9000;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1.5,
                          width: 1000,
                          color: const Color.fromARGB(49, 152, 152, 152),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Ringkasan Pesanan",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold)),
                              const Padding(
                                  padding: EdgeInsets.only(bottom: 15)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Subtotal",
                                      style: TextStyle(
                                          fontSize: 16, fontFamily: 'Poppins')),
                                  Text("Rp${calculateSubtotal().toString()}",
                                      style: const TextStyle(
                                          fontSize: 16, fontFamily: 'Poppins')),
                                ],
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Ongkos Kirim",
                                      style: TextStyle(
                                          fontSize: 16, fontFamily: 'Poppins')),
                                  Text("Rp20.000",
                                      style: TextStyle(
                                          fontSize: 16, fontFamily: 'Poppins')),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1.5,
                          width: 1000,
                          color: const Color.fromARGB(49, 152, 152, 152),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total",
                                  style: TextStyle(
                                      fontSize: 16, fontFamily: 'Poppins')),
                              Text("Rp10.020.000",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Container(
                          height: 1.5,
                          width: 1000,
                          color: const Color.fromARGB(49, 152, 152, 152),
                          margin: EdgeInsets.only(bottom: 10),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Pilih Metode Pembayaran",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold)),
                                IconButton(
                                    icon: const Icon(
                                      Icons.arrow_forward,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      FocusScope.of(context).unfocus();
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const PaymentCommunity(),
                                        ),
                                      );
                                    }),
                              ],
                            ),
                            const SizedBox(height: 3),
                            Row(
                              children: [
                                Container(
                                  width: 340,
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 15, bottom: 15),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF4F6F8),
                                    border: Border.all(
                                        color: const Color.fromARGB(0, 0, 0, 0),
                                        width: 2.0),
                                    borderRadius: BorderRadius.circular(1.0),
                                  ),
                                  child: const Text("Cash on Delivery (CoD)",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500)),
                                ),
                                // const Text("copas punya ariya nanti disni", style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 1,
                          child: ElevatedButton(
                            onPressed: () {
                              final player = AudioPlayer();
                              player.play(AssetSource('audios/cring.mp3'));
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const BottomNavigationBarExample(
                                          initialIndex: 2),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 244, 99, 88),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const Text("Check Out",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
