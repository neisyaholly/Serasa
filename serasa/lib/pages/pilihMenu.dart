import 'package:flutter/material.dart';
import 'package:serasa/classes/produk_resto.dart';
import 'package:serasa/classes/resto.dart';
import 'package:serasa/functions/functions.dart';
import 'package:serasa/pages/home.dart';
import 'package:serasa/pages/post.dart';
import 'package:serasa/widgets/widget_pm.dart';
import 'package:flutter/rendering.dart';

class PilihResto extends StatefulWidget {
  const PilihResto({super.key, required this.resto});

  final Resto resto;

  @override
  State<PilihResto> createState() => _PilihRestoState();
}

class _PilihRestoState extends State<PilihResto> {
  String extractLastWordBeforeLastComma() {
    String lokasi = widget.resto.lokasi!;
    int lastCommaIndex = lokasi.lastIndexOf(',');

    if (lastCommaIndex != -1) {
      // String substringAfterLastComma =
      //     lokasi.substring(lastCommaIndex + 1).trim();

      int secondLastCommaIndex = lokasi.lastIndexOf(',', lastCommaIndex - 1);

      if (secondLastCommaIndex != -1) {
        // Extract the substring between the second last comma and the last comma
        String substringBetweenCommas =
            lokasi.substring(secondLastCommaIndex + 1, lastCommaIndex).trim();

        List<String> words = substringBetweenCommas.split(' ');

        // Get the last word before the last comma
        if (words.isNotEmpty) {
          return words.last;
        }
      }
    }
    return "Word not found";
  }

  late List<ProdukResto> _produkRestos = [];
  @override
  void initState() {
    super.initState();
    _fetchProdukRestos();
        _controller.addListener(_scrollListener);

  }

  void _fetchProdukRestos() async {
    List<ProdukResto> fetchedProdukRestos = await fetchProdukRestos();
    setState(() {
      _produkRestos = fetchedProdukRestos;
    });
  }

  void addItemWidgetsToList(
    List<Widget> itemWidgets, List<ProdukResto> produkResto, items) {
    int index = 0;
    while (index < items) {
      itemWidgets.add(
        WidgetPM(
          nama: produkResto[index].nama!,
          detail: produkResto[index].deskripsi!,
          harga: produkResto[index].harga!,
          foto: produkResto[index].foto!,
        ),
      );
      index++;
    }
  }

  List<Widget> itemWidgets = [];

  // final List<WidgetPM> items = [
  //   const WidgetPM(nama: "Nama 1", detail: "Detail 1", harga: "Harga 1"),
  //   const WidgetPM(nama: "Nama 2", detail: "Detail 2", harga: "Harga 2"),
  //   const WidgetPM(nama: "Nama 2", detail: "Detail 2", harga: "Harga 2"),
  //   const WidgetPM(nama: "Nama 2", detail: "Detail 2", harga: "Harga 2"),
  //   const WidgetPM(nama: "Nama 2", detail: "Detail 2", harga: "Harga 2"),
  //   const WidgetPM(nama: "Nama 2", detail: "Detail 2", harga: "Harga 2"),
  //   const WidgetPM(nama: "Nama 2", detail: "Detail 2", harga: "Harga 2"),
  //   const WidgetPM(nama: "Nama 2", detail: "Detail 2", harga: "Harga 2"),
  // ];

  final ScrollController _controller = ScrollController();
  bool _isVisible = true;

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
    List<ProdukResto> produkResto = _produkRestos
        .where(
          (detail) => detail.restoID == widget.resto.id,
        )
        .toList();
    addItemWidgetsToList(itemWidgets, produkResto, produkResto.length);
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF8),
      body: Stack(
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollUpdateNotification) {
                _checkVisibility();
              }
              return false;
            },
            child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 400,
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        height: 325,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: <Color>[Color(0xFFED6055), Color(0xFFFACFC6)],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              child: Container(
                                margin: const EdgeInsets.only(
                                    left: 15, right: 15, top: 50),
                                child: const Icon(
                                  Icons.arrow_back_rounded,
                                  size: 20,
                                ),
                              ),
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
                                );
                              },
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 30, right: 30, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                                image: DecorationImage(
                                            image: NetworkImage(
                                                widget.resto.logo!), fit: BoxFit.contain),),
                                                
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          const Text(
                                            "Location",
                                            style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons.arrow_drop_down),
                                              Text(
                                            '${widget.resto.cabang}, ${extractLastWordBeforeLastComma()}',
                                                style: const TextStyle(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                '${widget.resto.nama}, ${widget.resto.cabang}',
                                    style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Color(0xFFD5AB55),
                                        size: 15,
                                      ),
                                      Text(
                                    widget.resto.rating!,
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        "(150)",
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        " | ",
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        "5 km",
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 1,
                                    height: 35,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 10),
                                        filled: true,
                                        hintText: 'Search',
                                        hintStyle: const TextStyle(
                                            color: Color(0xFF000000),
                                            fontFamily: 'Poppins',
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal),
                                        fillColor:
                                            const Color.fromRGBO(0, 0, 0, 0.2),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide.none,
                                        ),
                                        prefixIcon: Transform.rotate(
                                          angle:
                                              1.57079632679, // 180 degrees in radians
                                          child: const Icon(Icons.search,
                                              color: Colors.black, size: 20),
                                        ),
                                      ),
                                      onTap: () {},
                                      style: const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: 320,
                          height: 140,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                for (var item in itemWidgets) ...[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // margin: const EdgeInsets.only(left: 30, right: 30, top: 10),
                    child: item,
                    // child: ItemView(
                    //   // shrinkWrap: true,
                    //   // padding: EdgeInsets.all(0),
                    //   itemCount: items.length,
                    //   itemBuilder: (context, index) {
                    //     final item = items[index];
                    //       return WidgetPM(nama: item.nama, detail: item.detail, harga: item.harga);
                    //   },
                    // ),
                  ),
                ],
              ],
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
                  Icons.shopping_cart,
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
    );
  }
}
