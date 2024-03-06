import 'package:flutter/material.dart';
import 'package:serasa/classes/detail_keranjang.dart';
import 'package:serasa/classes/produk_resto.dart';
import 'package:serasa/classes/resto.dart';
import 'package:serasa/functions/functions.dart';
import 'package:serasa/pages/cart.dart';
import 'package:serasa/pages/navbar.dart';
import 'package:serasa/pages/payment.dart';
import 'package:audioplayers/audioplayers.dart';

// ignore: must_be_immutable
class Checkout extends StatefulWidget {
  Checkout(
      {super.key,
      required this.resto,
      required this.detailkeranjangs,
      this.selectedPaymentMethod,
      this.selectedPaymentIndex});

  final Resto resto;
  final List<DetailKeranjang> detailkeranjangs;
  String? selectedPaymentMethod;
  int? selectedPaymentIndex;

  @override
  State<Checkout> createState() {
    return _Checkout();
  }
}

//biar onpressed button back nya ga error
void sementara() {
  return;
}

class _Checkout extends State<Checkout> {
  late List<ProdukResto> _produkRestos = [];

  @override
  void initState() {
    super.initState();
    _fetchProdukRestos();
    widget.selectedPaymentIndex = 0;
    widget.selectedPaymentMethod = 'Gopay';
  }

  void _fetchProdukRestos() async {
    List<ProdukResto> fetchedProdukRestos = await fetchProdukRestos();
    setState(() {
      _produkRestos = fetchedProdukRestos;
    });
  }

  String _selectedPaymentMethod = 'GoSend';

  void incrementQty(int index) {
    setState(() {
      widget.detailkeranjangs[index].qty =
          widget.detailkeranjangs[index].qty! + 1;
    });
  }

  void decrementQty(int index) {
    setState(() {
      if (widget.detailkeranjangs[index].qty! > 1) {
        widget.detailkeranjangs[index].qty =
            widget.detailkeranjangs[index].qty! - 1;
      }
    });
  }

  int subtotal = 0;
  int calculateSubtotal() {
    subtotal = 0;
    widget.detailkeranjangs.forEach((detailKeranjang) {
      ProdukResto produkResto = _produkRestos.firstWhere(
        (detail) => detail.id == detailKeranjang.produkID,
        orElse: () => ProdukResto(-1, -1, "", "", -1, -1, ""),
      );
      subtotal += produkResto.harga! * detailKeranjang.qty!;
    });
    return subtotal;
  }

  double pajak = 0;
  double calculatePajak(int subtotal) {
    pajak = 0;
    pajak = subtotal * 0.11;
    return pajak;
  }

  int ongkosKirim = 0;

  double total = 0.0;
  double calculateTotal(int subtotal, double pajak, int ongkosKirim) {
    total = 0.0;
    total = subtotal + pajak + ongkosKirim;
    return total;
  }

  double calculateListViewHeight() {
    double totalHeight = 0;
    for (int i = 0; i < widget.detailkeranjangs.length; i++) {
      totalHeight += calculateItemHeight(i);
    }
    return totalHeight;
  }

