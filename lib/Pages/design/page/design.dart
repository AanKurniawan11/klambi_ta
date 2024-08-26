import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/design/components/upload_container.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/component/my_elevatedbutton.dart';

import '../../cart/controller/cart_controllers.dart';
import '../../payment/controller/payment_controller.dart';
import '../controller/design_controller.dart';

class DesignPageView extends StatelessWidget {
  const DesignPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final PaymentController paymentController = Get.put(PaymentController());
    final CartControllers cartController = Get.put(CartControllers());
    final ImageUploadController imageUploadController = Get.put(ImageUploadController());

    return Scaffold(
      backgroundColor: ColorValue.kBackground,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.offAllNamed("/navbar");
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
                  onclick: () {
                    if (imageUploadController.isLoading.isFalse) {
                      // Cek apakah ada gambar yang sudah diupload
                      if (imageUploadController.uploadImage != null) {
                        // Panggil fungsi uploadImage ketika tombol diklik
                        imageUploadController.uploadImage(imageUploadController.uploadImage! as File);
                      } else {
                        Get.snackbar("Error", "Harap pilih gambar terlebih dahulu",
                            snackPosition: SnackPosition.BOTTOM);
                      }
                    }
                  },
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
