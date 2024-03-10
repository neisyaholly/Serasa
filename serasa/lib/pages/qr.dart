import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:serasa/functions/functions.dart';
import 'package:serasa/pages/navbar.dart';

class QRPage extends StatefulWidget {
  const QRPage({super.key});

  @override
  State<QRPage> createState() {
    return _QRPage();
  }
}

class _QRPage extends State<QRPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    String data =
        "Hi, ${currentUser!.name!}! Your transaction are successfull, we added +10 poin to your account ^^";
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 254, 248, 1),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const BottomNavigationBarExample(initialIndex: 1),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFFED6055),
                      size: 20,
                    ),
                  ),
                  const Row(
                    children: [
                      Text(
                        'Tukarkan Sampahmu',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Opacity(
                    opacity: 0,
                    child: IconButton(
                      onPressed: () {},
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
              height: 30,
            ),
            SizedBox(
              width: 93,
              height: 93,
              child: Image.asset(
                'assets/images/logoSerasa_QRpage.png',
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
              width: 310,
              height: 310,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(color: const Color(0xFFED6055), width: 1.5)),
              child: Stack(
                children: [
                  QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                  ),
                  Center(
                    child: QrImageView(
                      data: data,
                      version: QrVersions.auto,
                      size: 270.0,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 40.0, top: 45.0, left: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Langkah-langkah:",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700)),
                  Padding(padding: EdgeInsets.only(bottom: 8)),
                  Text(
                      "1. Masukkan sampah organik ke Bank Sampah Serasa yang kamu kunjungi.\n2. Scan kode QR yang muncul di halaman ini pada scanner yang ada di mesin Bank Sampah Serasa.\n3. Tunggu kalkulasi berat sampah dan poin yang akan kamu dapatkan.\n4. Setelah proses kalkulasi selesai, sampah organik milikmu akan masuk ke Bank Sampah Serasa dan poin yang kamu dapatkan akan ditambahkan ke akun Serasa kamu.\n\nTerima kasih sudah menjadi Food Hero hari ini!^-^",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.justify),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      // This function will be called when a QR code is scanned
      // print('Scanned data: ${scanData.code}');
      //ngga jalan bang
      try {
        addPoinQR(currentUser!.id!, 10);
        print("WOI");
      } catch (e) {
        print('Error scanning QR code: $e');
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
