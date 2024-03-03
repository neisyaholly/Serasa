import 'package:flutter/material.dart';
import 'package:serasa/pages/navbar.dart';
import 'package:serasa/pages/tambahAlamat.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  String? _selectedAddress;

  List<Map<String, String>> addresses = [
    {
      'name': 'Nathasya',
      'address': 'Jl. Pakuan No. 3, Kab.Bogor, Jawa Barat, ID 16810',
      'phone': '+62123456789'
    },
    {
      'name': 'Nathasya',
      'address': 'Jl. Pakuan No. 4, Kab.Bogor, Jawa Barat, ID 16810',
      'phone': '+62987654321'
    },
    {
      'name': 'Nathasya',
      'address': 'Jl. Pakuan No. 1, Kab.Bogor, Jawa Barat, ID 16810',
      'phone': '+62111222333'
    },
    {
      'name': 'Nathasya',
      'address': 'Jl. Pakuan No. 2, Kab.Bogor, Jawa Barat, ID 16810',
      'phone': '+62111222333'
    },
  ];

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
                itemCount: addresses.length,
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
                        '${addresses[index]['name']} | (${addresses[index]['phone']})',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      subtitle: Text(
                        addresses[index]['address']!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      value: addresses[index]['address']!,
                      groupValue: _selectedAddress,
                      onChanged: (value) {
                        setState(() {
                          _selectedAddress = value;
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
