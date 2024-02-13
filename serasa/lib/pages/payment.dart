import 'package:flutter/material.dart';
import 'package:serasa/pages/checkout.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String _selectedPaymentMethod = 'ovo';

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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Checkout(),
                  ),
                );
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xFFED6055),
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
                runSpacing: 20.0,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFF4F6F8),
                      shape: BoxShape.rectangle,
                    ),
                    child: RadioListTile<String>(
                      title: const Text(
                        'OVO',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      value: 'ovo',
                      groupValue: _selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentMethod = value!;
                        });
                      },
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFF4F6F8),
                      shape: BoxShape.rectangle,
                    ),
                    child: RadioListTile<String>(
                      title: const Text(
                        'GoPay',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      value: 'gopay',
                      groupValue: _selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentMethod = value!;
                        });
                      },
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFF4F6F8),
                      shape: BoxShape.rectangle,
                    ),
                    child: RadioListTile<String>(
                      title: const Text(
                        'ShopeePay',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      value: 'shopeepay',
                      groupValue: _selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentMethod = value!;
                        });
                      },
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFF4F6F8),
                      shape: BoxShape.rectangle,
                    ),
                    child: RadioListTile<String>(
                      title: const Text(
                        'Dana',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      value: 'dana',
                      groupValue: _selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentMethod = value!;
                        });
                      },
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFF4F6F8),
                      shape: BoxShape.rectangle,
                    ),
                    child: RadioListTile<String>(
                      title: const Text(
                        'Transfer Bank',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      value: 'transfer',
                      groupValue: _selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentMethod = value!;
                        });
                      },
                    ),
                  ),
                ],
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
                    // Handle form submission here
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
