import 'package:flutter/material.dart';
import 'package:serasa/pages/navbar.dart';
import 'package:serasa/widgets/widget_cart.dart';


class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15, top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BottomNavigationBarExample(initialIndex: 0),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFFED6055),
                        size: 20,
                      ),
                    ),
                    const Row(
                      children: [
                        Icon(Icons.shopping_cart),
                        Text(
                          ' Keranjang Belanja',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Opacity(
                      opacity: 0,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Color(0xFFED6055),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 30, right: 30, bottom: 15),
                child: Column(
                  children: [
                    // const Row(
                    //   children: [
                    //     Icon(Icons.sort),
                    //     SizedBox(width: 10,),
                    //     Text("Sort By"),
                    //   ],
                    // ),
                    // const SizedBox(height: 10,),
                    Expanded(
                      child: ListView.builder(
                        // shrinkWrap: true,
                        padding: const EdgeInsets.all(0),
                        itemCount: 8,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (_, index) {
                          return const WidgetCart(nama: "Nama Resto", jumlah: "1", jenis: "jenis");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}