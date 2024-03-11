import 'package:flutter/material.dart';
import 'package:serasa/pages/navbar.dart';
import 'package:serasa/widgets/widget_bankSampahTerdekat.dart';
import 'package:serasa/functions/functions.dart';

class BankSampahTerdekat extends StatefulWidget {
  const BankSampahTerdekat({super.key});

  @override
  State<BankSampahTerdekat> createState() => _BankSampahTerdekatState();
}

class _BankSampahTerdekatState extends State<BankSampahTerdekat> {
  late Future<List<Map<String, dynamic>>> _bankSampahFuture;

  @override
  void initState() {
    super.initState();
    _bankSampahFuture = fetchBankSampahMap();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF8),
      body: Container(
        margin: const EdgeInsets.only(top: 55),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
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
                width: MediaQuery.of(context).size.width*0.9,
                child: FutureBuilder<List<Map<String, dynamic>>>(
                  future: _bankSampahFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else if (snapshot.hasData) {
                      final List<Map<String, dynamic>> bankSampahList = snapshot.data!;
                      return ListView.builder(
                        padding: const EdgeInsets.all(0),
                        itemCount: bankSampahList.length,
                        itemBuilder: (context, index) {
                          final bankSampah = bankSampahList[index];
                          return WidgetBankSampahTerdekat(
                            nama: bankSampah['nama'] ?? '',
                            daerah: bankSampah['lokasi'] ?? '',
                            jarak: bankSampah['jarak'] ?? '',
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: Text('No data available'),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}