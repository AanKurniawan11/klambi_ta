import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klambi_ta/Pages/profile/cart/cart.dart';
import 'package:klambi_ta/Pages/profile/cart/cart_controllers.dart';
import 'package:klambi_ta/color.dart';
import 'package:klambi_ta/component/my_elevatedbutton.dart';
import 'package:intl/intl.dart';
import 'package:klambi_ta/component/space_extension.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../component/size_button.dart';
import '../../component/size_field.dart';
import '../../component/sizes.dart';
import '../home/allproductresponsemodel.dart';


class DetailView extends StatelessWidget {
  final Datum item;
  final controller = Get.put(CartControllers());
  DetailView({super.key, required this.item});
  String formatPrice(int price) {
    final format = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0,);
    return format.format(price);
  }

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
        minHeight: height * 0.42,
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
                child: Image.network(
                    item.imageUrl,
                    scale: 2.55
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
              item.category.toString(),
              style: TextStyle(
                fontFamily: 'General Sans',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: ColorValue.kSecondary,
              ),
            ),
            Row(
              children: [
                Container(
                  width: width * 0.79,
                  child: Text(
                    item.title,
                    style: TextStyle(
                      fontFamily: 'General Sans',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),maxLines: 2,
                  ),
                ),
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
                        Icon(
                          CupertinoIcons.star_fill,
                          color: ColorValue.kPrimary,
                          size: 12,
                        ),
                        Text(
                          item.rate.toString(),
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
                      ].withSpaceBetween(width: 2)),
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
              formatPrice(item.price),
              style: TextStyle(
                fontFamily: 'General Sans',
                fontWeight: FontWeight.w600,
                fontSize: 32,
                color: ColorValue.kBlack,
              ),
            ),
            SizedBox(height:10),
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
              item.descripsi,
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
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        Container(
                            width: width * 0.18,
                            height: height * 0.05,
                            child: SizeField("Cm"))
                      ].withSpaceBetween(height: 5)),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Panjang Baju",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        Container(
                            width: width * 0.18,
                            height: height * 0.05,
                            child: SizeField("Cm"))
                      ].withSpaceBetween(height: 5))
                ].withSpaceBetween(width: 30)),
            SizedBox(
              height: 10,
            ),
            Container(
                width: width * 0.35,
                height: height * 0.065,
                child: SizeButton(onclick: () {}, title: "Konfirmasi")),
            SizedBox(
              height: 50,
            ),
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

            Sizes(),

            SizedBox(
              height: 20,
            ),
            Container(
                width: width * 0.35,
                height: height * 0.065,
                child: SizeButton(onclick: () {}, title: "Konfirmasi")),
            SizedBox(
              height: 40,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                  width: width * 0.58,
                  height: height * 0.075,
                  child: My_Button(
                      onclick: () {
                        Get.offNamed("/address");
                      },
                      title: "Langsung Beli")),
              Container(
                  width: width * 0.25,
                  height: height * 0.075,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(Cart());
                      // controller.addToCart(context, item);

                    },
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(ColorValue.kSecondary),
                        minimumSize: MaterialStateProperty.all(
                            Size(width * 0.85, height * 0.065)),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(12.0)))),
                    child: Icon(
                      Icons.shopping_cart_checkout_outlined,
                      color: Colors.white,
                    ),
                  ))
            ])
          ],
        ),
      ),
    );
  }
}