  double calculateItemHeight(int index) {
    // Calculate the height of each item based on its content
    // For example, you can estimate the height based on the content or use a fixed value
    return 135; // Use your own calculation here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFFEF8),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Cart(),
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
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        widget.resto.nama!,
                        style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700),
                      )),
                  Container(
                    width: 400,
                    height: calculateListViewHeight(),
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    // decoration: BoxDecoration(color: Colors.amber),
                    child: Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.only(top: 5),
                          itemCount: widget.detailkeranjangs.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (_, index) {
                            ProdukResto produkResto = _produkRestos.firstWhere(
                              (detail) =>
                                  detail.id ==
                                  widget.detailkeranjangs[index].produkID,
                              orElse: () => ProdukResto(-1, -1, "", "", -1, -1,
                                  ""), // Default value if not found
                            );
                            return Column(
                              children: [
                                Container(
                                  // margin:
                                  //     const EdgeInsets.only(left: 35, right: 35),
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        child: Image.network(
                                          produkResto.foto!,
                                          // width: 100,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              produkResto.nama!,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              produkResto.deskripsi!,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'Poppins',
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            const SizedBox(
                                              height: 17,
                                            ),
                                            Container(
                                              // color: Colors.amber,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: 100,
                                                    child: Text(
                                                      produkResto.harga
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 32,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFFEEEEEE),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      border: Border.all(
                                                          color: const Color
                                                              .fromARGB(
                                                              123, 0, 0, 0)),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Container(
                                                          width: 35,
                                                          // color: Colors.blue,
                                                          child: IconButton(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(0),
                                                              onPressed: () {
                                                                decrementQty(
                                                                    index);
                                                              },
                                                              icon: const Icon(
                                                                Icons.remove,
                                                                size: 15,
                                                                color: Colors
                                                                    .black,
                                                              )),
                                                        ),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          // color: Colors.amber,
                                                          width: 20,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                  widget
                                                                      .detailkeranjangs[
                                                                          index]
                                                                      .qty
                                                                      .toString(),
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          17)),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 35,
                                                          // color: Colors.blue,
                                                          child: IconButton(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(0),
                                                              onPressed: () {
                                                                incrementQty(
                                                                    index);
                                                              },
                                                              icon: const Icon(
                                                                Icons.add,
                                                                size: 15,
                                                                color: Colors
                                                                    .black,
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 1.5,
                                  width: 345,
                                  margin: EdgeInsets.only(top: 5),
                                  color:
                                      const Color.fromARGB(49, 152, 152, 152),
                                ),
                              ],
                            );
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Tambahkan Kode Promo",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 240,
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 12),
                                  hintText: "Masukkan Kode Promo",
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(123, 0, 0, 0)),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(123, 0, 0, 0)),
                                  ),
                                  hintStyle: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xFFF4F6F8),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: sementara,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFF4F6F8),
                                elevation: 0,
                                foregroundColor: Colors.black,
                                side: const BorderSide(
                                    color: Color.fromARGB(123, 0, 0, 0)),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.only(
                                    top: 14, bottom: 14, left: 10, right: 10),
                              ),
                              child: const Text("Terapkan",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.normal)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 33),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Pilih Pengambilan Makanan",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Wrap(
                          runSpacing: 15.0,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFFF4F6F8),
                                shape: BoxShape.rectangle,
                              ),
                              child: RadioListTile<String>(
                                contentPadding:
                                    const EdgeInsets.only(left: 15, right: 15),
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
                                contentPadding:
                                    const EdgeInsets.only(left: 15, right: 15),
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
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Ringkasan Pesanan",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Subtotal",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal),
                            ),
                            Text("Rp${calculateSubtotal().toString()}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal)),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Pajak",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal)),
                            Text("Rp${calculatePajak(subtotal).toInt()}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal)),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Ongkos Kirim",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal)),
                            Text("Rp${ongkosKirim.toString()}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 1.5,
                    width: 340,
                    color: const Color.fromARGB(49, 152, 152, 152),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Total",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.normal)),
                        Text(
                          "Rp${calculateTotal(subtotal, pajak, ongkosKirim).toInt()}",
                          style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Column(
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
                                      builder: (context) => PaymentPage(
                                        resto: widget.resto,
                                        detailkeranjangs:
                                            widget.detailkeranjangs,
                                        selectedPaymentMethod:
                                            widget.selectedPaymentMethod,
                                      ),
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
                              child: Text(
                                  widget.selectedPaymentMethod.toString(),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    height: 1.5,
                    width: 340,
                    color: const Color.fromARGB(49, 152, 152, 152),
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    width: 300,
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
                        backgroundColor: const Color.fromARGB(255, 244, 99, 88),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.all(10),
                      ),
                      child: const Text("Check Out",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
