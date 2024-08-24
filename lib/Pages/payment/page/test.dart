import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/payment/controller/payment_controller.dart';

class coba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PaymentController paymentController = Get.find();

    return Scaffold(
      appBar: AppBar(title: Text('Order Details')),
      body: Obx(() {
        if (paymentController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          final order = paymentController.orderData.value?.order;
          final products = paymentController.orderData.value?.products;
          final address = order?.address;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (order != null) ...[
                  // Display Order Information
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Order ID: ${order.id ?? 'N/A'}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Payment Method: ${order.paymentMethod ?? 'N/A'}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Shipping Method: ${order.shippingMethod ?? 'N/A'}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Total Quantity: ${order.quantity ?? 0}'),
                  ),
                ],
                if (address != null) ...[
                  // Display Address Information
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Address: ${address.keterangan ?? 'N/A'}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Recipient: ${address.namaLengkap ?? 'N/A'}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Phone Number: ${address.nomorTelepon ?? 'N/A'}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Province: ${address.provinsi ?? 'N/A'}'),
                  ),
                ],
                if (products != null && products.isNotEmpty) ...[
                  // Display Product Information
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Products:', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  ...products.map((product) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Title: ${product.title ?? 'No Title'}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Price: ${product.price?.toString() ?? 'N/A'}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Quantity: ${product.quantity?.toString() ?? 'N/A'}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Size: ${product.size ?? 'N/A'}'),
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(product.image ?? 'https://via.placeholder.com/100'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ],
              ],
            ),
          );
        }
      }),
    );
  }
}
