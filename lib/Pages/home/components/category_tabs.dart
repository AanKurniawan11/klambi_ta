import 'package:flutter/material.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'home_controller.dart';

class CategoryTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Obx(() {
        if (homeController.categoryResponseAll.isEmpty) {
          return Shimmer.fromColors(
            baseColor: ColorValue.kLightGrey,
            highlightColor: ColorValue.kWhite,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(5, (index) {
                  return Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                    decoration: BoxDecoration(
                      color: ColorValue.kWhite,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: ColorValue.kLightGrey,
                      ),
                    ),
                    child: Text(
                      'Loading...',
                      style: TextStyle(
                        fontFamily: "General Sans",
                        fontWeight: FontWeight.w500,
                        color: ColorValue.kLightGrey,
                      ),
                    ),
                  );
                }),
              ),
            ),
          );
        } else {
          // Jika data sudah dimuat, tampilkan konten sebenarnya
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < homeController.categoryResponseAll.length; i++)
                  GestureDetector(
                    onTap: () {
                      homeController.selectedIndex.value = i; // Update the selected index
                      homeController.loadDataProduct(homeController.categoryResponseAll[i]);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                      decoration: BoxDecoration(
                        color: homeController.selectedIndex.value == i
                            ? ColorValue.kPrimary.withOpacity(0.3)
                            : ColorValue.kWhite,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: homeController.selectedIndex.value == i
                              ? ColorValue.kPrimary
                              : ColorValue.kLightGrey,
                          width: 1, // Optional: set border width
                        ),
                      ),
                      child: Text(
                        homeController.categoryResponseAll[i],
                        style: TextStyle(
                          fontFamily: "General Sans",
                          fontWeight: FontWeight.w500,
                          color: homeController.selectedIndex.value == i
                              ? ColorValue.kBlack
                              : ColorValue.kBlack,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        }
      }),
    );
  }
}
