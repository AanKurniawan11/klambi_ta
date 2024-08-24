import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/cs/components/text_details.dart';

class CustomerService extends StatelessWidget {
  const CustomerService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Pusat Bantuan',
          style: TextStyle(
            fontFamily: 'General Sans',
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: ColorValue.kBlack,
          ),
        ),
        backgroundColor: ColorValue.kSecondary,
        leading: GestureDetector(
          onTap: () {
            Get.offAndToNamed("/navbar");
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: TextDetails(),
      ),
    );
  }}