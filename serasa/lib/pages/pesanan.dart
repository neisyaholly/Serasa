import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:serasa/classes/detail_pesanan.dart';
import 'package:serasa/classes/pembayaran.dart';
import 'package:serasa/classes/pesanan.dart';
import 'package:serasa/classes/produk_komunitas.dart';
import 'package:serasa/classes/produk_resto.dart';
import 'package:serasa/classes/resto.dart';
import 'package:serasa/functions/functions.dart';
import 'package:serasa/pages/navbar.dart';
import 'package:serasa/service/http_service.dart';
import 'package:serasa/widgets/popup_Riwayat.dart';
import 'package:serasa/widgets/widget_pesanan.dart';
import 'package:video_player/video_player.dart';

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
  List<Pesanan> _currentPesanans = [];

  late VideoPlayerController _controller;
  bool _isLoading = false;

  void initState() {
    super.initState();
    _fetchData();
    _controller = VideoPlayerController.asset('assets/videos/cut.mp4')
      ..initialize().then((_) {
        setState(() {}); // Ini opsional, tergantung kebutuhan Anda
        _controller.setLooping(true); // Set looping video
        _controller.play(); // Play video secara otomatis setelah diinisialisasi
      });
  }

  void _fetchData() async {
    setState(() {
      _isLoading = true;
    });
    try {
      List<Pesanan> fetchedPesanans = await fetchPesanans();
      List<DetailPesanan> fetchedDetailPesanans = await fetchDetailPesanans();
      List<ProdukKomunitas> fetchedAllProdukKomunitass =
          await fetchAllProdukKomunitass();
      List<ProdukResto> fetchedProdukRestos = await fetchProdukRestos();
      List<Resto> fetchedRestos = await fetchRestos();
      List<Pembayaran> fetchedPembayarans = await fetchPembayarans();
      setState(() {
        _pesanans = fetchedPesanans;
        _detailPesanans = fetchedDetailPesanans;
        _produkKomunitass = fetchedAllProdukKomunitass;
        _produkRestos = fetchedProdukRestos;
        _restos = fetchedRestos;
        _pembayarans = fetchedPembayarans;
        filterPesananByUserId();
        _isLoading = false;
      });
    } catch (error) {
      print('Error fetching restos: $error');
      setState(() {
        _isLoading = false;
      });
    }
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

  void filterPesananByUserId() {
    _currentPesanans = _pesanans
        .where((pesanan) => pesanan.userID == currentUser!.id)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    // print('Filtered Pesanan:');
    _currentPesanans.forEach((pesanan) {
      // print('Pesanan ID: ${pesanan.id}, User ID: ${pesanan.userID}');
    });
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF8),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFED6055)),
            ))
          : Stack(
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
                            margin: const EdgeInsets.only(
                                top: 20, left: 30, right: 30),
                            height: MediaQuery.of(context).size.height * 0.35,
                            width: MediaQuery.of(context).size.width,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(bottom: 120),
                                  child: FittedBox(
                                    fit: BoxFit.none,
                                    child: Container(
                                      width:
                                          _controller.value.size.width * 0.32,
                                      height:
                                          _controller.value.size.height * 0.32,
                                      padding: const EdgeInsetsDirectional.all(0),
                                      child: VideoPlayer(_controller),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    color: const Color(0xFFFFFEF8),
                                  ),
                                ),
                                Positioned(
                                  bottom: 40,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      final player = AudioPlayer();
                                      player.play(
                                          AssetSource('audios/hiyaw.mp3'));
                                      updatePesanan(_currentPesanans.length);
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const BottomNavigationBarExample(
                                                  initialIndex: 2),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(200, 25),
                                      backgroundColor: const Color.fromARGB(
                                          255, 244, 99, 88),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 5),
                                    ),
                                    child: const Text(
                                        "Pesanan Telah Saya Terima",
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12)),
                                  ),
                                ),
                                Visibility(
                                  visible: !_currentPesanans
                                      .any((pesanan) => pesanan.selesai == 0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    height:
                                        MediaQuery.of(context).size.height * 1,
                                    color: const Color(0xFFFFFEF8),
                                    padding: const EdgeInsets.only(
                                        bottom: 50, left: 10, right: 10),
                                    child: Stack(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(bottom: 40),
                                          child: const Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Ayo menjadi',
                                                style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Food Hero ',
                                                    style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                  Text(
                                                    'hari ini!',
                                                    style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          child: Container(
                                            // color: Colors.amber,
                                            padding: const EdgeInsets.only(top: 30),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.52,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.3,
                                            child: Image.asset(
                                                'assets/images/gudd.png'),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 30, right: 30, top: 20),
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
                                    padding: const EdgeInsets.all(0),
                                    itemCount: _currentPesanans.length,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (_, index) {
                                      int reversedIndex = index <
                                              _currentPesanans.length
                                          ? _currentPesanans.length - 1 - index
                                          : 0;

                                      List<DetailPesanan>
                                          detailPesanansPerPesanan =
                                          _detailPesanans
                                              .where((detailPesanan) =>
                                                  detailPesanan.pesananID ==
                                                  _currentPesanans[
                                                          reversedIndex]
                                                      .id)
                                              .toList();
                                      // print(detailPesanansPerPesanan[0].id);
                                      if (_currentPesanans[reversedIndex]
                                              .jenis ==
                                          0) {
                                        // Return WidgetPesanan with listProdukKomunitas
                                        // print(detailPesanansPerPesanan[0].id);
                                        List<ProdukKomunitas>
                                            infoProdukDetailPesanans = [];

                                        for (DetailPesanan detailPesanan
                                            in detailPesanansPerPesanan) {
                                          ProdukKomunitas? produkKomunitas =
                                              _produkKomunitass.firstWhere(
                                                  (produk) =>
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
                                                .map((info) =>
                                                    info.nama ?? "unknown")
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
                                          subtotal = subtotal +
                                              (infoProdukDetailPesanans[i]
                                                      .harga! *
                                                  detailPesanansPerPesanan[i]
                                                      .qty!
                                                      .toDouble());
                                        }
                                        totalHarga += subtotal;
                                        totalHarga +=
                                            _currentPesanans[reversedIndex]
                                                .ongkir!;
                                        String status = '';
                                        if (_currentPesanans[reversedIndex]
                                                .selesai ==
                                            0) {
                                          status = 'dalam proses';
                                        } else {
                                          status = 'selesai';
                                        }
                                        Pembayaran? pembayaran = _pembayarans
                                            .firstWhere((pembayaran) =>
                                                pembayaran.id ==
                                                _currentPesanans[reversedIndex]
                                                    .pembayaranID);

                                        return WidgetPesanan(
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
                                          ongkir:
                                              _currentPesanans[reversedIndex]
                                                  .ongkir!,
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
                                              ongkir: _currentPesanans[
                                                      reversedIndex]
                                                  .ongkir!,
                                              pembayaran: pembayaran.jenis!,
                                            );
                                          },
                                        );
                                      } else {
                                        List<ProdukResto>
                                            infoProdukDetailPesanans = [];

                                        for (DetailPesanan detailPesanan
                                            in detailPesanansPerPesanan) {
                                          ProdukResto? produkResto =
                                              _produkRestos.firstWhere(
                                                  (produk) =>
                                                      produk.id ==
                                                      detailPesanan.produkID);
                                          if (produkResto != null) {
                                            infoProdukDetailPesanans
                                                .add(produkResto);
                                          }
                                        }
                                        // print(infoProdukDetailPesanans[1].id);
                                        List<String> namaProdukList =
                                            infoProdukDetailPesanans
                                                .map((info) =>
                                                    info.nama ?? "unknown")
                                                .toList();
                                        // print(namaProdukList[0]);
                                        // print(namaProdukList[1]);
                                        double totalHarga = 0;
                                        double subtotal = 0;
                                        for (int i = 0;
                                            i < infoProdukDetailPesanans.length;
                                            i++) {
                                          subtotal = subtotal +
                                              (infoProdukDetailPesanans[i]
                                                      .harga! *
                                                  detailPesanansPerPesanan[i]
                                                      .qty!
                                                      .toDouble());
                                        }
                                        totalHarga += subtotal;
                                        double pajak = totalHarga * 0.11;
                                        totalHarga += pajak;
                                        totalHarga +=
                                            _currentPesanans[reversedIndex]
                                                .ongkir!;

                                        Resto? resto = _restos.firstWhere(
                                            (resto) =>
                                                resto.id ==
                                                infoProdukDetailPesanans
                                                    .first.restoID);

                                        String status = '';
                                        if (_currentPesanans[reversedIndex]
                                                .selesai ==
                                            0) {
                                          status = 'dalam proses';
                                        } else {
                                          status = 'selesai';
                                        }
                                        Pembayaran? pembayaran = _pembayarans
                                            .firstWhere((pembayaran) =>
                                                pembayaran.id ==
                                                _currentPesanans[reversedIndex]
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
                                          ongkir:
                                              _currentPesanans[reversedIndex]
                                                  .ongkir!,
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
                                              ongkir: _currentPesanans[
                                                      reversedIndex]
                                                  .ongkir!,
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
