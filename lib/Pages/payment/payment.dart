import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/payment/components/DeliverOpsi.dart';
import 'package:klambi_ta/component/my_elevatedbutton.dart';
import 'package:klambi_ta/component/space_extension.dart';
import '../../color.dart';
import 'components/listdown.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pembayaran',
          style: TextStyle(
            fontFamily: 'General Sans',
            fontWeight: FontWeight.w500,
            fontSize: 24,
            color: ColorValue.kBlack,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.offAndToNamed("/design");
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: width * 0.85,
                  height: height * 0.26,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorValue.kPrimary,
                    boxShadow: [
                      BoxShadow(
                        color: ColorValue.kLightGrey,
                        blurStyle: BlurStyle.outer,
                        offset: Offset(3, 4.5),
                        spreadRadius: 1.8,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Dikirim ke : ",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                        Row(
                          children: [
                            Icon(Icons.add_location_sharp,
                                size: 55, color: ColorValue.kWhite),
                            Container(
                              width: width * 0.45,
                              child: Text(
                                "Kost Pororo, Besito, Gebog, Kudus, Jawa Tengah, 33089",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                                maxLines: 3,
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text("Ganti",
                                style: TextStyle(color: ColorValue.kBlack)),
                          ),
                        ),
                      ].withSpaceBetween(height: 5),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: width * 0.88,
              height: height * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorValue.kWhite,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(CupertinoIcons.cart_fill,
                                color: ColorValue.kDarkGrey, size: 25),
                            Text(
                              "Rincian Pesanan ",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: ColorValue.kDarkGrey),
                            ),
                          ].withSpaceBetween(width: 10),
                        ),
                        Text(
                          "Rp.199.000",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: ColorValue.kBlack,
                              fontFamily: "General Sans"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: width * 0.78,
                    height: height * 0.18,
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorValue.kLightGrey),
                      borderRadius: BorderRadius.circular(8),
                      color: ColorValue.kWhite,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: width * 0.18,
                          height: height * 0.12,
                          foregroundDecoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/demo_image.png")),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Lengan Pendek",
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.w500)),
                            Container(
                              width: width * 0.5,
                              child: Text(
                                "Custom Baju Hitam Lengan Pendek",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "General Sans"),
                                maxLines: 2,
                              ),
                            ),
                            Text("Rp 199.000",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "General Sans")),
                          ].withSpaceBetween(height: 10),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 35),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 1, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Subtotal",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "General Sans")),
                            Text("Rp 199.000",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "General Sans")),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Subtotal",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "General Sans")),
                            Text("Rp 199.000",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "General Sans")),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Subtotal",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "General Sans")),
                            Text("Rp 199.000",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "General Sans")),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Subtotal",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "General Sans")),
                            Text("Rp 199.000",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "General Sans")),
                          ],
                        ),
                      ),
                    ].withSpaceBetween(height: 15),
                  ),
                  SizedBox(height: 35),
                  const Divider(
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    color: ColorValue.kLightGrey,
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: "General Sans")),
                        Text("Rp 199.000",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: "General Sans")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: width * 0.88,
              child: PayList(),
            ),
            SizedBox(height: 20),
            Container(
              width: width * 0.88,
              child: DeliverOpsi(),
            ),
            SizedBox(height: 40),
            Container(
              width: width * 0.9,
              child: My_Button(
                onclick: () {
                  Get.offAndToNamed("/design");
                },
                title: 'Konfirmasi dan Bayar',
              ),
            ),
            SizedBox(height: 10),

          ],
        ),
      ),
    );
  }
}
