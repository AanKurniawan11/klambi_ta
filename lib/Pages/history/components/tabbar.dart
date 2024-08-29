// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:klambi_ta/Common/colors/color.dart';
// import 'package:klambi_ta/Pages/history/components/history_controller.dart';
//
// import '../page/testcontroller.dart';
//
// class TabBarTest extends StatelessWidget {
//   const TabBarTest({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final HistoryController controller = Get.find();
//
//     return Obx(
//           () => controller.categoryResponseAll.isNotEmpty
//           ? DefaultTabController(
//         length: controller.categoryResponseAll.length,
//         child: Column(
//           children: [
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 25),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Center(
//                         child: Text(
//                           'Riwayat Pesanan',
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: TabBar(
//                 isScrollable: true,
//                 indicatorColor: ColorValue.kSecondary,
//                 labelColor: ColorValue.kSecondary,
//                 unselectedLabelColor: ColorValue.kDarkGrey,
//                 tabs: controller.categoryResponseAll
//                     .map((status) => Tab(text: controller.formatCategoryName(status ) ))
//                     .toList(),
//                 onTap: (index) {
//                   controller.onStatusSelected(controller.categoryResponseAll[index]);
//                 },
//               ),
//             ),
//           ],
//         ),
//       )
//           : SizedBox.shrink(),
//     );
//   }}
