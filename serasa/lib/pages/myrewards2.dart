import 'package:flutter/material.dart';
import 'package:serasa/pages/myrewards1.dart';
import 'package:serasa/pages/rewards.dart';

class RiwayatPenukaran extends StatefulWidget {
  const RiwayatPenukaran({super.key});

  @override
  State<RiwayatPenukaran> createState() {
    return _RiwayatPenukaran();
  }
}

class _RiwayatPenukaran extends State<RiwayatPenukaran> {
  bool _isHovered = false;

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
      backgroundColor: const Color.fromRGBO(255, 254, 248, 1),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 15.0),
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
              padding: const EdgeInsets.only(
                top: 15.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MouseRegion(
                    onEnter: (_) => setState(() => _isHovered = true),
                    onExit: (_) => setState(() => _isHovered = false),
                    child: ElevatedButton(
                      onPressed: () => toMyreward(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isHovered
                            ? Colors.red
                            : const Color.fromARGB(255, 217, 217, 217),
                        foregroundColor: Colors.black,
                      ),
                      child: const Text("Voucher Aktif"),
                    ),
                  ),
                  MouseRegion(
                    onEnter: (_) => setState(() => _isHovered = true),
                    onExit: (_) => setState(() => _isHovered = false),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isHovered
                            ? Colors.red
                            : const Color.fromARGB(255, 203, 219, 26),
                        foregroundColor: Colors.black,
                      ),
                      child: const Text("Riwayat Penukaran"),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/rewards/voucherriwayat.png",
                    width: 350,
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
