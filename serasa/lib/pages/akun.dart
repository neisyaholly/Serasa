import 'package:flutter/material.dart';
import 'package:serasa/classes/alamat.dart';
import 'package:serasa/classes/detail_pesanan.dart';
import 'package:serasa/classes/pesanan.dart';
import 'package:serasa/classes/produk_komunitas.dart';
import 'package:serasa/classes/produk_resto.dart';
import 'package:serasa/classes/riwayatTukarSampah.dart';
import 'package:serasa/functions/functions.dart';
import 'package:serasa/pages/alamat.dart';
import 'package:serasa/pages/editProfil.dart';
import 'package:serasa/pages/help.dart';
import 'package:serasa/pages/pengaturan.dart';
import 'package:serasa/pages/rewards.dart';
import 'package:serasa/utils/color.dart';

class Akun extends StatefulWidget {
  const Akun({super.key});

  @override
  State<Akun> createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  bool _expanded1 = false; // Flag to track if the container is expanded
  bool _expanded2 = false;
  bool _expanded3 = false;
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

  late List<Alamat> _alamats = [];
  late List<Pesanan> _pesanans = [];
  late List<DetailPesanan> _detailpes = [];
  late List<RiwayatTukarSampah> _riwayats = [];
  late List<ProdukResto> _produks = [];
  late List<ProdukKomunitas> _produkKoms = [];

  @override
  void initState() {
    super.initState();
    _fetchAlamat();
    _fetchPesanan();
    _fetchRiwayat();
    _fetchProduk();
  }

  void _fetchAlamat() async {
    List<Alamat> fetchedAlamats = await fetchAlamats();
    setState(() {
      _alamats = fetchedAlamats;
    });
    _alamats = _alamats
        .where(
          (detail) => detail.userID == currentUser!.id,
        )
        .toList();
  }

  void _fetchProduk() async {
    List<ProdukResto> resto = await fetchProdukRestos();
    List<ProdukKomunitas> kom = await fetchProdukKomunitass();
    setState(() {
      _produks = resto;
      _produkKoms = kom;
    });
  }

  void _fetchPesanan() async {
    List<Pesanan> fetchedPesanans = await fetchPesanans();
    List<DetailPesanan> fetchedDetailPesanans = await fetchDetailPesanans();
    setState(() {
      _pesanans = fetchedPesanans;
      _detailpes = fetchedDetailPesanans;
    });
    _pesanans = _pesanans
        .where(
          (detail) => detail.userID == currentUser!.id,
        )
        .toList();
    _detailpes = _detailpes
        .where(
          (detail) => detail.pesananID == _pesanans[0].id,
        )
        .toList();
  }

  void _fetchRiwayat() async {
    List<RiwayatTukarSampah> fetchedRiwayats = await fetchRiwayatTukarSampah();
    setState(() {
      _riwayats = fetchedRiwayats;
    });
    _riwayats = _riwayats
        .where(
          (detail) => detail.userID == currentUser!.id,
        )
        .toList();
  }

  int calculateSumPrice(List<DetailPesanan> detailpes) {
    int sumPrice = 0;
    for (var detail in detailpes) {
      if (_pesanans[0].jenis == 1) {
        ProdukResto? produkResto = _produks.firstWhere(
          (produk) => produk.id == detail.produkID,
          orElse: () => ProdukResto(-1, -1, "", "", -1, -1, ""),
        );
        sumPrice += produkResto.harga!;
      } else if (_pesanans[0].jenis == 0) {
        ProdukKomunitas? produkKomunitas = _produkKoms.firstWhere(
          (produk) => produk.id == detail.produkID,
          orElse: () => ProdukKomunitas(-1, -1, "", "", -1, "", "", "", ""),
        );
        sumPrice += produkKomunitas.harga!;
      }
    }
    return sumPrice;
  }

