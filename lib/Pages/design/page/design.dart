import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/design/components/upload_container.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/Pages/payment/controller/payment_controller.dart';
import 'package:klambi_ta/component/loadinfanimation.dart';
import 'package:klambi_ta/component/my_elevatedbutton.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../controller/design_controller.dart';

class DesignPageView extends StatelessWidget {
  const DesignPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final ImageUploadController imageUploadController = Get.put(ImageUploadController());
    final PaymentController controller = Get.put(PaymentController());
    final ValueNotifier<File?> uploadedImage = ValueNotifier<File?>(null);
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;

    return Scaffold(

      backgroundColor: ColorValue.kBackground,
      appBar: AppBar(
        title: Text(
          "Custom Baju",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Obx(() {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  height: height * 1.35,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Column(
                      children: [
                        Center(
                          child: UploadContainer(
                            uploadedImage: uploadedImage,
                          ),
                        ),
                        SizedBox(height: 20),
                        My_Button(
                          onclick: () async {
                            if (uploadedImage.value != null) {
                              await imageUploadController
                                  .uploadImage(uploadedImage.value!);
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    backgroundColor:
                                        ColorValue.kSecondary.withOpacity(0.9),
                                    title: Center(
                                      child: Text(
                                        "Berhasil",
                                        style: TextStyle(
                                          color: ColorValue.kPrimary,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.check_circle,
                                          color: ColorValue.kPrimary,
                                          size: 60,
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "Pemesanan Berhasil",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      Center(
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            backgroundColor: ColorValue.kPrimary,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 10,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            Get.offAndToNamed("/navbar");
                                            controller.addHistory();

                                          },
                                          child: Text(
                                            'OK',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              Get.snackbar(
                                "Error",
                                "Harap pilih gambar terlebih dahulu",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            }
                          },
                          title: 'Upload Desain',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (imageUploadController.isLoading.isTrue)
                Loading()
            ],
          );
        }),
      ),
    );
  }
}
