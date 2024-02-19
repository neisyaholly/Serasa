import 'package:flutter/material.dart';
import 'package:serasa/pages/riwayatpenukaran.dart';

class Myreward extends StatefulWidget {
  const Myreward({super.key});

  @override
  State<Myreward> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return _Myreward();
  }
  
}

void sementara(){
  return;
}

class _Myreward extends State<Myreward> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    void toRiwayatpenukaran(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Riwayatpenukaran()), // Assuming Checkout is a StatelessWidget
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 254, 248, 1),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 60.0, left: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: sementara, 
                    icon: Icon(Icons.arrow_back),
                      // style: TextButton.styleFrom(foregroundColor: Color.fromARGB(1, 237, 96, 85)),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MouseRegion(
                    onEnter: (_) => setState(() => _isHovered = true),
                    onExit: (_) => setState(() => _isHovered = false),
                    child: ElevatedButton(
                      onPressed: sementara,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isHovered? Colors.red : const Color.fromARGB(255, 203, 219, 26),
                        foregroundColor: Colors.black,
                      ),
                      child: Text("Voucher Aktif"),
                    ),
                  ),
                  MouseRegion(
                    onEnter: (_) => setState(() => _isHovered = true),
                    onExit: (_) => setState(() => _isHovered = false),
                    child: ElevatedButton(
                      onPressed: () => toRiwayatpenukaran(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isHovered? Colors.red : const Color.fromARGB(255, 217, 217, 217),
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
                  Image.asset("assets/images/rewards/voucherriwayat.png", width: 350,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}