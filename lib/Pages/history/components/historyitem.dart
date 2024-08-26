// import 'package:flutter/material.dart';
// import 'package:klambi_ta/Common/colors/color.dart';
// import 'package:klambi_ta/Pages/history/components/showHistoryModel.dart';
//
// class OrderItem extends StatelessWidget {
//   final Datum order;
//   final double width;
//   final double height;
//
//   OrderItem({required this.order, required this.width, required this.height});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//       child: Container(
//         height: height * 0.2,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           border: Border.fromBorderSide(BorderSide(color: ColorValue.kLightGrey)),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8),
//           child: Row(
//             children: [
//               // Gambar produk, menangani null dengan default placeholder
//               Container(
//                 height: height * 0.078,
//                 width: width * 0.156,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: NetworkImage(order.image ?? 'https://via.placeholder.com/150'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               SizedBox(width: 5),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 35),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Lengan Pendek",
//                       style: TextStyle(
//                         fontFamily: "General Sans",
//                         fontSize: 10,
//                         color: ColorValue.kDarkGrey,
//                       ),
//                     ),
//                     FittedBox(
//                       fit: BoxFit.fitWidth,
//                       child: Container(
//                         width: width * 0.45,
//                         child: Text(
//                           order.productsTitle.join(', '),
//                           style: TextStyle(
//                             fontFamily: "General Sans",
//                             fontSize: 14,
//                           ),
//                         ),
//                       ),
//                     ),
//                     // Uncomment and adapt for total price
//                     // Text(
//                     //   formatPrice(double.tryParse(order.totalPrice) ?? 0),
//                     //   style: TextStyle(
//                     //     fontFamily: "General Sans",
//                     //     fontSize: 16,
//                     //     fontWeight: FontWeight.w600,
//                     //   ),
//                     // ),
//                   ],
//                 ),
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     order.status,
//                     style: TextStyle(
//                       fontSize: 10,
//                       color: ColorValue.kPrimary,
//                       fontFamily: "General Sans",
//                     ),
//                   ),
//                   // Uncomment and adapt for action button
//                   // GestureDetector(
//                   //   onTap: () {
//                   //     Get.to(DetailOrder());
//                   //   },
//                   //   child: Container(
//                   //     width: width * 0.2,
//                   //     height: height * 0.038,
//                   //     decoration: BoxDecoration(
//                   //       borderRadius: BorderRadius.circular(25),
//                   //       color: ColorValue.kSecondary,
//                   //     ),
//                   //     child: Row(
//                   //       mainAxisAlignment: MainAxisAlignment.center,
//                   //       children: [
//                   //         Text(
//                   //           order.status == 'Sedang Diproses' ? "Detail" : "Nilai",
//                   //           style: TextStyle(
//                   //             color: ColorValue.kWhite,
//                   //             fontFamily: "General Sans",
//                   //             fontSize: 12,
//                   //           ),
//                   //         ),
//                   //         Icon(
//                   //           order.status == 'Sedang Diproses'
//                   //               ? Icons.receipt_outlined
//                   //               : Icons.star_purple500_sharp,
//                   //           color: order.status == 'Sedang Diproses'
//                   //               ? Colors.white
//                   //               : Colors.yellow,
//                   //           size: 18,
//                   //         ),
//                   //       ].withSpaceBetween(width: 8),
//                   //     ),
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
