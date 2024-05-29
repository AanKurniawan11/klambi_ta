import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/design/components/upload_container.dart';
import 'package:klambi_ta/color.dart';
import 'package:klambi_ta/component/my_elevatedbutton.dart';

class DesignPageView extends StatelessWidget {
  const DesignPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorValue.kBackground,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.offAndToNamed("/payments");
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          "Custom Baju",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Column(
              children: [
                Center(
                  child: UploadContainer(),
                ),
                SizedBox(height: 20),
                My_Button(
                  onclick: () {},
                  title: 'Lanjutkan',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
