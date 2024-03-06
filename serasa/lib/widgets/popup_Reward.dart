import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopUpReward extends StatefulWidget {
  const PopUpReward({super.key, required this.closePopUp});

  final VoidCallback closePopUp;

  @override
  State<PopUpReward> createState() => _PopUpRewardState();
}

class _PopUpRewardState extends State<PopUpReward> {

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
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Color(0xFFED6055), borderRadius: BorderRadius.circular(10)),
                width: 100,
                height: 28,
                child: Text("Ya", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500, fontSize: 15, color: Colors.white)),
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
