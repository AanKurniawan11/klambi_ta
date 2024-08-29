// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:get/get.dart';
// import 'package:klambi_ta/Pages/history/components/history_controller.dart';
//
// import '../testcontroller.dart';
//
// class DetailOrder extends StatelessWidget {
//   final int orderId;
//
//   DetailOrder({required this.orderId});
//
//   @override
//   Widget build(BuildContext context) {
//     final HistoryController controller = Get.put(HistoryController());
//
//     // Fetch order details when the widget is first built
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       controller.fetchOrderDetails(orderId);
//     });
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Order Details'),
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         }
//
//         final detailOrder = controller.detailOrder.value;
//         if (detailOrder == null) {
//           return Center(child: Text('Order not found.'));
//         }
//
//         final orderHistory = detailOrder.data.orderHistory;
//         final products = detailOrder.data.products;
//
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Order ID: ${orderHistory.orderId}',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'Status: ${orderHistory.status}',
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'Total Price: ${formatPrice(orderHistory.totalPrice)}',
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'Payment Method: ${orderHistory.paymentMethod}',
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'Order Time: ${DateFormat('yyyy-MM-dd HH:mm').format(orderHistory.orderTime)}',
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'Products:',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: products.length,
//                   itemBuilder: (context, index) {
//                     final product = products[index];
//                     return ListTile(
//                       leading: Image.network(product.image),
//                       title: Text(product.title),
//                       subtitle: Text('Quantity: ${product.quantity} | Size: ${product.size}'),
//                       trailing: Text('${formatPrice(product.price)}'),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
//
//   String formatPrice(int price) {
//     final format = NumberFormat.currency(
//       locale: 'id_ID',
//       symbol: 'Rp ',
//       decimalDigits: 0,
//     );
//     return format.format(price);
//   }
// }
