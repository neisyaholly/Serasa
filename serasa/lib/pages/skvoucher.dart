import 'package:flutter/material.dart';
import 'package:serasa/classes/voucher.dart';
import 'package:serasa/pages/myrewards1.dart';
import 'package:serasa/functions/functions.dart';

  //  Future <void> updateVoucherUser(int voucherID) async {
  //   final Database database = await openDatabase('serasa.db');
  //   await database.update(  
  //     'voucher_users',
  //     {'terpakai': 1},
  //     where: 'voucherID = ?',
  //     whereArgs: [voucherID],
  //   );
  //   await database.close();
  // }

class Skvoucher extends StatefulWidget {
  final int voucherID;
  final List<Voucher> vouchers;
  const Skvoucher({super.key, required this.vouchers, required this.voucherID});

  @override
  State<Skvoucher> createState() {
    return _Skvoucher();
  }

}

void sementara() {
  return;
}

class _Skvoucher extends State<Skvoucher> {
  late Voucher _selectedVoucher;
  late int _daysLeft;

  @override
  void initState() {
    super.initState();
    _selectedVoucher =
        widget.vouchers.firstWhere((voucher) => voucher.id == widget.voucherID);
    _calculateDaysLeft();
  }

  void _calculateDaysLeft() {
    DateTime? expirationDate;
    if(_selectedVoucher.exp != null){
      expirationDate = DateTime.parse(_selectedVoucher.exp!);
    }
    DateTime today = DateTime.now();
    Duration difference = expirationDate!.difference(today);
    _daysLeft = difference.inDays;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 254, 248, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const VoucherAktif(),
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
                      'Detail Voucher',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
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
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: Column(
                    children: [
                      Container(
                        width: 350,
                        height: 180,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(0, 0, 0, 0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Center(
                            child: Image.network(_selectedVoucher.foto!, fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 20),
                        child: Column(
                          children: [
                            Text(_selectedVoucher.nama?? '',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500)),
                            const Padding(padding: EdgeInsets.only(bottom: 8)),
                            Center(
                              child: Container(
                                width: 280,
                                height: 35,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 203, 219, 26),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Center(
                                  child: Text(
                                      "Voucher akan kedaluwarsa dalam $_daysLeft hari",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.normal)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1.5,
                        width: 1000,
                        color: const Color.fromARGB(49, 152, 152, 152),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Deskripsi",
                                style: TextStyle(
                                    fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                            const Padding(padding: EdgeInsets.only(bottom: 8)),
                            Text(
                                _selectedVoucher.deskripsi?? '',
                                style: const TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                                textAlign: TextAlign.justify),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Syarat & Ketentuan",
                                style: TextStyle(
                                    fontSize: 14, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                            const Padding(padding: EdgeInsets.only(bottom: 8)),
                            Text(
                                _selectedVoucher.sk?? '',
                                style: const TextStyle(fontSize: 12, fontFamily: 'Poppins'),
                                textAlign: TextAlign.justify),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 342,
                        child: ElevatedButton(
                          onPressed: () async{
                            updateVoucherUsers(widget.voucherID);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const VoucherAktif(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 244, 99, 88),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(10),
                          ),
                          child: const Text("Pakai Voucher",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ], //batas col
                  ),
                ),
              ], //paling luar
            ),
          ),
        ),
      ),
    );
  }
}
