import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/payment/controller/payment_controller.dart';

class PaymentPage extends StatelessWidget {
  final PaymentController paymentController = Get.find<PaymentController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pembayaran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          final productId = paymentController.productId.value;
          final quantity = paymentController.quantity.value;
          final size = paymentController.size.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Produk ID: $productId'),
              Text('Jumlah: $quantity'),
              Text('Ukuran: $size'),
              // Tampilkan informasi lain dan form pembayaran di sini
            ],
          );
        }),
      ),
    );
  }
}