  @override
  Widget build(BuildContext context) {
    Alamat? alamatUtama = _alamats.firstWhere(
      (alamat) => alamat.utama == 1,
      orElse: () => Alamat(-1, "", "", "", "", "", "", "", -1, -1),
    );

    int totalBerat = 0;
    int index = 0;
    while (index < _riwayats.length) {
      totalBerat += _riwayats[index].berat!;
      index++;
    }

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
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: const EdgeInsets.only(
                        top: 55, left: 33, right: 33, bottom: 30),
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.amber,
                            image: DecorationImage(
                                image: NetworkImage(currentUser!.foto!),
                                fit: BoxFit.contain),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          currentUser!.name!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.currency_bitcoin_rounded,
                              color: AppColors.color3,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text("${currentUser!.poin} Poin",
                                style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // color: Colors.amber,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(
                      top: 55,
                      right: 45,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("AKUN",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Poppins',
                                fontSize: 18)),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Nomor Telepon",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                fontSize: 14)),
                        Text(currentUser!.telp!,
                            style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Poppins',
                                fontSize: 10,
                                color: Color(0xFFED6055))),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Email",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                fontSize: 14)),
                        Text(currentUser!.email!,
                            style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Poppins',
                                fontSize: 10,
                                color: Color(0xFFED6055))),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Alamat utama",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                fontSize: 14)),
                        Text(alamatUtama.nama!,
                            style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Poppins',
                                fontSize: 10,
                                color: Color(0xFFED6055))),
                        const SizedBox(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "Kamu menyelamatkan ${_detailpes.length} makanan",
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Poppins',
                                  fontSize: 11)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                              "Kamu menghemat Rp${calculateSumPrice(_detailpes).toString()}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Poppins',
                                  fontSize: 11)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                              "Kamu mengurangi $totalBerat kg sampah sisa makanan",
                              style: const TextStyle(
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
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 10,
                    bottom: 10,
                  ),
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
                onTap: () {
                  FocusScope.of(context).unfocus();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Rewards(),
                    ),
                  );
                },
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
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment(0.8, 0.8),
                                colors: [Color(0xFFF7B3AB), Color(0xFFFFFDF8)],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  spreadRadius: 0.5,
                                  blurRadius: 1,
                                  offset: const Offset(
                                    2.5,
                                    2.5,
                                  ), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: GestureDetector(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const EditProfil(),
                                        ),
                                      );
                                    },
                                    child: const Icon(
                                      Icons.edit_outlined,
                                      color: Color(0xFFED6055),
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
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
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment(0.8, 0.8),
                                colors: [Color(0xFFF7B3AB), Color(0xFFFFFDF8)],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  spreadRadius: 0.5,
                                  blurRadius: 1,
                                  offset: const Offset(
                                    2.5,
                                    2.5,
                                  ), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: GestureDetector(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const AddressPage(),
                                        ),
                                      );
                                    },
                                    child: const Icon(
                                      Icons.home_outlined,
                                      color: Color(0xFFED6055),
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
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
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment(0.8, 0.8),
                                colors: [Color(0xFFF7B3AB), Color(0xFFFFFDF8)],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  spreadRadius: 0.5,
                                  blurRadius: 1,
                                  offset: const Offset(
                                    2.5,
                                    2.5,
                                  ), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: GestureDetector(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const Pengaturan(),
                                        ),
                                      );
                                    },
                                    child: const Icon(
                                      Icons.settings_outlined,
                                      color: Color(0xFFED6055),
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
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
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment(0.8, 0.8),
                                colors: [Color(0xFFF7B3AB), Color(0xFFFFFDF8)],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  spreadRadius: 0.5,
                                  blurRadius: 1,
                                  offset: const Offset(
                                    2.5,
                                    2.5,
                                  ), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: GestureDetector(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const HelpPage(),
                                        ),
                                      );
                                    },
                                    child: const Icon(
                                      Icons.help_outline_outlined,
                                      color: Color(0xFFED6055),
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
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
                                  "Kamu dapat menukarkan sampah organik kamu ke Bank Sampah Serasa terdekat, ya. Kamu bisa cek letak Bank Sampah di dekatmu melalui halaman Daur Ulang. Terima kasih sudah berkontribusi :)",
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
                                  "Jenis makanan apa yang bisa saya jual di Komunitas?",
                                  textAlign: TextAlign.justify,
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
                                  "Pada halaman Komunitas, kamu dapat menjual jenis makanan apa pun yang masih layak konsumsi.",
                                  textAlign: TextAlign.justify,
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
                                  "Apakah saya bisa mengganti alamat utama saya?",
                                  textAlign: TextAlign.justify,
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
                                  "Tentu, kamu bisa menggantinya pada menu Alamat yang ada pada halaman Akun, ya. Kamu bisa memilih alamat yang kamu inginkan untuk menjadi alamat utama.",
                                  textAlign: TextAlign.justify,
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
                                  "Adakah jaminan harga murah pada aplikasi Serasa?",
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
                                  "Ada! Serasa bakal kasih kamu potongan harga sampai dengan 50% untuk setiap pembelian pada aplikasi Serasa. Serasa berharap, setiap orang dapat memiliki akses makanan yang lebih mudah dan terjangkau melalui Serasa^^",
                                  textAlign: TextAlign.justify,
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
