// import 'package:flutter/material.dart';
// import 'package:klambi_ta/Pages/home/home_controller.dart';
// import 'package:klambi_ta/shimer/product_card.dart';
// import 'package:klambi_ta/shimer/skeleton.dart';
// import 'package:get/get.dart';
// import '../Pages/home/allproductresponsemodel.dart';
// import 'constant.dart';
//
// class NewsPage extends StatelessWidget {
//   final HomeController controller = Get.put(HomeController());
//
//   NewsPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           "News App",
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
//         child: Obx(() {
//           if (controller.isLoading.value) {
//             return ListView.separated(
//               itemCount: 5,
//               itemBuilder: (context, index) => const NewsCardSkeleton(),
//               separatorBuilder: (context, index) => const SizedBox(height: defaultPadding),
//             );
//           } else {
//             return ProductGrid(controller.productResponseAll);
//           }
//         }),
//       ),
//     );
//   }
// }
//
// class NewsCardSkeleton extends StatelessWidget {
//   const NewsCardSkeleton({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         const Skeleton(height: 120, width: 120),
//         const SizedBox(width: defaultPadding),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Skeleton(width: 80),
//               const SizedBox(height: defaultPadding / 2),
//               const Skeleton(),
//               const SizedBox(height: defaultPadding / 2),
//               const Skeleton(),
//               const SizedBox(height: defaultPadding / 2),
//               Row(
//                 children: const [
//                   Expanded(child: Skeleton()),
//                   SizedBox(width: defaultPadding),
//                   Expanded(child: Skeleton()),
//                 ],
//               )
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }