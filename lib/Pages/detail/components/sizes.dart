import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/detail/controller/detail_controller.dart';
import '../../../Common/colors/color.dart';

class Sizes extends StatelessWidget {
  final List<String> sizeList = ["S", "M", "L", "XL", "XXL"];
  final Function(String) onChanged;
  final DetailController sizeController = Get.find(); // Use Get.find() to get the existing instance

  Sizes({required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;

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
                          color: isSelected ? ColorValue.kWhite : ColorValue.kDarkGrey,
                        ),
                      ),
                    ),
                  );
                });
              }),
            ),
          ),
          SizedBox(height: 20), // Add spacing between the size buttons and the confirm button
          // Obx(() {
          //   bool isSizeSelected = sizeController.selectedIndex.value != -1;
          //   return ElevatedButton(
          //     onPressed: isSizeSelected ? () {
          //       // Add functionality for confirm button here
          //       print("Size selected: ${sizeList[sizeController.selectedIndex.value]}");
          //     } : null, // Disable the button if no size is selected
          //     style: ButtonStyle(
          //       backgroundColor: MaterialStateProperty.all(
          //         isSizeSelected
          //             ? ColorValue.kPrimary
          //             : ColorValue.kLightGrey,
          //         // Change color based on selection
          //       ),
          //       minimumSize: MaterialStateProperty.all(Size(width * 0.5, height * 0.07)),
          //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //         RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(12.0),
          //           side: BorderSide(color: ColorValue.kLightGrey),
          //         ),
          //       ),
          //     ),
          //     child: Text(
          //       "Konfirmasi",
          //       style: TextStyle(
          //         color: isSizeSelected ? Colors.black : Colors.red, // Change text color based on selection
          //         fontWeight: FontWeight.w600,
          //         fontSize: 12,
          //       ),
          //     ),
          //   );
          // }),
        ],
      ),
    );
  }
}
