import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serasa/classes/resto.dart';
import 'package:serasa/functions/functions.dart';
import 'package:serasa/pages/navbar.dart';
import 'package:serasa/pages/pilihMenu.dart';
import 'package:serasa/widgets/test.dart';
import 'package:serasa/widgets/widget_restoTerdekat.dart';

class RestoTerdekat extends StatefulWidget {
  const RestoTerdekat({super.key});

  @override
  State<RestoTerdekat> createState() => _RestoTerdekatState();
}

class _RestoTerdekatState extends State<RestoTerdekat> {
  late List<Resto> _restos = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchRestos();
  }

  void _fetchRestos() async {
    setState(() {
      _isLoading = true;
    });
    try {
      List<Resto> fetchedResto = await fetchRestos();
      setState(() {
        _restos = fetchedResto;
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
                      margin:
                          const EdgeInsets.only(left: 15, right: 30, top: 10),
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
                                'Restoran Terdekat',
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
                                  onTap: () {
                                    Get.to(() => const Test());
                                  },
                                  child: const Icon(Icons.search,
                                      color: Colors.black, size: 20)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                        ),
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
                                padding: const EdgeInsets.all(0),
                                itemCount: 10,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (_, index) {
                                  return GestureDetector(
                                    child: WidgetRestoTerdekat(
                                        nama: _restos[index].nama!,
                                        kategori: _restos[index].kategori!,
                                        rate: _restos[index].rating!,
                                        logo: _restos[index].logo!,
                                        jumlahRate: "150",
                                        jarak: "5"),
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              PilihResto(resto: _restos[index]),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ));
  }
}
