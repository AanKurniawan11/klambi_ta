// import 'package:flutter/material.dart';
// import 'package:klambi_ta/component/space_extension.dart';
// import 'package:get/get.dart';
// import '../../../../Common/colors/color.dart';
// import '../testcontroller.dart';
//
// class DetailItem extends StatelessWidget {
//
//   final int historyId;
//
//   DetailItem({required this.historyId});  final HistoryController historyController = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     historyController.fetchOrderDetail(historyId);
//     return Obx((){
//       return
//       Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         child: Container(
//           height: 500,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             border: Border.fromBorderSide(
//                 BorderSide(color: ColorValue.kLightGrey)),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Rincian",
//                   style: TextStyle(fontFamily: "General Sans", fontSize: 18),
//                 ),
//                 Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Id Pesanan",
//                         style: TextStyle(
//                             fontFamily: "General Sans", fontSize: 16),
//                       ),
//                       // Text(
//                       //   order.id.toString(),
//                       //   style: TextStyle(fontFamily: "General Sans", fontSize: 16),
//                       // ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Waktu Pesanan",
//                         style: TextStyle(
//                             fontFamily: "General Sans", fontSize: 16),
//                       ),
//                       // Text(
//                       //   DateFormat.yMMMd().format(order.createdAt), // Ubah format jika perlu
//                       //   style: TextStyle(fontFamily: "General Sans", fontSize: 16),
//                       // ),
//                     ],
//                   ),
//                 ),
//                 const Divider(
//                   thickness: 1,
//                   indent: 0,
//                   endIndent: 0,
//                   color: ColorValue.kLightGrey,
//                 ),
//                 // if (products.isNotEmpty)
//                 //   Container(
//                 //     child: Padding(
//                 //       padding: const EdgeInsets.all(8.0),
//                 //       child: Row(
//                 //         children: [
//                 //           Container(
//                 //             height: 80,
//                 //             width: 80,
//                 //             decoration: BoxDecoration(
//                 //               image: DecorationImage(
//                 //                 image: NetworkImage(products[0].image ?? "https://via.placeholder.com/150"), // Ganti dengan gambar produk
//                 //               ),
//                 //             ),
//                 //           ),
//                 //           Column(
//                 //             crossAxisAlignment: CrossAxisAlignment.start,
//                 //             children: [
//                 //               Container(
//                 //                 width: 190,
//                 //                 child: Text(
//                 //                   products[0].title ?? "Nama Produk", // Ganti dengan nama produk
//                 //                   style: TextStyle(fontFamily: "General Sans"),
//                 //                 ),
//                 //               ),
//                 //               Text(
//                 //                 "Size ${products[0].size ?? 'N/A'}", // Ganti dengan ukuran produk jika ada
//                 //                 style: TextStyle(fontFamily: "General Sans", color: ColorValue.kLightGrey),
//                 //               ),
//                 //               Text(
//                 //                 formatPrice(products[0].price.toDouble()), // Ganti dengan harga produk jika ada
//                 //                 style: TextStyle(fontFamily: "General Sans", fontWeight: FontWeight.w600),
//                 //               ),
//                 //             ],
//                 //           )
//                 //         ].withSpaceBetween(width: 8),
//                 //       ),
//                 //     ),
//                 //   ),
//                 const Divider(
//                   thickness: 1,
//                   indent: 0,
//                   endIndent: 0,
//                   color: ColorValue.kLightGrey,
//                 ),
//                 Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Subtotal",
//                         style: TextStyle(
//                             fontFamily: "General Sans", fontSize: 16),
//                       ),
//                       // Text(
//                       //   formatPrice(totalProductPrice), // Menampilkan subtotal harga produk
//                       //   style: TextStyle(fontFamily: "General Sans", fontSize: 16),
//                       // ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Biaya Penangan",
//                         style: TextStyle(
//                             fontFamily: "General Sans", fontSize: 16),
//                       ),
//                       // Text(
//                       //   formatPrice(double.tryParse(order.handlingFee) ?? 0),
//                       //   style: TextStyle(fontFamily: "General Sans", fontSize: 16),
//                       // ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Biaya Pengiriman",
//                         style: TextStyle(
//                             fontFamily: "General Sans", fontSize: 16),
//                       ),
//                       // Text(
//                       //   formatPrice(double.tryParse(order.shippingFee) ?? 0),
//                       //   style: TextStyle(fontFamily: "General Sans", fontSize: 16),
//                       // ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Potongan Harga",
//                         style: TextStyle(
//                             fontFamily: "General Sans", fontSize: 16),
//                       ),
//                       // Text(
//                       //   "-${formatPrice(double.tryParse(order.discount) ?? 0)}",
//                       //   style: TextStyle(fontFamily: "General Sans", fontSize: 16, color: Colors.red),
//                       // ),
//                     ],
//                   ),
//                 ),
//                 const Divider(
//                   thickness: 1,
//                   indent: 0,
//                   endIndent: 0,
//                   color: ColorValue.kLightGrey,
//                 ),
//                 Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Total",
//                         style: TextStyle(
//                             fontFamily: "General Sans", fontSize: 18),
//                       ),
//                       // Text(
//                       //   formatPrice(total), // Total akhir
//                       //   style: TextStyle(fontFamily: "General Sans", fontSize: 18, fontWeight: FontWeight.w600),
//                       // ),
//                     ],
//                   ),
//                 ),
//               ].withSpaceBetween(height: 10),
//             ),
//           ),
//         ),
//       );
//
//     });
//   }
// }
