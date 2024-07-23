import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/component/design/upload_container.dart';
import 'package:klambi_ta/Common/colors/color.dart';
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
                  onclick: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor: ColorValue.kSecondary.withOpacity(0.9),
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
                          content: Text(
                            "Pemesanan Berhasil",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),icon: Icon(Icons.check_circle,color: ColorValue.kPrimary,),
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
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Get.offAndToNamed("/navbar");
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
