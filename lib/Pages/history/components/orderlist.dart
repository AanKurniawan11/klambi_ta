// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:klambi_ta/Pages/history/components/history_controller.dart';
// import 'package:klambi_ta/Pages/history/components/ordercard.dart';
//
//
// class OrderList extends StatelessWidget {
//   const OrderList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final HistoryController controller = Get.find();
//
//     return Obx(() {
//       if (controller.filteredOrders.isEmpty) {
//         return const Center(child: Text('No orders found.'));
//       } else {
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 25),
//           child: ListView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: controller.filteredOrders.length,
//             itemBuilder: (context, index) {
//               return OrderCard(order: controller.filteredOrders[index]);
//             },
//           ),
//         );
//       }
//     });
//   }
// }