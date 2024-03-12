import 'package:flutter/material.dart';
import 'package:serasa/classes/alamat.dart';
import 'package:serasa/functions/functions.dart';
import 'package:serasa/pages/alamat.dart';
import 'package:serasa/pages/navbar.dart';

class TambahAlamat extends StatefulWidget {
  const TambahAlamat({super.key});

  @override
  State<TambahAlamat> createState() => _TambahAlamatState();
}

class _TambahAlamatState extends State<TambahAlamat> {
  final _namaController = TextEditingController();
  final _jalanController = TextEditingController();
  final _kelController = TextEditingController();
  final _kecController = TextEditingController();
  final _kabkotaController = TextEditingController();
  final _provinsiController = TextEditingController();
  final _kodeposController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFFFFEF8),
      body: Container(
        margin: const EdgeInsets.only(top: 55),
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
                              const BottomNavigationBarExample(initialIndex: 4),
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
                    "Tambah Alamat",
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
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Nama Alamat",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 40,
                        child: TextField(
                          controller: _namaController,
                          decoration: InputDecoration(
                            fillColor: const Color(0xFFFACFC7),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Color(0xFFFACFC7)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Color(0xFFFACFC7)),
                            ),
                            hintText: "contoh: Dorm Kuliah",
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.7)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Jalan",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 40,
                        child: TextField(
                          controller: _jalanController,
                          decoration: InputDecoration(
                            fillColor: const Color(0xFFFACFC7),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Color(0xFFFACFC7)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Color(0xFFFACFC7)),
                            ),
                            hintText: "contoh: Jl. Pakuan No.3",
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.7)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Kelurahan",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 40,
                        child: TextField(
                          controller: _kelController,
                          decoration: InputDecoration(
                            fillColor: const Color(0xFFFACFC7),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Color(0xFFFACFC7)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Color(0xFFFACFC7)),
                            ),
                            hintText: "contoh: Sumur Batu",
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.7)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Kecamatan",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 40,
                        child: TextField(
                          controller: _kecController,
                          decoration: InputDecoration(
                            fillColor: const Color(0xFFFACFC7),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Color(0xFFFACFC7)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Color(0xFFFACFC7)),
                            ),
                            hintText: "contoh: Babakan Madang",
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.7)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Kabupaten/Kota",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 40,
                        child: TextField(
                          controller: _kabkotaController,
                          decoration: InputDecoration(
                            fillColor: const Color(0xFFFACFC7),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Color(0xFFFACFC7)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Color(0xFFFACFC7)),
                            ),
                            hintText: "contoh: Kab. Bogor",
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.7)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Provinsi",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 40,
                        child: TextField(
                          controller: _provinsiController,
                          decoration: InputDecoration(
                            fillColor: const Color(0xFFFACFC7),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Color(0xFFFACFC7)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Color(0xFFFACFC7)),
                            ),
                            hintText: "contoh: Jawa Barat",
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.7)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Kode Pos",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 40,
                        child: TextField(
                          controller: _kodeposController,
                          decoration: InputDecoration(
                            fillColor: const Color(0xFFFACFC7),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Color(0xFFFACFC7)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Color(0xFFFACFC7)),
                            ),
                            hintText: "contoh: ID 16810",
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontFamily: 'Poppins',
                              fontSize: 10,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.7)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final nama = _namaController.text;
                      final jalan = _jalanController.text;
                      final kel = _kelController.text;
                      final kec = _kecController.text;
                      final kabkota = _kabkotaController.text;
                      final provinsi = _provinsiController.text;
                      final kodepos = _kodeposController.text;
                      final userID = currentUser!.id!;

                      FocusScope.of(context).unfocus();
                      Alamat? alamat = await addAlamat(nama, jalan, kel, kec,
                          kabkota, provinsi, kodepos, userID);

                      if (alamat is Alamat) {
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddressPage(),
                          ),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                        Color(0xFFE45C50),
                      ),
                      foregroundColor: const MaterialStatePropertyAll(
                        Color(0xFFFFFAFA),
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      fixedSize: const MaterialStatePropertyAll(
                        Size(140, 38),
                      ),
                      textStyle: const MaterialStatePropertyAll(
                        TextStyle(
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.zero),
                    ),
                    child: const Text('Simpan'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
