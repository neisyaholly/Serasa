import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  // final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    builder: (context) => const HelpPage(),
                  ),
                );
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xFFED6055),
              ),
            ),
            const Text(
              'Pusat Bantuan',
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Hai, Nathasya!',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                // const SizedBox(height: 5),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Butuh Bantuan apa?',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors
                        .white, // Set the background color of the container
                    borderRadius: BorderRadius.circular(
                        5), // Set the border radius of the container
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(
                            0.6), // Set the shadow color with opacity
                        spreadRadius:
                            0.5, // Set the spread radius of the shadow
                        blurRadius: 3, // Set the blur radius of the shadow
                        offset: const Offset(
                            0, 0.1), // Set the offset of the shadow
                      ),
                    ],
                  ),
                  child: const TextField(
                    maxLines: 5, // Set the maximum number of lines
                    decoration: InputDecoration(
                      hintText: 'Ketik yang kamu butuhkan disini',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color(0xFFFBDED7),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 7.0, horizontal: 12.0),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide.none,
                      ),
                      hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                      ),
                      // Add a border around the text field
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFED6055),
                    shape: RoundedRectangleBorder(
                      // Set the shape of the button
                      borderRadius: BorderRadius.circular(17),
                    ),
                    elevation: 3,
                  ),
                  onPressed: () {
                    // Handle form submission here
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFFFAFA),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/images/logoSerasaHeader.png'),
          ),
        ],
      ),
    );
  }
}
