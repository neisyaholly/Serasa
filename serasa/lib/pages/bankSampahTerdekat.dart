import 'package:flutter/material.dart';
import 'package:serasa/pages/navbar.dart';
import 'package:serasa/pages/recycle.dart';
import 'package:serasa/widgets/widget_bankSampahTerdekat.dart';

class BankSampahTerdekat extends StatefulWidget {
  const BankSampahTerdekat({super.key});

  @override
  State<BankSampahTerdekat> createState() => _BankSampahTerdekatState();
}

class _BankSampahTerdekatState extends State<BankSampahTerdekat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF8),
      body: Container(
        margin: const EdgeInsets.only(top: 55),
        child: Column(
          children: [
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
                          builder: (context) => const BottomNavigationBarExample(initialIndex: 1),
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
                    'Bank Sampah Di Dekatmu',
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
            Expanded(
              child: Container(
                // color: Colors.amber,
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  itemCount: 20,
                  itemBuilder: (_, index) {
                    return const WidgetBankSampahTerdekat(
                        nama: "Serasa:",
                        daerah: "Rumah Talenta BCA",
                        jarak: "0,4");
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
