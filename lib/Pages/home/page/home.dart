import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/home/components/home_controller.dart';
import 'package:klambi_ta/Pages/home/components/recomend_product.dart';
import 'package:klambi_ta/component/home/carousel.dart';
import 'package:klambi_ta/component/home/category_tabs.dart';
import 'package:klambi_ta/component/home/header.dart';
import 'package:klambi_ta/component/home/search_field.dart';
import 'package:klambi_ta/shimer/product_card.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

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
            SizedBox(height: 25),
            Carousel(),
            SizedBox(height: 25),
            SearchField(),
            SizedBox(height: 10),
            CategoryTabs(),
            SizedBox(height: 15),
            Obx(() => homeController.isLoading.value
                ? ShimmerLoadingGrid()
                : ProductCard(homeController.productResponseAll.value)),
          ],
        ),
      ),
    );
  }
}
