import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/Pages/cart/page/cart.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/edit/controller/edit_controller.dart';
import 'package:klambi_ta/component/space_extension.dart';
import 'package:shimmer/shimmer.dart';

import '../../cart/controller/cart_controllers.dart';

class Header extends StatelessWidget {
  Header({super.key});

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Selamat Pagi ';
    }
    if (hour < 15) {
      return 'Selamat Siang ';
    }
    if (hour < 18) {
      return 'Selamat Sore ';
    }
    return 'Selamat Malam ';
  }

  @override
  Widget build(BuildContext context) {
    final editController = Get.put(EditController());
    final cartController = Get.put(CartControllers());
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    cartController.fetchOrderCart();

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(() {
              if (editController.isLoading.value) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: height * 0.035,
                        width: width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300],
                        ),
                      ),
                      Container(
                        height: height * 0.03,
                        width: width * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300],
                        ),
                      ),
                    ].withSpaceBetween(height: 5),
                  ),
                );
              } else {
                final username = editController.ctrName.text.isNotEmpty
                    ? editController.ctrName.text
                    : editController.userProfile.value.name ?? '';

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width * 0.5,
                        height: height * 0.03,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            '${greeting()}$username',
                            style: TextStyle(
                              fontFamily: 'General Sans',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: ColorValue.kSecondary,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Cari Apa Hari Ini?',
                        style: TextStyle(
                          fontFamily: 'General Sans',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: ColorValue.kSecondary,
                        ),
                      ),
                    ],
                  ),
                );
              }
            }),
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: GestureDetector(
            onTap: () {
              Get.to(() => Cart());
            },
            child: Stack(
              children: [
                const Icon(
                  Icons.shopping_cart_outlined,
                  size: 30,
                  color: ColorValue.kBlack,
                ),
                Obx(() {
                  int totalItems = cartController.Cartdata.fold(0, (sum, item) => sum + item.quantity);
                  return Positioned(
                    top: 0,
                    right: 0,
                    child: totalItems > 0
                        ? Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: ColorValue.kDanger,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '$totalItems',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    )
                        : SizedBox.shrink(),
                  );
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
