import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/Pages/home/components/carousel.dart';
import 'package:klambi_ta/Pages/home/components/header.dart';
import 'package:klambi_ta/Pages/home/components/home_controller.dart';
import 'package:klambi_ta/Pages/home/components/category_tabs.dart';
import 'package:klambi_ta/Pages/home/components/search_field.dart';
import 'package:klambi_ta/shimer/product_card.dart';
import '../components/recomend_product.dart';

class HomePageView extends StatelessWidget {
  HomePageView({super.key});

  final HomeController homeController = Get.put(HomeController());
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return RefreshIndicator(
            onRefresh: homeController.refreshProducts,
            color: ColorValue.kSecondary,
            backgroundColor: Colors.white,
            strokeWidth: 3.0,
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 25),
              children: [
                Header(),
                SizedBox(height: 20),
                Carousel(),
                SizedBox(height: 20),
                SearchField(
                  controller: searchController, // Menggunakan controller yang dikelola di sini
                  onChanged: (String value) {
                    homeController.searchProducts(value);
                  },
                ),
                SizedBox(height: 15),
                CategoryTabs(),
                SizedBox(height: 20),
                if (homeController.isLoading.value)
                  ShimmerLoadingGrid()
                else if (homeController.searchText.isNotEmpty && homeController.searchResult.isEmpty)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Text(
                        "Produk tidak ditemukan",
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorValue.kLightGrey,
                          fontFamily: "General Sans",
                        ),
                      ),
                    ),
                  )
                else
                  ProductCard(itemList: homeController.searchResult.isEmpty
                      ? homeController.productResponseAll.value
                      : homeController.searchResult),
              ],
            ),
          );
        }),
      ),
    );
  }
}
