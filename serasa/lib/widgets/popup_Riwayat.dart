import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class PopUpRiwayat extends StatefulWidget {
  const PopUpRiwayat({super.key, required this.closePopUp});

  final VoidCallback closePopUp;

  @override
  State<PopUpRiwayat> createState() => _PopUpRiwayatState();
}

class _PopUpRiwayatState extends State<PopUpRiwayat> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 60, left: 24, right: 24),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: widget.closePopUp,
            child: Container(
              alignment: Alignment.topRight,
              child: Text("x", style: TextStyle(color: Color(0xFFED6055), fontSize: 24)),
            ),
          ),
          
          Column(
            children: [
              Text("Ringkasan Pesanan", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF2F2D2C))),
              Text("Nama Resto", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w700, fontSize: 12, color: Color(0xFF2F2D2C))),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Status Pesanan", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w700, fontSize: 12, color: Color(0xFF2F2D2C))),
              Text("Dalam Proses", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.normal, fontSize: 12, color: Color(0xFF2F2D2C))),
            ],
          ),
          Container(
            height: 120,
                child: ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: 2,
                    itemBuilder: (_,index){
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("1x", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500, fontSize: 12, color: Color(0xFF2F2D2C))),
                            Container(
                              width: 250,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Produk", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500, fontSize: 12, color: Color(0xFF2F2D2C))),
                                  Text("Kategori", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.normal, fontSize: 11, color: Colors.grey))
                                ],
                              ),
                            ),
                            Text("Harga", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500, fontSize: 12, color: Color(0xFF2F2D2C))),
                          ],
                        ),
                      );
                  }
                ),
              ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Subtotal", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.normal, fontSize: 13, color: Color(0xFF2F2D2C))),
                  Text("harga", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.normal, fontSize: 12, color: Color(0xFF2F2D2C))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Pajak", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.normal, fontSize: 13, color: Color(0xFF2F2D2C))),
                  Text("harga", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.normal, fontSize: 12, color: Color(0xFF2F2D2C))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Ongkos", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.normal, fontSize: 13, color: Color(0xFF2F2D2C))),
                  Text("harga", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.normal, fontSize: 12, color: Color(0xFF2F2D2C))),
                ],
              ),
              SizedBox(height: 10,),
              Divider(color: Colors.black.withOpacity(0.3),),
            ],
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.normal, fontSize: 13, color: Color(0xFF2F2D2C))),
              Text("harga", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF2F2D2C))),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Pembayaran", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w700, fontSize: 12, color: Color(0xFF2F2D2C))),
              Text("GoPay", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.normal, fontSize: 12, color: Color(0xFF2F2D2C))),
            ],
          ),
        ],
      ),
    );
  }
}
