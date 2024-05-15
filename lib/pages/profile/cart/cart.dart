import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/color.dart';
import 'package:klambi_ta/component/cart_product.dart';
import 'package:klambi_ta/component/my_elevatedbutton.dart';
import 'package:klambi_ta/component/space_extension.dart';
import 'package:klambi_ta/model/model.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.offAndToNamed("/navbar", arguments: 3);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          "Keranjangku",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ProductCards(demoProducts),
              ProductCards(demoProducts),
              SizedBox(
                height: 150,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Stack(
        children: [
          Container(
            height: height * 0.22,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                  children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Total :",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Rp 190.000",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: ColorValue.kSecondary),
                      ),
                    ].withSpaceBetween(width: 40)),
                My_Button(
                  onclick: () {},
                  title: "Bayar",
                )
              ].withSpaceBetween(height: 20)),
            ),
          )
        ],
      ),
    );
  }
}
