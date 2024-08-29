import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/Pages/home/components/header.dart';
import 'package:klambi_ta/Pages/home/components/home_controller.dart';
import 'package:klambi_ta/Pages/home/components/carousel.dart';
import 'package:klambi_ta/Pages/home/components/category_tabs.dart';
import 'package:klambi_ta/Pages/home/components/search_field.dart';
import 'package:klambi_ta/shimer/product_card.dart';

import '../components/recomend_product.dart';

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
            Header(),
            SizedBox(height: 20),
            Carousel(),
            SizedBox(height: 20),
            SearchField(
              onChanged: (String value) {
                homeController.searchProducts(value);
              },
            ),
            SizedBox(height: 15),
            CategoryTabs(),
            SizedBox(height: 20),
            Obx(() {
              if (homeController.isLoading.value) {
                return ShimmerLoadingGrid();
              }
              if (homeController.searchResult.isNotEmpty) {
                return ProductCard(itemList: homeController.searchResult);
              }
              if (homeController.searchText.isNotEmpty && homeController.searchResult.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Center(
                    child: Text(
                      "Produk tidak ditemukan",
                      style: TextStyle(fontSize: 16, color: ColorValue.kLightGrey, fontFamily: "General Sans"),
                    ),
                  ),
                );
              }
              return ProductCard(itemList: homeController.productResponseAll.value);
            }),
          ],
        ),
      ),
    );
  }
}
