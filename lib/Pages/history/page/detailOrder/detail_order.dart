import 'package:flutter/material.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/component/space_extension.dart';

class DetailOrder extends StatelessWidget {
  const DetailOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Rincian Pesanan",style: TextStyle(fontFamily: "General Sans"),),
            Icon(Icons.receipt_long)
          ].withSpaceBetween(width: 5)
        )
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          child: Container(
            height: 500,
            width: double.infinity,
            decoration:BoxDecoration(
              border: Border.fromBorderSide(BorderSide(color: ColorValue.kLightGrey)),
              borderRadius: BorderRadius.circular(10)
            ) ,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Rincian",style: TextStyle(fontFamily: "General Sans",fontSize: 18),),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          Text("Id Pesanan",style: TextStyle(fontFamily: "General Sans",fontSize: 16),),
                        Text("2309876415",style: TextStyle(fontFamily: "General Sans",fontSize: 16),),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          Text("Waktu Pesanan",style: TextStyle(fontFamily: "General Sans",fontSize: 16),),
                        Text("2 Maret 2024",style: TextStyle(fontFamily: "General Sans",fontSize: 16),),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                    color: ColorValue.kLightGrey,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            foregroundDecoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/images/demo/demo_image.png"))
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 190,
                                  child: Text("Custom Baju Hitam Lengan Pendek",style: TextStyle(fontFamily: "General Sans"),)),
                              Text("Size S",style: TextStyle(fontFamily: "General Sans",color: ColorValue.kLightGrey),),
                              Text("Rp.199.000",style: TextStyle(fontFamily: "General Sans",fontWeight: FontWeight.w600),)                            ]
                          )
                        ].withSpaceBetween(width: 8)
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                    color: ColorValue.kLightGrey,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Subtotal",style: TextStyle(fontFamily: "General Sans",fontSize: 16),),
                        Text("Rp.199.00",style: TextStyle(fontFamily: "General Sans",fontSize: 16),),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Biaya Penangan",style: TextStyle(fontFamily: "General Sans",fontSize: 16),),
                        Text("Rp.2.000",style: TextStyle(fontFamily: "General Sans",fontSize: 16),),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Biaya Pengiriman",style: TextStyle(fontFamily: "General Sans",fontSize: 16),),
                        Text("Rp.10.000",style: TextStyle(fontFamily: "General Sans",fontSize: 16),),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Potongan Harga",style: TextStyle(fontFamily: "General Sans",fontSize: 16),),
                        Text("-Rp.5.000",style: TextStyle(fontFamily: "General Sans",fontSize: 16,color: Colors.red),),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                    color: ColorValue.kLightGrey,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total",style: TextStyle(fontFamily: "General Sans",fontSize: 18),),
                        Text("Rp.206.000",style: TextStyle(fontFamily: "General Sans",fontSize: 18,fontWeight: FontWeight.w600),),
                      ],
                    )
                  ),
                ].withSpaceBetween(height: 10)
              ),
            ),
          ),
        ),
      ),
    );
  }
}
