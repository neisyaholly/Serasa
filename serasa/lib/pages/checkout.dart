// ignore: unnecessary_import
// import 'dart:ffi';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:serasa/pages/payment.dart';
import 'package:serasa/widgets/test.dart';
// ignore: unused_import

class Checkout extends StatefulWidget {
  const Checkout({super.key});

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
  int qty = 1;
  String _selectedPaymentMethod = '';

  void incrementQty() {
    setState(() {
      qty++;
    });
  }

  void decrementQty() {
    setState(() {
      if (qty > 1) {
        qty--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFFFEF8),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 50,
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
                              builder: (context) => const Test(),
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "McDonald’s Sentul City",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 30, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/foodProducts/ayam.png',
                          width: 100),
                      const SizedBox(width: 15),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Nama Makanan",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500),
                          ),
                          const Text(
                            "Description",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(
                            height: 17,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 100,
                                child: Text(
                                  "Rp100.000",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                height: 30,
                                width: 118,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFF4F6F8),
                                    border: Border.all(
                                        color:
                                            const Color.fromARGB(123, 0, 0, 0)),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                        padding: const EdgeInsets.all(0),
                                        onPressed: decrementQty,
                                        icon: const Icon(
                                          Icons.remove,
                                          size: 20,
                                        )),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 20,
                                      child: Text('$qty',
                                          style: const TextStyle(fontSize: 16)),
                                    ),
                                    IconButton(
                                        padding: const EdgeInsets.all(0),
                                        onPressed: incrementQty,
                                        icon: const Icon(
                                          Icons.add,
                                          size: 20,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                ),
                Container(
                  height: 1.5,
                  width: 340,
                  color: const Color.fromARGB(49, 152, 152, 152),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ringkasan Pesanan",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.normal),
                          ),
                          Text("Rp10.000.000",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal)),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Pajak",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal)),
                          Text("Rp100.000",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal)),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Ongkos Kirim",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal)),
                          Text("Rp20.000",
                              style: TextStyle(
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal)),
                      Text(
                        "Rp10.120.000",
                        style: TextStyle(
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
                                  Text('Rp9.000',
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
                                    builder: (context) => const PaymentPage(),
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
                            child: const Text("GoPay",
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
                    onPressed: sementara,
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
        ));
  }
}
