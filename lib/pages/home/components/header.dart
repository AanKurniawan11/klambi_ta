import 'package:flutter/material.dart';
import 'package:klambi_ta/color.dart';
import 'package:get/get.dart';
import '../../../component/custom_icon.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Row(
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Selamat Pagi Filo,',
                style: TextStyle(
                  fontFamily: 'General Sans',
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
              Text(
                'Cari Apa Hari Ini?',
                style: TextStyle(
                  fontFamily: 'General Sans',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: ColorValue.kPrimary,
                ),
              ),
            ],
          ),
          Spacer(),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 30),
           child: GestureDetector(
             onTap: (){
               Get.offNamed("/cart");
             },
               child: Icon(Icons.shopping_cart_outlined,size: 30,)),
         )
        ],
      ),
    );
  }
}
