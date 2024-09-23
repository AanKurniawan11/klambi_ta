import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/cart/controller/cart_controllers.dart';
import 'package:klambi_ta/Pages/payment/controller/payment_controller.dart';
import '../page/confirmpay.dart';

class payMeth extends StatelessWidget {
  final CartControllers controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Obx(() => DropdownButtonFormField<String>(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade200, // Warna latar belakang
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0), // Sudut melengkung
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        ),
        value: controller.paymeth.value.isEmpty ? null : controller.paymeth.value,
        hint: Text(
          'Metode Pembayaran',
          style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
        ),
        isExpanded: true,
        items: _buildPaymentMethods(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            controller.paymeth.value = newValue;
            controller.addPayCart();
            if (newValue == 'ATM BSI') {
              Get.to(() => PaymentConfirmationPage());
            }
          }
        },
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.blue.shade800,
        ),
        iconSize: 24,
        style: TextStyle(
          fontSize: 16,
          color: Colors.blue.shade800,
        ),
      )),
    );
  }

  List<DropdownMenuItem<String>> _buildPaymentMethods() {
    return [
      DropdownMenuItem<String>(
        value: 'Cash on Delivery',
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Cash on Delivery',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            Image.asset(
              "assets/cod.jpg",
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
      DropdownMenuItem<String>(
        value: 'ATM BSI',
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'ATM BSI',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            Image.asset(
              "assets/bsi.png",
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    ];
  }
}
