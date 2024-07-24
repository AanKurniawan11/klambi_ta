import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/home/components/carousel.dart';
import 'package:klambi_ta/Pages/home/components/category_tabs.dart';
import 'package:klambi_ta/Pages/home/components/header.dart';
import 'package:klambi_ta/Pages/home/components/recomend_product.dart';
import 'package:klambi_ta/Pages/home/components/search_field.dart';
import 'package:klambi_ta/Pages/home/home_controller.dart';
import 'package:klambi_ta/shimer/product_card.dart';
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
                Obx(() => homeController.isLoading.value
                    ? ShimmerLoadingGrid()
                    : ProductCard(homeController.productResponseAll.value))
              ],
            )
          ],
        ),
      ),
    );
  }
}