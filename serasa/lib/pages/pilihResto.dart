import 'package:flutter/material.dart';
import 'package:serasa/widgets/widget_pr.dart';
import '../utils/color.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              child: Stack(
                children: [
                  Container(
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
                      Container(
                        margin: const EdgeInsets.only(left: 15, right: 15, top: 50),
                        child: const Icon(Icons.arrow_back_rounded),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 30, right: 30, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(10)),
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("Location"),
                                    Row(
                                      children: [
                                        Icon(Icons.arrow_drop_down),
                                        Text("Sentul City, Bogor"),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            const Text("Starbucks, Sentul City"),
                            const Row(
                              children: [
                                Icon(Icons.star),
                                Text("4,9"),
                                Text("(150)"),
                                Text(" | "),
                                Text("5 km"),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 1,
                              height: 30,
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding:
                                  const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
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
                                onTap: () {},
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                            const SizedBox(height: 10,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 315,
                      height: 140,
                      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
              ],
            ),
            ),
            for (var item in items) ...[
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 30, right: 30, top: 10),
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