import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/component/space_extension.dart';

import '../../../Common/colors/color.dart';

class InsaertOption extends StatelessWidget {
  const InsaertOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.fromBorderSide(
                        BorderSide(color: ColorValue.kDarkGrey)),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("masukkan Alamat anda"),
                      Icon(Icons.arrow_forward_ios_outlined)
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.fromBorderSide(
                        BorderSide(color: ColorValue.kDarkGrey)),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Gunakan Alamat anda saat ini"),
                      Icon(Icons.location_on)
                    ],
                  ),
                ),
              ),
            ),
          ].withSpaceBetween(height: 10)
        ),
      ),
    );
  }
}
