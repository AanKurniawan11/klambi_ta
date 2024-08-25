import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/cart/components/bottom_sheet.dart';
import 'package:klambi_ta/Pages/cart/components/cart_item.dart';
import 'package:klambi_ta/Pages/cart/components/empty_cart.dart';
import 'package:klambi_ta/Pages/cart/controller/cart_controllers.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../Common/colors/color.dart';

class Cart extends StatelessWidget {
  Cart({super.key});

  final CartControllers controllers = Get.put(CartControllers());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Keranjang Saya',
          style: TextStyle(
            fontFamily: 'General Sans',
            fontWeight: FontWeight.w500,
            fontSize: 23,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_outlined),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Obx(() {
        if (controllers.isLoading.value) {
          return Center(
            child: LoadingAnimationWidget.discreteCircle(
              color: ColorValue.kPrimary,
              size: 50,
              secondRingColor: ColorValue.kSecondary,
              thirdRingColor: ColorValue.kDanger,
            ),
          );
        }
        if (controllers.Cartdata.isEmpty) {
          return Center(child: CartEmpty());
        }
        return CartItem();
      }),
      bottomSheet: Obx(() {
        if (controllers.Cartdata.isEmpty) {
          return SizedBox.shrink(); // Menyembunyikan BottomSheet jika data kosong
        }
        return BottomSheetCart(); // Menampilkan BottomSheet jika ada data
      }),
    );
  }
}
