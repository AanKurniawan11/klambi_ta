import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/Pages/payment/controller/payment_controller.dart';

class SizesPay extends StatelessWidget {
  final List<String> sizeList = ["S", "M", "L", "XL", "XXL"];
  final Function(String) onChanged;
  final PaymentController sizeController = Get.find(); // Use Get.find() to get the existing instance

  SizesPay({required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(sizeList.length, (index) {
                return Obx(() {
                  bool isSelected = sizeController.selectedIndex.value == index;
                  return GestureDetector(
                    onTap: () {
                      sizeController.selectSize(index);
                      onChanged(sizeList[index]); // Call onChanged with the selected size
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
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
