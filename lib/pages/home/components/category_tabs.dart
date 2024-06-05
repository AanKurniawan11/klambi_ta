import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/home/sizeModel.dart';
import 'package:klambi_ta/color.dart';
import '../home_controller.dart';

class CategoryTabs extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Obx(() {
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
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                        decoration: BoxDecoration(
                          color: homeController.selectedIndex.value == i
                              ? ColorValue.kPrimary.withOpacity(0.2)
                              : ColorValue.kWhite,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: homeController.selectedIndex.value == i
                                ? ColorValue.kPrimary
                                : ColorValue.kLightGrey,
                          ),
                        ),
                        child: Text(
                          homeController.categoryResponseAll[i],
                          style: TextStyle(
                            fontFamily: "General Sans",
                            fontWeight: FontWeight.w500,
                            color: homeController.selectedIndex.value == i
                                ? ColorValue.kBlack
                                : ColorValue.kDarkGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }
}
