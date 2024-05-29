import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klambi_ta/Pages/detail/detail_controller.dart';
import 'package:klambi_ta/color.dart';
import 'package:klambi_ta/component/my_elevatedbutton.dart';
import 'package:klambi_ta/component/my_textfields.dart';
import 'package:klambi_ta/component/size_field.dart';
import 'package:klambi_ta/component/space_extension.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:get/get.dart';

import '../../component/size_button.dart';

class DetailView extends GetView<DetailController> {
  DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;


    return Scaffold(
      backgroundColor: ColorValue.kBackground,
      appBar: AppBar(
        title: Text(
          'Detail Produk',
          style: TextStyle(
            fontFamily: 'General Sans',
            fontWeight: FontWeight.w500,
            fontSize: 23,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove appbar shadow
      ),
      body: SlidingUpPanel(
        minHeight: height * 0.45,
        // maxHeight: height * 1,
        panelSnapping: true,
        // backdropEnabled: true,
        backdropOpacity: 0.5,
        backdropTapClosesPanel: true,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10.0,
          ),
        ],
        panel: _buildPanel(context),
        body: ListView(
          children: [
            Container(
                child: Image.asset(
              "assets/images/demo_image.png",
              scale: 0.5,
            )),
            // Add other content of your detail view here
          ],
        ),
      ),
    );
  }

  Widget _buildPanel(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: width * 0.15,
                height: height * 0.007,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(height: 25),
            Text(
              'Lengan Pendek',
              style: TextStyle(
                fontFamily: 'General Sans',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: ColorValue.kSecondary,
              ),
            ),
            Row(
              children: [
                Text(
                  'Custom Baju Polos Warna Hitam',
                  style: TextStyle(
                    fontFamily: 'General Sans',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 12),

                Obx(
                      ()=> GestureDetector(
                        onTap: (){
                          controller.toggleBookmark();
                          Get.snackbar(
                            "Berhasil",
                            icon: Icon(CupertinoIcons.checkmark_alt_circle),
                            controller.isBookmarkClicked.value ? "Dihapus dari whislist anda" : "Ditambahkan ke whislist anda",
                            colorText: Colors.white,
                            backgroundColor: ColorValue.kPrimary,
                          );
                        },
                      child: Icon(
                        Icons.bookmark,
                        size: 40,
                        color: controller.isBookmarkClicked.value ?   ColorValue.kLightGrey: ColorValue.kPrimary)),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: ColorValue.kWhite,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: ColorValue.kBlack,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.star_fill,color: ColorValue.kPrimary,size: 12,),
                      Text(
                        "4.6",
                        style: TextStyle(
                          fontFamily: "General Sans",
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: ColorValue.kDarkGrey,
                        ),
                      ),
                      Text(
                        "(15)",
                        style: TextStyle(
                          fontFamily: "General Sans",
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: ColorValue.kDarkGrey,
                        ),
                      ),
                    ].withSpaceBetween(width: 2)
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: ColorValue.kWhite,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: ColorValue.kBlack,
                    ),
                  ),
                  child: Text(
                    '20 Pembelian',
                    style: TextStyle(
                      fontFamily: "General Sans",
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: ColorValue.kDarkGrey,
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: ColorValue.kWhite,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: ColorValue.kBlack,
                    ),
                  ),
                  child: Text(
                    '8 Stok',
                    style: TextStyle(
                      fontFamily: "General Sans",
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: ColorValue.kDarkGrey,
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 10),
            Text(
              'Rp. 99.000',
              style: TextStyle(
                fontFamily: 'General Sans',
                fontWeight: FontWeight.w600,
                fontSize: 32,
                color: ColorValue.kBlack,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Deskripsi Produk',
              style: TextStyle(
                fontFamily: 'General Sans',
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: ColorValue.kBlack,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ',
              style: TextStyle(
                fontFamily: 'General Sans',
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: ColorValue.kBlack,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Ukuran Baju",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            Text(
              "Manual",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ColorValue.kDarkGrey),
            ),
            Divider(
              thickness: 1,
              indent: 3,
              endIndent: 3,
              color: ColorValue.kLightGrey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lingkar Dada",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Container(
                        width: width * 0.18,
                        height: height *0.05,
                        child: SizeField("Cm"))
                  ].withSpaceBetween(height: 5)
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Panjang Baju",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Container(
                        width: width * 0.18,
                        height: height *0.05,
                        child: SizeField("Cm"))
                  ].withSpaceBetween(height: 5)
                )
              ].withSpaceBetween(width: 30)
            ),
            SizedBox(height:10 ,),
            Container(
                width: width * 0.35,
                height: height * 0.065 ,
                child: My_Button(onclick: (){}, title: "Konfirmasi")),
            SizedBox(height:50 ,),
            Text(
              "Atau Pilih Ukuran",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ColorValue.kDarkGrey),
            ),
            Divider(
              thickness: 1,
              indent: 3,
              endIndent: 3,
              color: ColorValue.kLightGrey,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizeButton(onclick: (){}, title: "S"),

                      ],
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizeButton(onclick: (){}, title: "M"),

                      ],
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizeButton(onclick: (){}, title: "L"),

                      ],
                  ),
                ].withSpaceBetween(width: 15)
            ),
            SizedBox(height: 10,),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizeButton(onclick: (){}, title: "XL"),

                      ],
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizeButton(onclick: (){}, title: "XXL"),

                      ],
                  ),
                ].withSpaceBetween(width: 15)
            ),
            SizedBox(height: 20,),
            Container(
                width: width * 0.35,
                height: height * 0.065 ,
                child: SizeButton(onclick: (){}, title: "Konfirmasi")),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: width * 0.58,
                    height: height * 0.075 ,
                    child: My_Button(onclick: (){}, title: "Langsung Beli")),
                Container(
                    width: width * 0.25,
                    height: height * 0.075 ,
                    child:  ElevatedButton(
                        onPressed: (){
                          Get.snackbar(
                            "Berhasil",
                            "Barang berhasil ditambahkan",
                            icon: Icon(CupertinoIcons.checkmark_alt_circle_fill,color: ColorValue.kSecondary,),
                            backgroundColor: ColorValue.kPrimary,
                            colorText: ColorValue.kSecondary,
                          );

                          // Perform any other actions you need to do here
                          // For example, navigate to the cart screen
                          // Get.offAllNamed("/cart");
                          },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(ColorValue.kSecondary),
                            minimumSize:
                            MaterialStateProperty.all(Size(width * 0.85, height * 0.065)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0)))), child: Icon(Icons.shopping_cart_checkout_outlined,color: Colors.white,),

                    ))]
            )
          ],
        ),
      ),
    );
  }
}

