import 'package:flutter/material.dart';
import 'package:serasa/classes/pembayaran.dart';
import 'package:serasa/functions/functions.dart';
import 'package:serasa/pages/checkout2.dart';

// ignore: must_be_immutable
class PaymentCommunity extends StatefulWidget {
  PaymentCommunity({super.key, required this.selectedPaymentMethod});

  String? selectedPaymentMethod;

  @override
  State<PaymentCommunity> createState() => _PaymentCommunityState();
}

class _PaymentCommunityState extends State<PaymentCommunity> {
  late List<Pembayaran> _pembayarans = [];
  @override
  void initState() {
    super.initState();
    _fetchPembayarans();
  }

  void _fetchPembayarans() async {
    List<Pembayaran> fetchedPembayarans = await fetchPembayarans();
    setState(() {
      _pembayarans = fetchedPembayarans;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFEF8),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context, widget.selectedPaymentMethod);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xFFED6055),
                size: 20,
              ),
            ),
            const Text(
              'Pembayaran',
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
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 10.0, left: 30.0, right: 30.0, bottom: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pilih Metode Pembayaran',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                runSpacing: 15.0,
                children: List.generate(
                  _pembayarans.length,
                  (index) {
                    // if (selectedPengambilanMethod.ongkosKirim == "Gosend" &&
                    //     index == 1) {
                    //   return SizedBox.shrink(); // To hide the item
                    // }
                    return Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFF4F6F8),
                        shape: BoxShape.rectangle,
                      ),
                      child: RadioListTile<String>(
                        contentPadding:
                            const EdgeInsets.only(left: 15, right: 15),
                        title: Text(
                          _pembayarans[index].jenis.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        value: _pembayarans[index].jenis.toString(),
                        groupValue: widget.selectedPaymentMethod,
                        onChanged: (value) {
                          setState(() {
                            widget.selectedPaymentMethod = value!;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 280),
              SizedBox(
                width: 350,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFED6055),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 2,
                  ),
                  onPressed: () {
                    Navigator.pop(context, widget.selectedPaymentMethod);
                  },
                  child: const Text(
                    'Pilih',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFFFAFA),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
