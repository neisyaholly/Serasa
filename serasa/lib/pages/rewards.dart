import 'package:flutter/material.dart';
import 'package:serasa/pages/myrewards1.dart';
import 'package:serasa/pages/navbar.dart';
import 'package:serasa/widgets/popup_Reward.dart';
import 'package:serasa/functions/functions.dart';

class Rewards extends StatefulWidget {
  const Rewards({Key? key}) : super(key: key);

  @override
  State<Rewards> createState() {
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

  bool isPopUpShown = false; // State variable to track popup visibility

  void togglePopUpVisibility() {
    setState(() {
      isPopUpShown = !isPopUpShown; // Toggle popup visibility
    });
  }

  void closePopUp() {
    setState(() {
      isPopUpShown = false; // Set isPopUpShown to false to close the popup
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 254, 248, 1),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, right: 30.0, left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const BottomNavigationBarExample(
                                        initialIndex: 4),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Color(0xFFED6055),
                            size: 20,
                          ),
                        ),
                        Expanded(
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Text("Hai, ${currentUser!.name!}!",
                                  style: const TextStyle(
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
                        Text(
                          "${currentUser!.poin!}",
                          style: const TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFFED6055),
                              fontSize: 96,
                              fontWeight: FontWeight.bold),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const VoucherAktif(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(140, 45),
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
                                  fontSize: 15)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Voucher Teratas",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500)),
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: SizedBox(
                            height: 100,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 7,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) {
                                var imageAssetPath =
                                    _getImageAssetPathForItem(index);
                                return Container(
                                  margin: const EdgeInsets.only(right: 15),
                                  width: 250,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Image.asset(imageAssetPath,
                                      fit: BoxFit.cover),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, top: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Voucher Minggu Ini",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500)),
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: SizedBox(
                            height: 100,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 7,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) {
                                var imageAssetPath =
                                    _getImageAssetPathForItem(index);
                                return GestureDetector(
                                  onTap: () {
                                    togglePopUpVisibility();
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 15),
                                    width: 250,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Image.asset(imageAssetPath,
                                        fit: BoxFit.cover),
                                  ),
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
            if (isPopUpShown)
              GestureDetector(
                onTap: () {}, // Prevent closing popup when tapping outside
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey.withOpacity(0.8)),
                  child: Center(
                    child: Container(
                      child: PopUpReward(closePopUp: closePopUp),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
