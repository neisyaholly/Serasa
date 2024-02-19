import 'package:flutter/material.dart';
import 'package:serasa/myreward.dart';

class Reward extends StatefulWidget {
  const Reward({super.key});

  @override
  State<Reward> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return _Reward();
  }
}

void sementara(){
  return;
}

class _Reward extends State<Reward> {
  String _getImageAssetPathForItem(int index){
    List <String> imagePaths = [
      'assets/images/rewards/voucher.png',
      'assets/images/rewards/voucher2.png',
      'assets/images/rewards/voucher3.png',
      'assets/images/rewards/voucher4.png',
      'assets/images/rewards/voucher5.png',
      'assets/images/rewards/voucher6.png',
      'assets/images/rewards/voucher7.png',
    ];

    if(index >=0 && index < imagePaths.length){
      return imagePaths[index];
    }else{
      return 'assets/images/rewards/voucher.png';
    }
  }

  @override
  Widget build(BuildContext context){
    void toMyreward(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Myreward()), // Assuming Checkout is a StatelessWidget
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 254, 248, 1),
      body: Center(
        child: Column(
          children: [
            // const SizedBox(height: 40,),
            const Padding(
              padding: EdgeInsets.only(top: 40.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: sementara, 
                    icon: Icon(Icons.arrow_back),
                      // style: TextButton.styleFrom(foregroundColor: Color.fromARGB(1, 237, 96, 85)),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topRight, 
                      child: Text("Hai, Nama!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1.0,
                  child:
                  Image.asset('assets/images/rewards/starlagi.png', width: 1000,),
                ),
                const Positioned.fill(
                  left: 0,
                  right: 0,
                  bottom: 35,
                  child: Center(
                    child: Text("320", style: TextStyle(color: Color.fromARGB(255, 244, 99, 88), fontSize: 65, fontWeight: FontWeight.w800),),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 138,
                  child: Center(
                    child: SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () => toMyreward(context), 
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 244, 99, 88),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5), 
                        ),
                        child: const Text("My Rewards", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 10,),
            
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Voucher Teratas", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Image.asset(imageAssetPath, fit: BoxFit.cover),
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
                  const Text("Voucher Minggu Ini", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Image.asset(imageAssetPath, fit: BoxFit.cover),
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