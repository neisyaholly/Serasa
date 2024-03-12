import 'package:flutter/material.dart';
import 'package:serasa/classes/voucher.dart';

class PopUpReward extends StatefulWidget {
  const PopUpReward({super.key, required this.closePopUp, required this.handleYesButtonClick, required this.voucher});

  final VoidCallback closePopUp;
  final void Function(Voucher voucher) handleYesButtonClick;
  final Voucher voucher;
  
  
  @override
  State<PopUpReward> createState() => _PopUpRewardState();
}

class _PopUpRewardState extends State<PopUpReward> {
Voucher? get voucher => widget.voucher; 

  void _handleYesButtonClick() async {
  try {
    if (widget.voucher != null) {
      widget.handleYesButtonClick(widget.voucher!);
    } else {
      print('Voucher is null');
    }
  } catch (e) {
    print('Error handling voucher: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      height: 220,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Apakah Kamu Yakin?", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF2F2D2C))),
          const Text("Anda tidak dapat mengembalikan poin di kemudian hari jika Anda memutuskan untuk menukarkannya sekarang", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.normal, fontSize: 10, color: Color(0xFF2F2D2C)),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 10,),
              GestureDetector(
                onTap: (){
                  _handleYesButtonClick();
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: const Color(0xFFED6055), borderRadius: BorderRadius.circular(10)),
                  width: 100,
                  height: 28,
                  child: const Text("Ya", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500, fontSize: 15, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: widget.closePopUp,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(border: Border.all(color: const Color(0xFFED6055), width: 2), borderRadius: BorderRadius.circular(10)),
                  width: 100,
                  height: 28,
                  child: const Text("Tidak", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500, fontSize: 15, color: Color(0xFFED6055))),
                ),
              ),
              const SizedBox(width: 10,),
            ],
          ),
        ],
      ),
    );
  }
}
