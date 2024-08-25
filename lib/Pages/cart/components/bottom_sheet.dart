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
   final AddressController Showcontroller = Get.put(AddressController());


   @override
  Widget build(BuildContext context) {
    final Size mediaquery = MediaQuery.of(context).size;
    final double height = mediaquery.height;
    final double width = mediaquery.width;
    return Obx(() {
      final totalPrice = controllers.totalPrice.value;
      final hasSelectedItems = controllers.selectedItems.isNotEmpty;

      return Container(
        padding: EdgeInsets.all(5),
        height: height * 0.13,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  Text(
                    NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(totalPrice),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ColorValue.kSecondary),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                if (hasSelectedItems) {
                  if (Showcontroller.Show.isNotEmpty) {
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
                margin: EdgeInsets.only(bottom: 4),
                width: width * 0.9,
                height: height * 0.055,
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
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
    );
  }

}



