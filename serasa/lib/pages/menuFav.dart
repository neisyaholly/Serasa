import 'package:flutter/material.dart';
import 'package:serasa/classes/produk_resto.dart';
import 'package:serasa/classes/resto.dart';
import 'package:serasa/functions/functions.dart';
import 'package:serasa/pages/navbar.dart';
import 'package:serasa/widgets/widget_menuFav.dart';

class MenuFav extends StatefulWidget {
  const MenuFav({super.key});

  @override
  State<MenuFav> createState() => _MenuFavState();
}

class _MenuFavState extends State<MenuFav> {

  late List<ProdukResto> _produkRestos = [];
  late List<Resto> _restos = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    setState(() {
      _isLoading = true;
    });
    try {
      List<ProdukResto> fetchedProdukResto = await fetchProdukRestos();
      List<Resto> fetchedResto = await fetchRestos();
      setState(() {
        _produkRestos = fetchedProdukResto;
        _restos = fetchedResto;
        _restos = _restos
          .where((detail) =>
              _produkRestos.any((produk) => detail.id == produk.restoID))
          .toList();
        _isLoading = false;
      });
    } catch (error) {
      print('Error fetching restos: $error');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF8),
      body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFED6055)),
              ))
            : SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15, right: 30, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const BottomNavigationBarExample(
                                      initialIndex: 0),
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
                        'Menu Favorit',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: const Color(0xFFFACFC6),
                        borderRadius: BorderRadius.circular(100)),
                    child: Transform.rotate(
                      angle: 1.57079632679, // 180 degrees in radians
                      child: InkWell(
                          onTap: () {},
                          child: const Icon(Icons.search,
                              color: Colors.black, size: 20)),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.sort,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Sort By",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                        // shrinkWrap: true,
                        padding: const EdgeInsets.all(0),
                        itemCount: 6,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (_, index) {
                          return WidgetMenuFav(
                              nama: _produkRestos[index].nama!,
                              resto: _restos[index].nama!,
                              foto: _produkRestos[index].foto!,
                              harga1: _produkRestos[index].harga.toString(),
                              harga2: (_produkRestos[index].harga! ~/ 2).toInt().toString());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
