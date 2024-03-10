import 'package:flutter/material.dart';
import 'package:serasa/widgets/popup_Riwayat.dart';
import 'package:serasa/widgets/widget_pesanan.dart';
import 'package:video_player/video_player.dart';

class Pesanan extends StatefulWidget {
  const Pesanan({super.key});

  @override
  State<Pesanan> createState() => _PesananState();
}

class _PesananState extends State<Pesanan> {
  bool isPopUpShown = false; // State variable to track popup visibility

  void togglePopUpVisibility() {
    setState(() {
      isPopUpShown = !isPopUpShown; // Toggle popup visibility
    });
  }

  late VideoPlayerController _controller;

  void initState() {
  super.initState();
  _controller = VideoPlayerController.asset('assets/videos/gudd.mp4')
    ..initialize().then((_) {
      setState(() {}); // Ini opsional, tergantung kebutuhan Anda
      _controller.setLooping(true); // Set looping video
      _controller.play(); // Play video secara otomatis setelah diinisialisasi
    });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 65),
                child: Column(
                  children: [
                    Text("Pesanan Anda"),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Colors.amber),
                      child:Container(
                        width: _controller.value.size.width,
                        height: _controller.value.size.height,
                        child: VideoPlayer(_controller)),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Riwayat Pesanan"),
                          Icon(Icons.sort),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.4,
                      // margin: EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.all(0),
                              itemCount: 10,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (_, index) {
                                return WidgetPesanan(
                                  nama: "nama",
                                  jumlah: "1",
                                  jenis: "jenis",
                                  harga: "harga",
                                  onPressed: () {
                                    togglePopUpVisibility();
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (isPopUpShown)
            GestureDetector(
              onTap: () {},
              child: Container(
                // Semi-transparent background
                alignment: Alignment.bottomCenter,
                child: PopUpRiwayat(
                    closePopUp:
                        togglePopUpVisibility), // Show popup in the center
              ),
            ),
        ],
      ),
    );
  }
}
