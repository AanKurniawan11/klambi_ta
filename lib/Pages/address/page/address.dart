import 'package:flutter/material.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/component/my_elevatedbutton.dart';

class AddressPageView extends StatelessWidget {
  const AddressPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorValue.kBackground,
      // appBar: AppBar(
      //   // leading: IconButton(
      //   //   onPressed: () {
      //   //     Get.toNamed("/detail");
      //   //   },
      //   //   icon: Icon(Icons.arrow_back),
      //   // ),
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/address/location.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Masukkan Alamat Rumahmu',
                    style: TextStyle(
                      fontFamily: 'General Sans',
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: ColorValue.kBlack,
                    ),
                  ),
                  Text(
                    'Satu langkah lagi untuk mengirimkan barangmu ke tujuan',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'General Sans',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: ColorValue.kBlack,
                    ),
                  ),
                ],
              ),
            ),
            My_Button(
              onclick: () {
                Get.offNamed("/insert");
              },
              title: 'Lanjutkan',
            ),
          ],
        ),
      ),
    );
  }
}
