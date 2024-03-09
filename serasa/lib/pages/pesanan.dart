import 'package:flutter/material.dart';
import 'package:serasa/classes/detail_pesanan.dart';
import 'package:serasa/classes/pembayaran.dart';
import 'package:serasa/classes/pesanan.dart';
import 'package:serasa/classes/produk_komunitas.dart';
import 'package:serasa/classes/produk_resto.dart';
import 'package:serasa/classes/resto.dart';
import 'package:serasa/functions/functions.dart';
import 'package:serasa/service/http_service.dart';
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
  List<Resto> _restos = [];
  List<Pembayaran> _pembayarans = [];

  void initState() {
    super.initState();
    _fetchPesanans();
    _fetchDetailPesanans();
    _fetchProdukKomunitass();
    _fetchProdukRestos();
    _fetchRestos();
    _fetchPembayarans();
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

  void _fetchRestos() async {
    List<Resto> fetchedRestos = await fetchRestos();
    setState(() {
      _restos = fetchedRestos;
    });
  }

  void _fetchPembayarans() async {
    List<Pembayaran> fetchedPembayarans = await fetchPembayarans();
    setState(() {
      _pembayarans = fetchedPembayarans;
    });
  }

  bool isPopUpShown = false; // State variable to track popup visibility
  Map<String, dynamic> popupParams = {};
  void togglePopUpVisibility({
    required String nama,
    required List<DetailPesanan> jumlah,
    required List<String> namaProduk,
    required int totalHarga,
    required String foto,
    required String status,
    required List<int> harga,
    required int subtotal,
    required int pajak,
    required int ongkir,
    required String pembayaran,
  }) {
    setState(() {
      isPopUpShown = !isPopUpShown; // Toggle popup visibility
      // Pass the parameters to the PopUpRiwayat widget
      popupParams = {
        'nama': nama,
        'jumlah': jumlah,
        'namaProduk': namaProduk,
        'totalHarga': totalHarga,
        'foto': foto,
        'status': status,
        'harga': harga,
        'subtotal': subtotal,
        'pajak': pajak,
        'ongkir': ongkir,
        'pembayaran': pembayaran,
      };
    });
  }

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
                      margin:
                          const EdgeInsets.only(top: 20, left: 30, right: 30),
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width,
                      // decoration: const BoxDecoration(color: Colors.amber),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            color: Colors.black,
                            width: 250,
                            height: 250,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              updatePesanan(_pesanans.length);
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(210, 25),
                              backgroundColor:
                                  const Color.fromARGB(255, 244, 99, 88),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                            ),
                            child: const Text("Pesanan Telah Saya Terima",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12)),
                          ),
                        ],
                      ),
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
                                int reversedIndex =
                                    _pesanans.length - 1 - index;
                                List<DetailPesanan> detailPesanansPerPesanan =
                                    _detailPesanans
                                        .where((detailPesanan) =>
                                            detailPesanan.pesananID ==
                                            _pesanans[reversedIndex].id)
                                        .toList();
                                print("test");
                                // print(detailPesanansPerPesanan[0].id);
                                if (_pesanans[reversedIndex].jenis == 0) {
                                  // Return WidgetPesanan with listProdukKomunitas
                                  // print(detailPesanansPerPesanan[0].id);
                                  print("test Komunitas");

                                  List<ProdukKomunitas>
                                      infoProdukDetailPesanans = [];

                                  for (DetailPesanan detailPesanan
                                      in detailPesanansPerPesanan) {
                                    // Find the matching ProdukKomunitas based on produkID
                                    ProdukKomunitas? produkKomunitas =
                                        _produkKomunitass.firstWhere((produk) =>
                                            produk.id ==
                                            detailPesanan.produkID);
                                    if (produkKomunitas != null) {
                                      infoProdukDetailPesanans
                                          .add(produkKomunitas);
                                    }
                                  }

                                  // print(detailPesanansPerPesanan[index].id);
                                  List<String> namaProdukList =
                                      infoProdukDetailPesanans
                                          .map((info) => info.nama ?? "unknown")
                                          .toList();
                                  List<int> hargaProdukList =
                                      infoProdukDetailPesanans
                                          .map((info) => info.harga!)
                                          .toList();
                                  // print(infoProdukDetailPesanans[0].name!);
                                  // print(namaProdukList[0]);

                                  double totalHarga = 0;
                                  double subtotal = 0;
                                  for (int i = 0;
                                      i < infoProdukDetailPesanans.length;
                                      i++) {
                                    subtotal =
                                        infoProdukDetailPesanans[i].harga! *
                                            detailPesanansPerPesanan[i]
                                                .qty!
                                                .toDouble();
                                    totalHarga += subtotal;
                                  }
                                  // print(totalHarga);
                                  // + ongkir
                                  totalHarga += _pesanans[index].ongkir!;
                                  String status = '';
                                  if (_pesanans[reversedIndex].selesai == 0) {
                                    status = 'dalam proses';
                                  } else {
                                    status = 'selesai';
                                  }
                                  Pembayaran? pembayaran =
                                      _pembayarans.firstWhere((pembayaran) =>
                                          pembayaran.id ==
                                          _pesanans[reversedIndex]
                                              .pembayaranID);

                                  return WidgetPesanan(
                                    nama: infoProdukDetailPesanans.first.name!,
                                    jumlah: detailPesanansPerPesanan,
                                    namaProduk: namaProdukList,
                                    totalHarga: totalHarga.toInt(),
                                    foto: infoProdukDetailPesanans.first.foto!,
                                    status: status,
                                    harga: hargaProdukList,
                                    subtotal: subtotal.toInt(),
                                    pajak: 0,
                                    ongkir: _pesanans[index].ongkir!,
                                    pembayaran: pembayaran.jenis!,
                                    onPressed: () {
                                      togglePopUpVisibility(
                                        nama: infoProdukDetailPesanans
                                            .first.name!,
                                        jumlah: detailPesanansPerPesanan,
                                        namaProduk: namaProdukList,
                                        totalHarga: totalHarga.toInt(),
                                        foto: infoProdukDetailPesanans
                                            .first.foto!,
                                        status: status,
                                        harga: hargaProdukList,
                                        subtotal: subtotal.toInt(),
                                        pajak: 0,
                                        ongkir: _pesanans[index].ongkir!,
                                        pembayaran: pembayaran.jenis!,
                                      );
                                    },
                                  );
                                } else {
                                  // Return WidgetPesanan with listProdukRestos
                                  List<ProdukResto> infoProdukDetailPesanans =
                                      [];

                                  for (DetailPesanan detailPesanan
                                      in detailPesanansPerPesanan) {
                                    // Find the matching ProdukKomunitas based on produkID
                                    ProdukResto? produkResto =
                                        _produkRestos.firstWhere((produk) =>
                                            produk.id ==
                                            detailPesanan.produkID);
                                    if (produkResto != null) {
                                      infoProdukDetailPesanans.add(produkResto);
                                    }
                                  }
                                  // print(infoProdukDetailPesanans[1].id);
                                  List<String> namaProdukList =
                                      infoProdukDetailPesanans
                                          .map((info) => info.nama ?? "unknown")
                                          .toList();
                                  print(namaProdukList[0]);
                                  // print(namaProdukList[1]);
                                  double totalHarga = 0;
                                  double subtotal = 0;
                                  for (int i = 0;
                                      i < infoProdukDetailPesanans.length;
                                      i++) {
                                    subtotal =
                                        infoProdukDetailPesanans[i].harga! *
                                            detailPesanansPerPesanan[i]
                                                .qty!
                                                .toDouble();
                                    totalHarga += subtotal;
                                  }
                                  // Calculate tax
                                  double pajak = totalHarga * 0.11;
                                  // Add tax to totalHarga
                                  totalHarga += pajak;
                                  // + ongkir
                                  totalHarga += _pesanans[index].ongkir!;

                                  Resto? resto = _restos.firstWhere((resto) =>
                                      resto.id ==
                                      infoProdukDetailPesanans.first.restoID);

                                  String status = '';
                                  if (_pesanans[reversedIndex].selesai == 0) {
                                    status = 'dalam proses';
                                  } else {
                                    status = 'selesai';
                                  }
                                  Pembayaran? pembayaran =
                                      _pembayarans.firstWhere((pembayaran) =>
                                          pembayaran.id ==
                                          _pesanans[reversedIndex]
                                              .pembayaranID);
                                  List<int> hargaProdukList =
                                      infoProdukDetailPesanans
                                          .map((info) => info.harga!)
                                          .toList();
                                  return WidgetPesanan(
                                    nama: resto.nama!,
                                    jumlah: detailPesanansPerPesanan,
                                    namaProduk: namaProdukList,
                                    totalHarga: totalHarga.toInt(),
                                    foto: resto.logo!,
                                    status: status,
                                    harga: hargaProdukList,
                                    subtotal: subtotal.toInt(),
                                    pajak: pajak.toInt(),
                                    ongkir: _pesanans[index].ongkir!,
                                    pembayaran: pembayaran.jenis!,
                                    onPressed: () {
                                      togglePopUpVisibility(
                                        nama: resto.nama!,
                                        jumlah: detailPesanansPerPesanan,
                                        namaProduk: namaProdukList,
                                        totalHarga: totalHarga.toInt(),
                                        foto: resto.logo!,
                                        status: status,
                                        harga: hargaProdukList,
                                        subtotal: subtotal.toInt(),
                                        pajak: pajak.toInt(),
                                        ongkir: _pesanans[index].ongkir!,
                                        pembayaran: pembayaran.jenis!,
                                      );
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
                alignment: Alignment.bottomCenter,
                child: PopUpRiwayat(
                  closePopUp: () {
                    togglePopUpVisibility(
                      nama: '',
                      jumlah: [],
                      namaProduk: [],
                      totalHarga: 0,
                      foto: '',
                      status: '',
                      harga: [],
                      subtotal: 0,
                      pajak: 0,
                      ongkir: 0,
                      pembayaran: '',
                    );
                  },
                  popupParams: popupParams,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
