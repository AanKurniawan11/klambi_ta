import 'package:flutter/material.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/component/space_extension.dart';

class CartEmpty extends StatelessWidget {
  CartEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorValue.kBackground,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/cartEmpty.png",
                height: height * 0.25,
                width: width * 0.5,
                fit: BoxFit.cover,
              ),
              SizedBox(height: height * 0.03),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Keranjang Anda Kosong",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorValue.kDarkGrey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/navbar");
                    },
                    child: Text(
                      "Belanja Sekarang",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ColorValue.kPrimary,
                        decoration: TextDecoration.underline,
                        decorationColor: ColorValue.kPrimary,
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                ].withSpaceBetween(width: 5),
              )
            ],
          ),
        ),
      ),
    );
  }
}
