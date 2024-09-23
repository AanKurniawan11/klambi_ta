import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/cart/controller/cart_controllers.dart';
import 'package:klambi_ta/Pages/detail/components/sizes.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../Common/colors/color.dart';
import '../../../component/format_price.dart';
import '../../home/components/home_controller.dart';
import '../../menuprofile/pages/address/controller/address_controller.dart';
import '../../payment/controller/payment_controller.dart';

class CartModal extends StatelessWidget {
  final item;
  final PaymentController paymentController = Get.find<PaymentController>();
  final CartControllers controllers = Get.find<CartControllers>();
  final AddressController addressController = Get.find<AddressController>();
  final HomeController homeController = Get.find<HomeController>();

  CartModal({required this.item});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;

    return Container(
      width: mediaQuery.width * 0.9, // Adjust width for smaller devices
      child: ElevatedButton(
        onPressed: item.stock > 0 ? () => _showBottomSheet(context, mediaQuery) : null,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            item.stock > 0 ? ColorValue.kSecondary : Colors.grey,
          ),
          minimumSize: MaterialStateProperty.all(Size(mediaQuery.width * 0.85, mediaQuery.height * 0.065)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        child: Icon(
          Icons.shopping_cart_checkout_outlined,
          color: Colors.white,
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, Size mediaQuery) {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: Container(
          height: mediaQuery.height * 0.46, // Increased height for better usability
          color: ColorValue.kWhite,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.05, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _closeButton(),
                _productInfo(mediaQuery),
                const SizedBox(height: 20),
                _sizePicker(),
                const SizedBox(height: 10),
                _quantitySelector(mediaQuery),
                const SizedBox(height: 20),
                _buyButton(mediaQuery),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _closeButton() {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Align(alignment: Alignment.topRight, child: Icon(Icons.close)),
    );
  }

  Widget _productInfo(Size mediaQuery) {
    return Row(
      children: [
        Image.network(homeController.imageUrl(item.imagee), height: 100, width: 100),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.title, style: TextStyle(fontFamily: "General Sans"), maxLines: 2),
              Text(formatPrice(item.price), style: TextStyle(fontFamily: "General Sans", fontSize: 16, color: ColorValue.kSecondary)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _sizePicker() {
    return Sizes(onChanged: (value) {
      controllers.size.value = value;
    });
  }

  Widget _quantitySelector(Size mediaQuery) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Jumlah", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: ColorValue.kDarkGrey)),
          Container(
            width: mediaQuery.width * 0.3, // Make it responsive
            height: mediaQuery.height * 0.04,
            decoration: BoxDecoration(
              color: ColorValue.kLightGrey,
              border: Border.all(color: ColorValue.kDarkGrey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove, size: 10),
                  onPressed: () {
                    if (controllers.quantity.value > 0) {
                      controllers.quantity.value--;
                    }
                  },
                ),
                Text(controllers.quantity.value.toString(), style: TextStyle(fontSize: 10)),
                IconButton(
                  icon: Icon(Icons.add, size: 10),
                  onPressed: () {
                    controllers.quantity.value++;
                  },
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget _buyButton(Size mediaQuery) {
    return Center(
      child: GestureDetector(
        onTap: () {
          if (controllers.quantity.value > 0) {
            controllers.addToCart(item.id);
            Get.toNamed("/cart");
          } else {
            Get.snackbar(
              "Kuantitas Tidak Valid",
              "Jumlah produk tidak boleh nol",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
        },
        child: Container(
          width: mediaQuery.width * 0.8,
          height: mediaQuery.height * 0.06,
          decoration: BoxDecoration(
            color: ColorValue.kPrimary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text("Tambah ke Keranjang", style: TextStyle(fontFamily: "General Sans", color: ColorValue.kWhite)),
          ),
        ),
      ),
    );
  }
}
