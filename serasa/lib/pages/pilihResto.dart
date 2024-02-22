import 'package:flutter/material.dart';
import 'package:serasa/pages/home.dart';
import 'package:serasa/widgets/widget_pr.dart';

class PilihResto extends StatefulWidget {
  const PilihResto({super.key});

  @override
  State<PilihResto> createState() => _PilihRestoState();
}

class _PilihRestoState extends State<PilihResto> {
  final List<WidgetPR> items = [
    const WidgetPR(nama: "Nama 1", detail: "Detail 1", harga: "Harga 1"),
    const WidgetPR(nama: "Nama 2", detail: "Detail 2", harga: "Harga 2"),
    const WidgetPR(nama: "Nama 2", detail: "Detail 2", harga: "Harga 2"),
    const WidgetPR(nama: "Nama 2", detail: "Detail 2", harga: "Harga 2"),
    const WidgetPR(nama: "Nama 2", detail: "Detail 2", harga: "Harga 2"),
    const WidgetPR(nama: "Nama 2", detail: "Detail 2", harga: "Harga 2"),
    const WidgetPR(nama: "Nama 2", detail: "Detail 2", harga: "Harga 2"),
    const WidgetPR(nama: "Nama 2", detail: "Detail 2", harga: "Harga 2"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF8),
      body: SingleChildScrollView(
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
                            child: const Icon(Icons.arrow_back_rounded),
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
                                            BorderRadius.circular(10)),
                                  ),
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Location",
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.arrow_drop_down),
                                          Text(
                                            "Sentul City, Bogor",
                                            style: TextStyle(
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
                              const Text(
                                "Starbucks, Sentul City",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color(0xFFD5AB55),
                                    size: 15,
                                  ),
                                  Text(
                                    " 4,9",
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
            for (var item in items) ...[
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
                //       return WidgetPR(nama: item.nama, detail: item.detail, harga: item.harga);
                //   },
                // ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
