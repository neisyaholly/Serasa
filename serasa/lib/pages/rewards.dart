import 'package:flutter/material.dart';
import 'package:serasa/classes/voucher.dart';
import 'package:serasa/pages/myrewards1.dart';
import 'package:serasa/pages/navbar.dart';
import 'package:serasa/widgets/popup_Reward.dart';
import 'package:serasa/functions/functions.dart';

class Rewards extends StatefulWidget {
  const Rewards({super.key});

  @override
  State<Rewards> createState() {
    return _Rewards();
  }
}

class _Rewards extends State<Rewards> {
  List<Voucher> _vouchers = []; // Store the fetched vouchers

  // Fetch vouchers on widget initialization
  @override
  void initState() {
    super.initState();
    _fetchVouchers();
  }

  // Function to fetch vouchers from the server
  void _fetchVouchers() async {
    try {
      List<Voucher> vouchers = await fetchVouchers();
      setState(() {
        _vouchers = vouchers;
      });
    } catch (e) {
      print('Error fetching vouchers: $e');
    }
  }

Voucher? selectedVoucher;

  void setSelectedVoucher(Voucher voucher) {
    setState(() {
      selectedVoucher = voucher;
    });
  }

  bool isPopUpShown = false; // State variable to track popup visibility

 void togglePopUpVisibility({int? index}) {
  setState(() {
    isPopUpShown = !isPopUpShown; // Toggle popup visibility
    if (isPopUpShown && index != null) {
      setSelectedVoucher(_vouchers[index]);
    }
  });
}

  void closePopUp() {
    setState(() {
      isPopUpShown = false; 
    });
  }

void _handleYesButtonClick(Voucher? voucher) async {
  if (voucher != null) {
    try {
      await createVoucherUserEntry(voucher, currentUser!.id!);

      int updatedPoints = currentUser!.poin! - voucher.poin!;
      await updateUserPoin(currentUser!.id!, updatedPoints);

      _fetchVouchers();
      togglePopUpVisibility();
    } catch (e) {
      print('Error handling voucher: $e');
    }
  }
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
                              itemCount: _vouchers.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) {
                                String imageUrl = _vouchers[index].foto ?? ''; // Get the image URL
                                return GestureDetector(
                                  onTap: () {
                                    togglePopUpVisibility(index: index);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 15),
                                    width: 400,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage(imageUrl), // Load image from URL
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
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
                              itemCount: _vouchers.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) {
                                String imageUrl = _vouchers[index].foto ?? ''; // Get the image URL
                                return GestureDetector(
                                  onTap: () {
                                    togglePopUpVisibility(index: index);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 15),
                                    width: 400,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage(imageUrl), // Load image from URL
                                        fit: BoxFit.cover,
                                      ),
                                    ),
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
                      child: selectedVoucher != null 
                      ? PopUpReward(closePopUp: closePopUp, handleYesButtonClick: _handleYesButtonClick, voucher: selectedVoucher!)
                      : Container(),
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
