import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:serasa/classes/voucher.dart';
import 'package:serasa/functions/functions.dart';

class PopUpReward extends StatefulWidget {
  const PopUpReward({super.key, required this.closePopUp, required this.handleYesButtonClick, required this.voucher});

  final VoidCallback closePopUp;
  final void Function(Voucher voucher) handleYesButtonClick;
  final Voucher voucher;
  
  
  @override
  State<PopUpReward> createState() => _PopUpRewardState();
}

class _PopUpRewardState extends State<PopUpReward> {
Voucher? get voucher => widget.voucher; // Define getter for voucher

  void _handleYesButtonClick() async {
  try {
    if (widget.voucher != null) {
      // Call the function to handle the Yes button click with the voucher
      widget.handleYesButtonClick(widget.voucher!);
    } else {
      // Handle null case
      print('Voucher is null');
    }
  } catch (e) {
    print('Error handling voucher: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      height: 220,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Apakah Kamu Yakin?", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF2F2D2C))),
          Text("Anda tidak dapat mengembalikan poin di kemudian hari jika Anda memutuskan untuk menukarkannya sekarang", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.normal, fontSize: 10, color: Color(0xFF2F2D2C)),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 10,),
              GestureDetector(
                onTap: (){
                  _handleYesButtonClick();
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Color(0xFFED6055), borderRadius: BorderRadius.circular(10)),
                  width: 100,
                  height: 28,
                  child: Text("Ya", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500, fontSize: 15, color: Colors.white)),
                ),
              ),
              GestureDetector(
                onTap: widget.closePopUp,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(border: Border.all(color: Color(0xFFED6055), width: 2), borderRadius: BorderRadius.circular(10)),
                  width: 100,
                  height: 28,
                  child: Text("Tidak", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500, fontSize: 15, color: Color(0xFFED6055))),
                ),
              ),
              SizedBox(width: 10,),
            ],
          ),
        ],
      ),
    );
  }
}
