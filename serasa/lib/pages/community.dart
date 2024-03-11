import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:serasa/classes/produk_komunitas.dart';
import 'package:serasa/functions/functions.dart';
import 'package:serasa/pages/detailproduk.dart';
import 'package:serasa/pages/post.dart';
import 'package:serasa/widgets/test.dart';
import 'package:serasa/widgets/widget_community.dart';
import '../utils/color.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();

  static fromJson(json) {}
}

class _CommunityState extends State<Community> {
  final ScrollController _controller = ScrollController();
  bool _isVisible = true;


  List<ProdukKomunitas> _produkKomunitass = [];

  @override
  void initState() {
    super.initState();
    _fetchProdukKomunitas();
    _controller.addListener(_scrollListener);
  }

  void _fetchProdukKomunitas() async {
    List<ProdukKomunitas> fetchedProdukKomunitass =
        await fetchProdukKomunitass();
    setState(() {
      _produkKomunitass = fetchedProdukKomunitass;
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    _controller.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_controller.position.userScrollDirection == ScrollDirection.reverse) {
      setState(() {
        _isVisible = false;
      });
    } else if (_controller.position.userScrollDirection ==
        ScrollDirection.forward) {
      setState(() {
        _isVisible = false;
      });
    }
  }

  void _checkVisibility() {
    Future.delayed(const Duration(milliseconds: 200), () {
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      if (_controller.position.activity is IdleScrollActivity &&
          _isVisible == false) {
        setState(() {
          _isVisible = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF8),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Column(
                children: [
                  const Text(
                    "Komunitas",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  // Search and Location
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 340,
                          height: 30,
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                              filled: true,
                              fillColor: AppColors.color4,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: Transform.rotate(
                                angle: 1.57079632679, // 180 degrees in radians
                                child: const Icon(Icons.search,
                                    color: Colors.black, size: 20),
                              ),
                            ),
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Test(),
                                ),
                              );
                            },
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                              bottom:
                                  3.0), // Adjust the bottom padding as needed
                          child: Icon(
                            Icons.location_on,
                            color: Color(0xFFE45C50),
                            size: 25,
                          ),
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
            Expanded(
              child: Stack(
                children: [
                  NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      if (notification is ScrollUpdateNotification) {
                        _checkVisibility();
                        // _scrollListener();
                      }
                      return false;
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      child: GridView.builder(
                        controller: _controller,
                        padding: const EdgeInsets.all(5),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          crossAxisCount: 2,
                        ),
                        itemCount: _produkKomunitass.length,
                        itemBuilder: (context, index) {
                          ProdukKomunitas produkKomunitas =
                              _produkKomunitass[index];
                          print("woi");
                          // print(produkKomunitas.id);
                          print(_produkKomunitass[0].id);
                          return GestureDetector(
                            child: WidgetCommunity(
                                nama: produkKomunitas.nama!,
                                harga: produkKomunitas.harga!,
                                exp: produkKomunitas.exp!,
                                foto: produkKomunitas.foto!,
                                jarak: "5"),
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Detailproduk(
                                      produkKomunitas: produkKomunitas),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 200),
                    bottom: _isVisible ? 20 : -80,
                    right: 15,
                    child: GestureDetector(
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: const Color(0xFFED6055),
                            borderRadius: BorderRadius.circular(100)),
                        child: const Icon(
                          Icons.add,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Post(),
                          ),
                        );
                      },
                    ),
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
