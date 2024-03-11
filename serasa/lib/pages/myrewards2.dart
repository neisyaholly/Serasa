import 'package:flutter/material.dart';
import 'package:serasa/pages/myrewards1.dart';
import 'package:serasa/pages/rewards.dart';
import 'package:serasa/functions/functions.dart';
import 'package:serasa/classes/voucher.dart';
import 'package:serasa/classes/voucherUser.dart';

class RiwayatPenukaran extends StatefulWidget {
  const RiwayatPenukaran({super.key});

  @override
  State<RiwayatPenukaran> createState() {
    return _RiwayatPenukaran();
  }
}

class _RiwayatPenukaran extends State<RiwayatPenukaran> {
  bool _isHovered = false;
  late List<Voucher> _vouchers = [];
  late List<VoucherUser> _voucherUser = [];

  @override
  void initState() {
    super.initState();
    _fetchVouchers();
    _fetchVoucherUser();
  }

  void _fetchVouchers() async {
    List<Voucher> fetchedVouchers = await fetchVouchers();
      setState(() {
        _vouchers = fetchedVouchers;
    });
  }
  void _fetchVoucherUser() async {
    List<VoucherUser> fetchedVoucherUser = await fetchVoucherUser();
      setState(() {
        _voucherUser = fetchedVoucherUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    void toMyreward(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const VoucherAktif()), // Assuming Checkout is a StatelessWidget
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF8),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Rewards(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFFED6055),
                        size: 20,
                      ),
                      // style: TextButton.styleFrom(foregroundColor: Color.fromARGB(1, 237, 96, 85)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MouseRegion(
                      onEnter: (_) => setState(() => _isHovered = true),
                      onExit: (_) => setState(() => _isHovered = false),
                      child: SizedBox(
                        width: 155,
                        child: ElevatedButton(
                          onPressed: () => toMyreward(context),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15), // Adjust the value as needed
                            ),
                            backgroundColor: _isHovered
                                ? Colors.red
                                : const Color.fromARGB(255, 217, 217, 217),
                            foregroundColor: Colors.black,
                          ),
                          child: const Text("Voucher Aktif",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal)),
                        ),
                      ),
                    ),
                    MouseRegion(
                      onEnter: (_) => setState(() => _isHovered = true),
                      onExit: (_) => setState(() => _isHovered = false),
                      child: SizedBox(
                        width: 175,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15), // Adjust the value as needed
                            ),
                            backgroundColor: _isHovered
                                ? Colors.red
                                : const Color.fromARGB(255, 203, 219, 26),
                            foregroundColor: Colors.black,
                          ),
                          child: const Text("Riwayat Penukaran",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: _vouchers.where((voucher) => _voucherUser.any((vu) => vu.voucherID == voucher.id && vu.terpakai == 1)).map((voucher){
                    return GestureDetector(
                      child: Image.network(
                        voucher.foto!,
                        width: 350,
                      ),
                      //  onTap: () {
                      //   Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => Skvoucher(voucherID: voucher.id ?? 0),
                      //     ),
                      //   );
                      // },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
