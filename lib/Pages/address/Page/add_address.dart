import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/address/edit/editAddress.dart';
import 'package:klambi_ta/Pages/address/showDataController.dart';
import 'package:klambi_ta/color.dart';
import 'package:klambi_ta/Pages/address/components/address_controller.dart';
import 'package:klambi_ta/component/mytext.dart';
import 'package:klambi_ta/component/space_extension.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final AddressController controller = Get.put(AddressController());
    final Showdatacontroller Showcontroller = Get.put(Showdatacontroller());
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
              if (Showcontroller.Show.isEmpty) {
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
                return Container(
                  width: double.infinity,
                  height: height * 0.29,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorValue.kSecondary,
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: ColorValue.kLightGrey,
                    //     offset: Offset(5, 5),
                    //   ),
                    // ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
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
                                      myTexts(text: "${Showcontroller.Show[0].namaLengkap}",),
                                      myTexts(text: "${Showcontroller.Show[0].nomorTelepon}"),
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      myTexts(text: "Alamat :"),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          myTexts(text: "${Showcontroller.Show[0].provinsi}"),
                                          myTexts(text: ",${Showcontroller.Show[0].kota}"),
                                          myTexts(text: ",${Showcontroller.Show[0].kecamatan}"),
                                          myTexts(text: ",${Showcontroller.Show[0].kodePos}"),
                                        ],
                                      ),
                                      myTexts(text: "Keterangan: ${Showcontroller.Show[0].keterangan}"),
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
                                Get.to(EditAddress());
                              },
                                child: Text("Ubah",style: TextStyle(color: ColorValue.kWhite,decoration: TextDecoration.underline,decorationThickness: 1.5,decorationColor: ColorValue.kWhite,fontFamily: "General Sans"),)),
                            IconButton(
                              icon: Icon(Icons.delete, color: ColorValue.kLightGrey,size: 20,),
                              onPressed: () async {
                                Showcontroller.DeleteAddress();
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
