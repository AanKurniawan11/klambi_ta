import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/Pages/profile/components/profile_controller.dart';
import 'package:klambi_ta/Pages/profile/cart/page/cart.dart';

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
    final controller = Get.put(ProfileController());

    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(() {
                if (controller.isLoading.value) {
                  return CircularProgressIndicator();
                } else {
                  if (controller.user.value != null) {
                    // User is logged in via Google
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          greeting() + (controller.user.value?.displayName ?? ''),
                          style: TextStyle(
                            fontFamily: 'General Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          'Cari Apa Hari Ini?',
                          style: TextStyle(
                            fontFamily: 'General Sans',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: ColorValue.kPrimary,
                          ),
                        ),
                      ],
                    );
                  } else {
                    // Manual login
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          greeting() + controller.username.value,
                          style: TextStyle(
                            fontFamily: 'General Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                          ),
                        ),
                        Text(
                          'Cari Apa Hari Ini?',
                          style: TextStyle(
                            fontFamily: 'General Sans',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: ColorValue.kPrimary,
                          ),
                        ),
                      ],
                    );
                  }
                }
              }),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: GestureDetector(
              onTap: () {
                Get.to(Cart());
              },
              child: const Icon(
                Icons.shopping_cart_outlined,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}