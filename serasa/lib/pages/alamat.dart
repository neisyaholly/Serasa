import 'package:flutter/material.dart';
import 'package:serasa/classes/alamat.dart';
import 'package:serasa/functions/functions.dart';
import 'package:serasa/pages/navbar.dart';
import 'package:serasa/pages/tambahAlamat.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  late String _selectedAddress = '';

  late List<Alamat> _alamats = [];

  @override
  void initState() {
    super.initState();
    _fetchAlamat();
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
    final selectedAlamat = _alamats.firstWhere((alamat) => alamat.utama == 1,
        orElse: () => Alamat(-1, "", "", "", "", "", "", "", -1, -1));
    _selectedAddress = selectedAlamat.id.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFEF8),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BottomNavigationBarExample(
                      initialIndex: 4,
                    ),
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
              'Alamat',
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: _alamats.length,
                itemBuilder: (context, index) {
                  bool showBorder = index.isOdd;
                  return Container(
                    decoration: BoxDecoration(
                      border: showBorder
                          ? Border.all(color: const Color(0xFFE45C50))
                          : null,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: RadioListTile<String>(
                      title: Text(
                        '${currentUser!.name!} | (${currentUser!.telp!})',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      subtitle: Text(
                        "${_alamats[index].nama}\n${_alamats[index].jalan}, Kel. ${_alamats[index].kel}, Kec. ${_alamats[index].kec}, ${_alamats[index].kab_kota}, ${_alamats[index].provinsi} ${_alamats[index].kode_pos}",
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      value: _alamats[index].id.toString(),
                      groupValue: _selectedAddress,
                      onChanged: (value) {
                        setState(() {
                          _selectedAddress = value!;
                          updateAlamatUtama(_alamats[index].id!, currentUser!.id!);
                        });
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: 350,
        height: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFED6055),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            elevation: 2,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const TambahAlamat(),
              ),
            );
          },
          child: const Text(
            'Tambah Alamat',
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              color: Color(0xFFFFFAFA),
            ),
          ),
        ),
      ),
    );
  }
}
