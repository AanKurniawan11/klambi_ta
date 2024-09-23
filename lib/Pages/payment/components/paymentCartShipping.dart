import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/Pages/cart/controller/cart_controllers.dart';
import 'package:klambi_ta/Pages/payment/controller/payment_controller.dart';

class ShippingMethod {
  final String method;
  final String estimatedTime;
  final double price;

  ShippingMethod({
    required this.method,
    required this.estimatedTime,
    required this.price,
  });
}

class payShip extends StatelessWidget {
  final CartControllers controller = Get.find();

  final List<ShippingMethod> shippingMethods = [
    ShippingMethod(method: 'Express', estimatedTime: '1-2 hari', price: 65000),
    ShippingMethod(method: 'Standard', estimatedTime: '3-5 hari', price: 55000),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Obx(() => DropdownButtonFormField<ShippingMethod>(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade200,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
        ),
        value: shippingMethods.firstWhere(
              (method) => method.method == controller.shipmeth.value,
          orElse: () => shippingMethods.first,
        ),
        hint: Text(
          'Pilih Metode Pengiriman',
          style: TextStyle(color: ColorValue.kBlack, fontSize: 16),
        ),
        isExpanded: true,
        items: shippingMethods.map((method) {
          return DropdownMenuItem<ShippingMethod>(

            value: method,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '${method.method} (${method.estimatedTime})',
                      style: TextStyle(fontSize: 16, color: ColorValue.kBlack),
                      overflow: TextOverflow.ellipsis, // Menangani teks yang terlalu panjang
                    ),
                  ),
                  Text(
                    '${formatPrice(method.price)}',
                    style: TextStyle(fontSize: 16, color: ColorValue.kBlack),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
        onChanged: (ShippingMethod? newValue) {
          if (newValue != null) {
            controller.shipmeth.value = newValue.method;
            controller.addShippingCart(); // Memanggil fungsi untuk memperbarui metode pengiriman
            print('Metode pengiriman dipilih: ${controller.shipmeth.value}');
          }
        },
        style: TextStyle(
          fontSize: 16,
          color: Colors.blue.shade800,
        ),
      )),
    );
  }

  String formatPrice(double price) {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');
    return formatter.format(price);
  }
}
