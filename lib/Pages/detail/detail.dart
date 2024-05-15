import 'package:flutter/material.dart';
import 'package:klambi_ta/Pages/detail/detail_controller.dart';
import 'package:klambi_ta/color.dart';
import 'package:klambi_ta/component/my_elevatedbutton.dart';
import 'package:klambi_ta/component/my_textfields.dart';
import 'package:klambi_ta/component/space_extension.dart';
import 'package:klambi_ta/model/model.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:get/get.dart';

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
        minHeight: height * 0.4,
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
                width: 50,
                height: 5,
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
            Text(
              'Custom Baju Polos Warna Hitam',
              style: TextStyle(
                fontFamily: 'General Sans',
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
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
                      color: ColorValue.kLightGrey,
                    ),
                  ),
                  child: Text(
                    "20 Pembeli",
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
                      color: ColorValue.kLightGrey,
                    ),
                  ),
                  child: Text(
                    '20 Pembeli',
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
                      color: ColorValue.kLightGrey,
                    ),
                  ),
                  child: Text(
                    '20 Pembeli',
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
                        width: width * 0.22,
                        height: height *0.065,
                        child: Center(child: MyTextFields("Cm")))
                  ].withSpaceBetween(height: 5)
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lingkar Dada",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Container(
                        width: width * 0.22,
                        height: height *0.065,
                        child: Center(child: MyTextFields("Cm")))
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
                        Container(
                            width: width * 0.21,
                            height: height * 0.065 ,
                            child: My_Button(onclick: (){}, title: "S")),

                      ],
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                            width: width * 0.21,
                            height: height * 0.065 ,
                            child: My_Button(onclick: (){}, title: "M")),

                      ],
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                            width: width * 0.21,
                            height: height * 0.065 ,
                            child: My_Button(onclick: (){}, title: "L")),

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

                        Container(
                            width: width * 0.21,
                            height: height * 0.065 ,
                            child: My_Button(onclick: (){}, title: "XL")),

                      ],
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                            width: width * 0.21,
                            height: height * 0.065 ,
                            child: My_Button(onclick: (){}, title: "XXL")),

                      ],
                  ),
                ].withSpaceBetween(width: 15)
            ),
            SizedBox(height: 20,),
            Container(
                width: width * 0.35,
                height: height * 0.065 ,
                child: My_Button(onclick: (){}, title: "Konfirmasi")),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: width * 0.55,
                    height: height * 0.075 ,
                    child: My_Button(onclick: (){}, title: "Langsung Beli")),
                Container(
                    width: width * 0.25,
                    height: height * 0.075 ,
                    child:  ElevatedButton(
                        onPressed: (){},
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

