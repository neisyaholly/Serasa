import 'package:flutter/material.dart';
import 'package:serasa/pages/pengaturan.dart';

class TentangSerasa extends StatefulWidget {
  const TentangSerasa({super.key});

  @override
  State<TentangSerasa> createState() => _TentangSerasaState();
}

class _TentangSerasaState extends State<TentangSerasa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF8),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 5),
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
                              builder: (context) => const Pengaturan()),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFFED6055),
                        size: 20,
                      ),
                    ),
                    const Text(
                      'Tentang Serasa',
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
              const Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
                    child: Column(
                      children: [
                        Text(
                          "Serasa hadir sebagai solusi untuk mengatasi masalah sampah makanan di Indonesia. Serasa ini menghubungkan pelaku bisnis yang ingin menjual sisa stok makanan layak konsumsi dengan konsumen yang membutuhkan akses terhadap makanan berkualitas dengan harga terjangkau. Pengguna juga dapat berbagi makanan kepada orang lain yang membutuhkan melalui fitur komunitas.",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w100),
                          textAlign: TextAlign.justify,
                        ),
                        Text(""),
                        Text(
                          "Serasa juga mengakomodir pengolahan sampah organik menjadi kompos. Bank sampah akan didirikan di berbagai titik lokasi di Indonesia untuk mengolah sampah organik menjadi kompos. Hasil keuntungan dari penjualan kompos akan digunakan untuk memenuhi kebutuhan pangan komunitas yang membutuhkan.",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w100),
                          textAlign: TextAlign.justify,
                        ),
                        Text(""),
                        Text(
                          "Serasa diharapkan dapat membantu mencapai tujuan Tanpa Kelaparan, serta memberikan kontribusi positif terhadap ekonomi lokal dan kesejahteraan komunitas di Indonesia. Selain mengurangi pemborosan makanan, Serasa juga mengakomodir pengolahan sampah organik menjadi kompos. Aplikasi “Serasa” akan menyiapkan sejumlah bank sampah pada berbagai titik lokasi di Indonesia yang selanjutnya akan dikelola menjadi kompos dan diperjualbelikan. Hasil keuntungan dari penjualan kompos akan digunakan untuk memenuhi kebutuhan pangan komunitas-komunitas yang membutuhkan, seperti panti asuhan, panti jompo, korban bencana, dll. Dengan kolaborasi lintas sektor dan penerapan teknologi, aplikasi 'Serasa' diharapkan tidak hanya menjadi solusi efektif untuk mengurangi pemborosan makanan dan mencapai tujuan Tanpa Kelaparan, tetapi juga memberikan kontribusi positif terhadap ekonomi lokal dan kesejahteraan komunitas di Indonesia.",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w100),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/images/logoSerasaHeader.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
