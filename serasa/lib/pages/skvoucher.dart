import 'package:flutter/material.dart';
import 'package:serasa/pages/myrewards1.dart';

class Skvoucher extends StatefulWidget {
  const Skvoucher({super.key});

  @override
  State<Skvoucher> createState() {
    return _Skvoucher();
  }
}

void sementara() {
  return;
}

class _Skvoucher extends State<Skvoucher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 254, 248, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const VoucherAktif(),
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
                      'Detail Voucher',
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
                  padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: Column(
                    children: [
                      Container(
                        width: 350,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Center(
                            child: Image.asset(
                                "assets/images/bannerVoucher.jpg",
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                        child: Column(
                          children: [
                            const Text("Nama Voucher",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500)),
                            const Padding(padding: EdgeInsets.only(bottom: 8)),
                            Center(
                              child: Container(
                                width: 280,
                                height: 35,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 203, 219, 26),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: const Center(
                                  child: Text(
                                      "Voucher akan kedaluwarsa dalam 3 hari",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.normal)),
                                ),
                              ),
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
                        padding: EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Deskripsi",
                                style: TextStyle(
                                    fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                            Padding(padding: EdgeInsets.only(bottom: 8)),
                            Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                style: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                                textAlign: TextAlign.justify),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Syarat & Ketentuan",
                                style: TextStyle(
                                    fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                            Padding(padding: EdgeInsets.only(bottom: 8)),
                            Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                style: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                                textAlign: TextAlign.justify),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 342,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 244, 99, 88),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(10),
                          ),
                          child: const Text("Pakai Voucher",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ], //batas col
                  ),
                ),
              ], //paling luar
            ),
          ),
        ),
      ),
    );
  }
}
