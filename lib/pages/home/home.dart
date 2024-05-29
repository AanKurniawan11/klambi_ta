
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klambi_ta/Pages/home/allproductresponsemodel.dart';
import 'package:klambi_ta/Pages/home/home_controller.dart';


import 'components/carousel.dart';
import 'components/category_tabs.dart';
import 'components/header.dart';
import 'components/recomend_product.dart';
import 'components/search_field.dart';
import 'package:get/get.dart';
class HomePageView extends StatelessWidget {
   HomePageView({super.key});

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 25),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(),
                SizedBox(height: 25),
                Carousel(),
                SizedBox(height: 25),
                SearchField(),
                SizedBox(height: 10),
                CategoryTabs(),
                SizedBox(height: 15),
                Obx((){
                  return ProductCard(homeController.productResponeAll,
                    homeController.productResponeAll
                  );
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}