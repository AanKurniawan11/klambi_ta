import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/address/edit/editAddress.dart';
import 'package:klambi_ta/component/mytext.dart';
import 'package:klambi_ta/component/space_extension.dart';
import '../../../../../common/colors/color.dart';
import '../controller/address_controller.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final AddressController controller = Get.put(AddressController());
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;

    return Scaffold(
      backgroundColor: ColorValue.kBackground,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.toNamed("/navbar");
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Alamat", style: TextStyle(fontSize: 24, fontFamily: "General Sans")),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Obx(() {
              if (controller.Show.isEmpty) {
                return Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/checkout/add1.png',
                        width: width * 0.7,
                        height: height * 0.3,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Masukkan Alamat Rumahmu',
                        style: TextStyle(
                          fontFamily: 'General Sans',
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: ColorValue.kBlack,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Satu langkah lagi untuk mengirimkan barangmu',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'General Sans',
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: ColorValue.kBlack,
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () async {
                          Get.toNamed("/insert");
                        },
                        child: Text(
                          "Masukkan Alamat",
                          style: TextStyle(
                            color: ColorValue.kSecondary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: controller.Show.length,
                    itemBuilder: (context, index) {
                      final data = controller.Show[index];
                      return Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: ColorValue.kSecondary,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.add_location_sharp, size: 50, color: ColorValue.kWhite),
                                  SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        myTexts(text: "Kontak :"),
                                        myTexts(text: "${data.namaLengkap}"),
                                        myTexts(text: "${data.nomorTelepon}"),
                                        SizedBox(height: 16),
                                        myTexts(text: "Alamat :"),
                                        Text(
                                          "${data.provinsi} ${data.keterangan}",
                                          style: TextStyle(color: ColorValue.kWhite, fontFamily: "General Sans"),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(EditAddressView(addressId: data.id));
                                    },
                                    child: Text(
                                      "Ubah",
                                      style: TextStyle(
                                        color: ColorValue.kWhite,
                                        decoration: TextDecoration.underline,
                                        fontFamily: "General Sans",
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete, color: ColorValue.kLightGrey, size: 20),
                                    onPressed: () async {
                                      controller.DeleteAddress();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
