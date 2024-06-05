import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/detail/detail_controller.dart';
import '../color.dart';
import '../Pages/home/sizeModel.dart';

class Sizes extends StatelessWidget {
  final List<String> sizeList = ["S", "M", "L", "XL", "XXL"];
  final DetailController sizeController = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(sizeList.length, (index) {
            return Obx(() {
              bool isSelected = sizeController.selectedIndex.value == index;
              return GestureDetector(
                onTap: () {
                  sizeController.selectSize(index);
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                  decoration: BoxDecoration(
                    color: isSelected ? ColorValue.kPrimary : ColorValue.kWhite,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isSelected ? ColorValue.kPrimary : ColorValue.kLightGrey,
                    ),
                  ),
                  child: Text(
                    sizeList[index],
                    style: TextStyle(
                      fontFamily: "General Sans",
                      fontWeight: FontWeight.w500,
                      color: isSelected ? ColorValue.kBlack : ColorValue.kDarkGrey,
                    ),
                  ),
                ),
              );
            });
          }),
        ),
      ),
    );
  }
}
