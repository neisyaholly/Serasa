import 'package:flutter/material.dart';
import 'package:serasa/classes/detail_keranjang.dart';
import 'package:serasa/classes/keranjang.dart';
import 'package:serasa/classes/produk_resto.dart';
import 'package:serasa/classes/resto.dart';
import 'package:serasa/functions/functions.dart';
import 'package:serasa/pages/checkout.dart';
import 'package:serasa/pages/navbar.dart';
import 'package:serasa/widgets/widget_cart.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();

  static fromJson(json) {}
}

class _CartState extends State<Cart> {
  // int? id;
  // int? userID;

  // int? id;
  // int? keranjangID;
  // int? produkID;
  // int? qty;

  // List<Cart> cartItems = [];

  // void addItemToCart(String nama, String jumlah, String jenis) {
  //   setState(() {
  //     cartItems.add(Cart(nama, jumlah, jenis));
  //   });
  // }

  late List<Keranjang> _keranjangs = [];
  late List<DetailKeranjang> _detailKeranjangs = [];
  late List<ProdukResto> _produkRestos = [];
  late List<Resto> _restos = [];

  @override
  void initState() {
    super.initState();
    _fetchKeranjangs();
    _fetchDetailKeranjangs();
    _fetchProdukRestos();
    _fetchRestos();
  }

  void _fetchKeranjangs() async {
    List<Keranjang> fetchedKeranjangs = await fetchKeranjangs();
    setState(() {
      _keranjangs = fetchedKeranjangs;
    });
    _keranjangs = _keranjangs
        .where(
          (detail) => detail.userID == currentUser!.id,
        )
        .toList();
  }

  void _fetchDetailKeranjangs() async {
    List<DetailKeranjang> fetchedDetailKeranjangs =
        await fetchDetailKeranjangs();
    setState(() {
      _detailKeranjangs = fetchedDetailKeranjangs;
    });
  }

  void _fetchProdukRestos() async {
    List<ProdukResto> fetchedProdukRestos = await fetchProdukRestos();
    setState(() {
      _produkRestos = fetchedProdukRestos;
    });
  }

  void _fetchRestos() async {
    List<Resto> fetchedRestos = await fetchRestos();
    setState(() {
      _restos = fetchedRestos;
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
                // color: Colors.black,
                margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GestureDetector(
                  child: Container(
                    // color: Colors.amber,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            // shrinkWrap: true,
                            padding: const EdgeInsets.all(0),
                            itemCount: _keranjangs.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              Keranjang keranjang = _keranjangs[index];

                              // Find the matching DetailKeranjang where keranjangID matches id
                              DetailKeranjang detailKeranjang =
                                  _detailKeranjangs.firstWhere(
                                (detail) => detail.keranjangID == keranjang.id,
                                orElse: () => DetailKeranjang(-1, -1, -1,
                                    -1), // Default value if not found
                              );

                              ProdukResto produkResto =
                                  _produkRestos.firstWhere(
                                (produkResto) =>
                                    produkResto.id == detailKeranjang.produkID,
                                orElse: () => ProdukResto(-1, -1, "", "", -1,
                                    -1, ""), // Default value if not found
                              );

                              // Find the matching Resto based on the found ProdukResto's restoID
                              Resto resto = _restos.firstWhere(
                                (resto) => resto.id == produkResto.restoID,
                                orElse: () => Resto(-1, "", "", "", "", "",
                                    ""), // Default value if not found
                              );

                              // Use the restaurant name (nama) from the Resto

                              List<DetailKeranjang> detailsForKeranjang =
                                  _detailKeranjangs
                                      .where(
                                        (detail) =>
                                            detail.keranjangID == keranjang.id,
                                      )
                                      .toList();

                              return WidgetCart(
                                nama: resto,
                                jumlah: detailsForKeranjang,
                                jenis: detailsForKeranjang,
                                count: detailsForKeranjang.length,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Checkout(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
