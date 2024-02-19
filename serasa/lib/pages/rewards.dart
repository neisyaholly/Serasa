import 'package:flutter/material.dart';
import 'package:serasa/pages/akun.dart';
import 'package:serasa/pages/myrewards1.dart';

class Rewards extends StatefulWidget {
  const Rewards({super.key});

  @override
  State<Rewards> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return _Rewards();
  }
}

class _Rewards extends State<Rewards> {
  String _getImageAssetPathForItem(int index) {
    List<String> imagePaths = [
      'assets/images/rewards/voucher.png',
      'assets/images/rewards/voucher2.png',
      'assets/images/rewards/voucher3.png',
      'assets/images/rewards/voucher4.png',
      'assets/images/rewards/voucher5.png',
      'assets/images/rewards/voucher6.png',
      'assets/images/rewards/voucher7.png',
    ];

    if (index >= 0 && index < imagePaths.length) {
      return imagePaths[index];
    } else {
      return 'assets/images/rewards/voucher.png';
    }
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
      backgroundColor: const Color.fromRGBO(255, 254, 248, 1),
      body: Center(
        child: Column(
          children: [
            // const SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, right: 25.0, left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Akun(),
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
                  const Expanded(
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Text("Hai, Nama!",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w500))),
                  ),
                ],
              ),
            ),
            Container(
              height: 460,
              width: 1000,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/rewards/starUpdated.png'),
                  fit: BoxFit.cover, // Fill the container
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "320",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFFED6055),
                        fontSize: 96,
                        fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () => toMyreward(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 244, 99, 88),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                    ),
                    child: const Text("My Rewards",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                  ),
                ],
              ),
            ),
            // Stack(
            //   children: [
            //     Positioned(
            //       // bottom: 100,
            //       child: Center(
            //         child: Container(
            //           // width: 1000,
            //           height: 650,
            //           decoration: const BoxDecoration(
            //             image: DecorationImage(
            //               image:
            //                   AssetImage('assets/images/rewards/starlagi.png'),
            //               fit: BoxFit.cover, // Fill the container
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     const Positioned(
            //       // left: 0,
            //       // top: 10,
            //       // right: 0,
            //       // bottom: 50,
            //       child: Center(
            //         child: Text(
            //           "320",
            //           style: TextStyle(
            //               fontFamily: 'Poppins',
            //               color: Color(0xFFED6055),
            //               fontSize: 96,
            //               fontWeight: FontWeight.bold),
            //         ),
            //       ),
            //     ),
            //     Positioned(
            //       left: 0,
            //       right: 0,
            //       bottom: 138,
            //       child: Center(
            //         child: SizedBox(
            //           width: 140,
            //           height: 45,
            //           child: ElevatedButton(
            //             onPressed: () => toMyreward(context),
            //             style: ElevatedButton.styleFrom(
            //               backgroundColor:
            //                   const Color.fromARGB(255, 244, 99, 88),
            //               foregroundColor: Colors.white,
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(7),
            //               ),
            //               padding: const EdgeInsets.symmetric(
            //                   vertical: 5, horizontal: 5),
            //             ),
            //             child: const Text("My Rewards",
            //                 style: TextStyle(
            //                     fontFamily: 'Poppins',
            //                     fontWeight: FontWeight.bold,
            //                     fontSize: 14)),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Voucher Teratas",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: SizedBox(
                      height: 100,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 7,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          var imageAssetPath = _getImageAssetPathForItem(index);

                          return Container(
                            margin: const EdgeInsets.only(right: 15),
                            width: 250,
                            decoration: BoxDecoration(
                                // color: Colors.amberAccent,
                                borderRadius: BorderRadius.circular(10)),
                            child:
                                Image.asset(imageAssetPath, fit: BoxFit.cover),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 27.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Voucher Minggu Ini",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: SizedBox(
                      height: 100,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 7,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          var imageAssetPath = _getImageAssetPathForItem(index);

                          return Container(
                            margin: const EdgeInsets.only(right: 15),
                            width: 250,
                            decoration: BoxDecoration(
                                // color: Colors.amberAccent,
                                borderRadius: BorderRadius.circular(10)),
                            child:
                                Image.asset(imageAssetPath, fit: BoxFit.cover),
                          );
                        },
                      ),
                    ),
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
