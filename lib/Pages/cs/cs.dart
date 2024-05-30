import 'package:flutter/material.dart';
import 'package:klambi_ta/color.dart';
import 'package:get/get.dart';

import 'components/text_details.dart';

class CustomerService extends StatelessWidget {
  const CustomerService({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Pusat Bantuan',
          style: TextStyle(
            fontFamily: 'General Sans',
            fontWeight: FontWeight.w500,
            fontSize: 24,
            color: ColorValue.kBlack,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.offAndToNamed("/navbar");
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: TextDetails(),
      ),
    );
  }
}