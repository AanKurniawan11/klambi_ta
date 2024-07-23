import 'package:flutter/material.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/cart/page/cart.dart';
import 'package:klambi_ta/Pages/profile/components/profile_controller.dart';

class Header extends StatelessWidget {
  const Header({super.key});
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Selamat Pagi ';
    }
    if (hour < 15) {
      return 'Selamat Siang ';
    } if (hour < 18) {
      return 'Selamat Sore ';
    }
    return 'Selamat Malam ';
  }


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Row(
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                greeting() + controller.username.value,
                style: TextStyle(
                  fontFamily: 'General Sans',
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
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
                  Get.to(Cart());
                },
                child: Icon(Icons.shopping_cart_outlined,size: 30,)),
          )
        ],
      ),
    );
  }
}
