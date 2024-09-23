import 'package:flutter/material.dart';
import 'package:klambi_ta/component/space_extension.dart';
import 'package:shimmer/shimmer.dart';

import 'package:klambi_ta/Common/colors/color.dart';

Widget ShimmerLoadingProduct(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return  Shimmer.fromColors(
    baseColor: ColorValue.kLightGrey,
    highlightColor: ColorValue.kWhite!,
    child: Container(
      height: size.height * 0.9,
      width: size.width * 0.5,
      decoration: BoxDecoration(
        border: Border.all(color: ColorValue.kLightGrey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: size.width * 0.5,
                  height: size.height * 0.18,
                  decoration: BoxDecoration(
                      color: ColorValue.kLightGrey,
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            Container(
              width: size.width * 0.2,
              height: size.height * 0.013,
              decoration: BoxDecoration(
                  color: ColorValue.kLightGrey,
                  borderRadius: BorderRadius.circular(5)
              ),
            ),
            SizedBox(height: size.height * 0.005),
            Container(
              width: size.width * 0.15,
              height: size.height * 0.013,
              decoration: BoxDecoration(
                  color: ColorValue.kLightGrey,
                  borderRadius: BorderRadius.circular(5)
              ),
            ),
            SizedBox(height: size.height * 0.005),
            Row(
              children: [
                Container(
                  width: size.width * 0.12,
                  height: size.height * 0.013,
                  decoration: BoxDecoration(
                      color: ColorValue.kLightGrey,
                      borderRadius: BorderRadius.circular(5)
                  ),
                ),
                Container(
                  width: size.width * 0.12,
                  height: size.height * 0.013,
                  decoration: BoxDecoration(
                      color: ColorValue.kLightGrey,
                      borderRadius: BorderRadius.circular(5)
                  ),
                ),
                Container(
                  width: size.width * 0.12,
                  height: size.height * 0.013,
                  decoration: BoxDecoration(
                      color: ColorValue.kLightGrey,
                      borderRadius: BorderRadius.circular(5)
                  ),
                ),

              ].withSpaceBetween(width: 5),
            ),
          ].withSpaceBetween(height: 5),
        ),
      ),
    ),
  );


}
Widget ShimmerLoadingGrid() {
  return
   GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1 / 1.55,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemCount: 6, // Adjust based on how many shimmer items you want to show
      itemBuilder: (context, index) {
        return ShimmerLoadingProduct(context);
      },
    );
}


