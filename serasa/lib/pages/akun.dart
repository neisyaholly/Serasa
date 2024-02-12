// import 'dart:ffi';
import 'package:flutter/material.dart';
// import 'package:get/utils.dart';
import 'package:serasa/utils/color.dart';

class Akun extends StatefulWidget {
  const Akun({super.key});

  @override
  State<Akun> createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  bool _expanded1 = false; // Flag to track if the container is expanded
  bool _expanded2 = false;
  bool _expanded3 = false; // Flag to track if the container is expanded
  bool _expanded4 = false;

  void _toggleExpanded1() {
    setState(() {
      _expanded1 = !_expanded1; // Toggle the flag
    });
  }

  void _toggleExpanded2() {
    setState(() {
      _expanded2 = !_expanded2; // Toggle the flag
    });
  }

  void _toggleExpanded3() {
    setState(() {
      _expanded3 = !_expanded3; // Toggle the flag
    });
  }

  void _toggleExpanded4() {
    setState(() {
      _expanded4 = !_expanded4; // Toggle the flag
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF8),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              // Profile and Account
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: const Color(0xFFFBDED7),
                    padding: const EdgeInsets.only(
                        top: 55, left: 33, right: 33, bottom: 30),
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.amber),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Nathasya Rizandi",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.currency_bitcoin_rounded,
                              color: AppColors.color3,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("320 Poin",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 55,
                      right: 45,
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("AKUN",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Poppins',
                                fontSize: 18)),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Nomor Telepon",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                fontSize: 14)),
                        Text("+6285290153677",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Poppins',
                                fontSize: 10,
                                color: Color(0xFFED6055))),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Email",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                fontSize: 14)),
                        Text("Nathasya.edu@gmail.com",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Poppins',
                                fontSize: 10,
                                color: Color(0xFFED6055))),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Alamat utama",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                fontSize: 14)),
                        Text("Rumah Talenta BCA",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Poppins',
                                fontSize: 10,
                                color: Color(0xFFED6055))),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Box Kontribusi
              Container(
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFED6055))),
                height: 110,
                width: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                      width: 350,
                      height: 30,
                      alignment: Alignment.centerLeft,
                      decoration: const BoxDecoration(
                          color: Color(0xFFFBDED7),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: const Text(
                          "Kontribusimu kepada Sesama & Lingkungan",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins',
                              fontSize: 13)),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(10),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Kamu menyelamatkan 0 makanan",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Poppins',
                                  fontSize: 11)),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Kamu menghemat Rp0",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Poppins',
                                  fontSize: 11)),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Kamu mengurangi 0 kg sampah sisa makanan",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Poppins',
                                  fontSize: 11)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),

              // Box Reward Saya
              Container(
                padding: const EdgeInsets.all(10),
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFED6055),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.confirmation_num_outlined,
                      color: Color(0xFFFFFFFF),
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Reward Saya",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins',
                            fontSize: 17,
                            color: Color(0xFFFFFFFF))),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // 4 Button
              SizedBox(
                width: 350,
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.amber),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text("Edit Profil",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Poppins',
                                fontSize: 10,
                              ))
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.amber),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text("Alamat",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Poppins',
                                fontSize: 10,
                              ))
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.amber),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text("Pengaturan",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Poppins',
                                fontSize: 10,
                              ))
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.amber),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text("Bantuan",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Poppins',
                                fontSize: 10,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Frequently Asked Questions
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: const Color(0xFFFF9390),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 5),
                      child: const Text("Frequently Asked Questions",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins',
                            fontSize: 14,
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 5, left: 10, right: 5, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      width: 330,
                      height: _expanded1 ? 140 : 36,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                  "Bagaimana cara menukarkan sampah organik saya?",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                  )),
                              SizedBox(
                                width: 25,
                                height: 25,
                                child: GestureDetector(
                                  onTap: _toggleExpanded1,
                                  child: IconButton(
                                    padding: const EdgeInsets.all(0),
                                    onPressed: null,
                                    icon: Icon(
                                      _expanded1
                                          ? Icons.keyboard_arrow_up_rounded
                                          : Icons.keyboard_arrow_down_rounded,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (_expanded1) // Show additional text if the container is expanded
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(
                                  color: Colors.black,
                                ),
                                Text(
                                  "Text lainnya...",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 5, left: 10, right: 5, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      width: 330,
                      height: _expanded2 ? 140 : 36,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                  "Bagaimana cara menukarkan sampah organik saya?",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                  )),
                              SizedBox(
                                width: 25,
                                height: 25,
                                child: GestureDetector(
                                  onTap: _toggleExpanded2,
                                  child: IconButton(
                                    padding: const EdgeInsets.all(0),
                                    onPressed: null,
                                    icon: Icon(
                                      _expanded2
                                          ? Icons.keyboard_arrow_up_rounded
                                          : Icons.keyboard_arrow_down_rounded,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (_expanded2) // Show additional text if the container is expanded
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(
                                  color: Colors.black,
                                ),
                                Text(
                                  "Text lainnya...",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 5, left: 10, right: 5, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      width: 330,
                      height: _expanded3 ? 140 : 36,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                  "Bagaimana cara menukarkan sampah organik saya?",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                  )),
                              SizedBox(
                                width: 25,
                                height: 25,
                                child: GestureDetector(
                                  onTap: _toggleExpanded3,
                                  child: IconButton(
                                    padding: const EdgeInsets.all(0),
                                    onPressed: null,
                                    icon: Icon(
                                      _expanded3
                                          ? Icons.keyboard_arrow_up_rounded
                                          : Icons.keyboard_arrow_down_rounded,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (_expanded3) // Show additional text if the container is expanded
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(
                                  color: Colors.black,
                                ),
                                Text(
                                  "Text lainnya...",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 5, left: 10, right: 5, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      width: 330,
                      height: _expanded4 ? 140 : 36,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                  "Bagaimana cara menukarkan sampah organik saya?",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                  )),
                              SizedBox(
                                width: 25,
                                height: 25,
                                child: GestureDetector(
                                  onTap: _toggleExpanded4,
                                  child: IconButton(
                                    padding: const EdgeInsets.all(0),
                                    onPressed: null,
                                    icon: Icon(
                                      _expanded4
                                          ? Icons.keyboard_arrow_up_rounded
                                          : Icons.keyboard_arrow_down_rounded,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (_expanded4) // Show additional text if the container is expanded
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(
                                  color: Colors.black,
                                ),
                                Text(
                                  "Text lainnya...",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Poppins',
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
