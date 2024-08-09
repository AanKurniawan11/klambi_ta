import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/address/controller/address_controller.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/address/edit/editAddress.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/address/edit/editAddressModel.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/address/controller/address_controller.dart';
import 'package:klambi_ta/component/mytext.dart';
import 'package:klambi_ta/component/space_extension.dart';

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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 45),
        child: Column(
          children: [
            Obx(() {
              if (controller.Show.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/checkout/add1.png',
                        width: width * 0.8,
                        height: height * 0.4,
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
                      'Satu langkah lagi untuk mengirimkan barangmu',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'General Sans',
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: ColorValue.kBlack,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ke tujuan',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'General Sans',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: ColorValue.kBlack,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            Get.toNamed("/insert");
                          },
                          child: const Text(
                            " Masukkan Alamat",
                            style: TextStyle(
                              color: ColorValue.kSecondary,
                              fontSize: 14,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                );
              }
              else {
                CircularProgressIndicator(color: Colors.black,);
                return Container(
                  width: double.infinity,
                  height: height * 0.29,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorValue.kSecondary,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            children: [
                              Align(
                                child: Icon(Icons.add_location_sharp,
                                    size: 60, color: ColorValue.kWhite),
                              ),
                              Column(
                                crossAxisAlignment:CrossAxisAlignment.start ,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      myTexts(text: "Kontak :"),
                                      myTexts(text: "${controller.Show[0].namaLengkap}",),
                                      myTexts(text: "${controller.Show[0].nomorTelepon}"),
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      myTexts(text: "Alamat :"),
                                      Container(
                                          width: width * 0.68,
                                          child: Text("${controller.Show[0].provinsi}" + " ${controller.Show[0].keterangan}",maxLines: 3,style: TextStyle(color: ColorValue.kWhite,fontFamily: "General Sans"),)),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Get.to(EditAddressView());
                              },
                                child: Text("Ubah",style: TextStyle(color: ColorValue.kWhite,decoration: TextDecoration.underline,decorationThickness: 1.5,decorationColor: ColorValue.kWhite,fontFamily: "General Sans"),)),
                            IconButton(
                              icon: Icon(Icons.delete, color: ColorValue.kLightGrey,size: 20,),
                              onPressed: () async {
                                controller.DeleteAddress();
                              },
                            ),
                          ].withSpaceBetween(width: 200)
                        )
                      ],
                    ),
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
