import 'package:flutter/material.dart';
import 'package:serasa/classes/detail_pesanan.dart';
import 'package:serasa/classes/pesanan.dart';
import 'package:serasa/classes/produk_komunitas.dart';
import 'package:serasa/classes/produk_resto.dart';
import 'package:serasa/functions/functions.dart';
import 'package:serasa/widgets/popup_Riwayat.dart';
import 'package:serasa/widgets/widget_pesanan.dart';

class PesananPage extends StatefulWidget {
  const PesananPage({super.key});

  @override
  State<PesananPage> createState() => _PesananPageState();
}

class _PesananPageState extends State<PesananPage> {
  List<Pesanan> _pesanans = [];
  List<DetailPesanan> _detailPesanans = [];
  List<ProdukKomunitas> _produkKomunitass = [];
  List<ProdukResto> _produkRestos = [];

  void initState() {
    super.initState();
    _fetchPesanans();
    _fetchDetailPesanans();
    _fetchProdukKomunitass();
    _fetchProdukRestos();
  }

  void _fetchPesanans() async {
    List<Pesanan> fetchedPesanans = await fetchPesanans();
    setState(() {
      _pesanans = fetchedPesanans;
    });
  }

  void _fetchDetailPesanans() async {
    List<DetailPesanan> fetchedDetailPesanans = await fetchDetailPesanans();
    setState(() {
      _detailPesanans = fetchedDetailPesanans;
    });
  }

  void _fetchProdukKomunitass() async {
    List<ProdukKomunitas> fetchedProdukKomunitass =
        await fetchProdukKomunitass();
    setState(() {
      _produkKomunitass = fetchedProdukKomunitass;
    });
  }

  void _fetchProdukRestos() async {
    List<ProdukResto> fetchedProdukRestos = await fetchProdukRestos();
    setState(() {
      _produkRestos = fetchedProdukRestos;
    });
  }

  bool isPopUpShown = false; // State variable to track popup visibility

  void togglePopUpVisibility() {
    setState(() {
      isPopUpShown = !isPopUpShown; // Toggle popup visibility
    });
  }
  // =

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF8),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 65),
                child: Column(
                  children: [
                    const Text(
                      "Pesanan Anda",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(color: Colors.amber),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 30, right: 30, top: 20),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Riwayat Pesanan",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(Icons.sort),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.4,
                      // margin: EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.all(0),
                              itemCount: _pesanans.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (_, index) {
                                List<DetailPesanan> detailPesanansPerPesanan =
                                    _detailPesanans
                                        .where((detailPesanan) =>
                                            detailPesanan.pesananID ==
                                            _pesanans[index].id)
                                        .toList();
                                if (_pesanans[index].jenis == 0) {
                                  // Return WidgetPesanan with listProdukKomunitas
                                  List<ProdukKomunitas>
                                      infoProdukDetailPesanans =
                                      _produkKomunitass
                                          .where((infoProdukDetailPesanan) =>
                                              infoProdukDetailPesanan.id ==
                                              detailPesanansPerPesanan[index]
                                                  .produkID)
                                          .toList();
                                  return WidgetPesanan(
                                    nama: infoProdukDetailPesanans[index].name!,
                                    jumlah: detailPesanansPerPesanan,
                                    jenis: infoProdukDetailPesanans,
                                    harga: infoProdukDetailPesanans,
                                    onPressed: () {
                                      togglePopUpVisibility();
                                    },
                                  );
                                } else if (_pesanans[index].jenis == 1) {
                                  // Return WidgetPesanan with listProdukRestos
                                  List<ProdukResto> infoProdukDetailPesanans =
                                      _produkRestos
                                          .where((infoProdukDetailPesanan) =>
                                              infoProdukDetailPesanan.id ==
                                              detailPesanansPerPesanan[index]
                                                  .produkID)
                                          .toList();
                                  return WidgetPesanan(
                                    nama: "nama",
                                    jumlah: detailPesanansPerPesanan,
                                    jenis: infoProdukDetailPesanans,
                                    harga: infoProdukDetailPesanans,
                                    onPressed: () {
                                      togglePopUpVisibility();
                                    },
                                  );
                                }
                              },
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
          if (isPopUpShown)
            GestureDetector(
              onTap: () {},
              child: Container(
                // Semi-transparent background
                alignment: Alignment.bottomCenter,
                child: PopUpRiwayat(
                    closePopUp:
                        togglePopUpVisibility), // Show popup in the center
              ),
            ),
        ],
      ),
    );
  }
}
