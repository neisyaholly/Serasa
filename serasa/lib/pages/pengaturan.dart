import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:serasa/functions/functions.dart';
import 'package:serasa/pages/login.dart';
import 'package:serasa/pages/navbar.dart';
import 'package:serasa/pages/tentangSerasa.dart';

class Pengaturan extends StatefulWidget {
  const Pengaturan({super.key});

  @override
  State<Pengaturan> createState() => _PengaturanState();
}

class _PengaturanState extends State<Pengaturan> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF8),
      body: Container(
        margin: EdgeInsets.only(top: 55),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const BottomNavigationBarExample(
                                  initialIndex: 4,
                                )),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFFED6055),
                      size: 20,
                    ),
                  ),
                  const Text(
                    "Pengaturan",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  Opacity(
                    opacity: 0,
                    child: IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.all(0),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFFED6055),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 100,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFFACFC7))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Atur Notifikasi",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Transform.scale(
                    transformHitTests: false,
                    scale: .9,
                    alignment: Alignment.centerRight,
                    child: CupertinoSwitch(
                      value: isSwitched,
                      activeColor: Color(0xFFED6055),
                      onChanged: (bool? value) {
                        setState(() {
                          isSwitched = value ?? false;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(bottom: BorderSide(color: Color(0xFFFACFC7)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Tentang Serasa",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TentangSerasa(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFFED6055),
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Keluar",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.logout,
                      color: Color(0xFFED6055),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      title: const Text(
                        "Hapus Akun",
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                      content: const Text(
                        "Apakah Anda yakin ingin menghapus akun Anda?",
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: const Text("Batal",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFED6055))),
                        ),
                        TextButton(
                          onPressed: () {
                            hapusAkun(currentUser!.id!);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "Hapus",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFFED6055)),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                height: 100,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFFFACFC7))),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Hapus Akun",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                    Icon(
                      Icons.delete,
                      color: Color(0xFFED6055),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
