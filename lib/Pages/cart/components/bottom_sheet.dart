import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import '../../../Common/colors/color.dart';
import '../../menuprofile/pages/address/Page/ReqAddress.dart';
import '../../menuprofile/pages/address/controller/address_controller.dart';
import '../controller/cart_controllers.dart';

class BottomSheetCart extends StatelessWidget {
  BottomSheetCart({super.key});
  final CartControllers controllers = Get.put(CartControllers());
  final AddressController showController = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    final double width = mediaQuery.width;

    return Obx(() {
      final totalPrice = controllers.totalPrice.value;
      final hasSelectedItems = controllers.selectedItems.isNotEmpty;

      return Container(
        padding: EdgeInsets.all(width * 0.02), // Responsive padding
        height: height * 0.15, // Responsive height
        color: Colors.white,
        child: SingleChildScrollView( // Add scrollable view
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(width * 0.03), // Responsive padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total:",
                      style: TextStyle(
                        fontSize: width * 0.05, // Responsive font size
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      NumberFormat.currency(
                        locale: 'id_ID',
                        symbol: 'Rp ',
                        decimalDigits: 0,
                      ).format(totalPrice),
                      style: TextStyle(
                        fontSize: width * 0.05, // Responsive font size
                        fontWeight: FontWeight.w600,
                        color: ColorValue.kSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (hasSelectedItems) {
                    if (showController.Show.isNotEmpty) {
                      controllers.orderfromCart();
                      Get.offNamed("/paymentcart");
                    } else {
                      Get.to(ReqAddres());
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Silakan pilih item terlebih dahulu')),
                    );
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: height * 0.02), // Responsive margin
                  width: width * 0.9, // Responsive width
                  height: height * 0.06, // Responsive height
                  decoration: BoxDecoration(
                    color: hasSelectedItems ? ColorValue.kPrimary : ColorValue.kDarkGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Beli",
                      style: TextStyle(
                        fontFamily: "General Sans",
                        color: Colors.white,
                        fontSize: width * 0.045, // Responsive font size
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
