import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/history/page/detailOrder/detail_order.dart';
import 'package:klambi_ta/Pages/payment/controller/payment_controller.dart';
import 'package:klambi_ta/component/format_price.dart';
import 'package:klambi_ta/component/space_extension.dart';

import '../../payment/components/listdown.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final PaymentController paymentController = Get.put(PaymentController());

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Text(
                "Riwayat Pesanan",
                style: TextStyle(fontSize: 25, fontFamily: "General Sans"),
              ),
            ),
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  const TabBar(
                    labelColor: ColorValue.kPrimary,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: ColorValue.kPrimary,
                    tabs: [
                      Tab(
                          child: Text(
                        "Sedang Diproses",
                        style: TextStyle(fontFamily: "General Sans"),
                      )),
                      Tab(
                          child: Text(
                        "Selesai Dipesan",
                        style: TextStyle(fontFamily: "General Sans"),
                      )),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Container(
                  //   height: height * 0.68,
                  //   child: TabBarView(
                  //     children: [
                  //       Obx(() {
                  //         if (paymentController.isLoading.value) {
                  //           return Center(child: CircularProgressIndicator());
                  //         }
                  //
                  //         // final orderList = paymentController.orderList.value;
                  //         final selectedPaymentMethod =
                  //             paymentController.paymeth.value;
                  //
                  //         if (orderList == null || orderList.isEmpty) {
                  //           return Center(child: CircularProgressIndicator());
                  //         }
                  //
                  //         return ListView.builder(
                  //           padding: const EdgeInsets.all(16.0),
                  //           itemCount: orderList.length,
                  //           itemBuilder: (context, index) {
                  //             final orderData = orderList[index];
                  //             final order = orderData.order;
                  //
                  //             if (order == null) {
                  //               return Container();
                  //             }
                  //
                  //             return Column(children: [
                  //               ...orderData.products!.map((product) {
                  //                 return Padding(
                  //                   padding: const EdgeInsets.symmetric(
                  //                       horizontal: 10, vertical: 10),
                  //                   child: Container(
                  //                     height: height * 0.2,
                  //                     width: double.infinity,
                  //                     decoration: BoxDecoration(
                  //                         border: Border.fromBorderSide(
                  //                             BorderSide(
                  //                                 color:
                  //                                     ColorValue.kLightGrey)),
                  //                         borderRadius:
                  //                             BorderRadius.circular(10)),
                  //                     child: Padding(
                  //                       padding: const EdgeInsets.all(8),
                  //                       child: Row(
                  //                         children: [
                  //                           Container(
                  //                             height: height * 0.078,
                  //                             width: width * 0.156,
                  //                             foregroundDecoration:
                  //                                 BoxDecoration(
                  //                                     image: DecorationImage(
                  //                                         image: NetworkImage(
                  //                                             product.image!),
                  //                                         fit: BoxFit.cover)),
                  //                           ),
                  //                           SizedBox(
                  //                             width: 5,
                  //                           ),
                  //                           Padding(
                  //                             padding:
                  //                                 const EdgeInsets.symmetric(
                  //                                     vertical: 35),
                  //                             child: Container(
                  //                                 child: Column(
                  //                               crossAxisAlignment:
                  //                                   CrossAxisAlignment.start,
                  //                               children: [
                  //                                 Container(
                  //                                     child: Text(
                  //                                   "Lengan Pendek",
                  //                                   style: TextStyle(
                  //                                       fontFamily:
                  //                                           "General Sans",
                  //                                       fontSize: 10,
                  //                                       color: ColorValue
                  //                                           .kDarkGrey),
                  //                                 )),
                  //                                 FittedBox(
                  //                                   fit: BoxFit.fitWidth,
                  //                                   child: Container(
                  //                                       width: width * 0.45,
                  //                                       child: Text(
                  //                                         product.title!,
                  //                                         style: TextStyle(
                  //                                             fontFamily:
                  //                                                 "General Sans",
                  //                                             fontSize: 14),
                  //                                       )),
                  //                                 ),
                  //                                 Container(
                  //                                     child: Text(
                  //                                   formatPrice(product.price!),
                  //                                   style: TextStyle(
                  //                                       fontFamily:
                  //                                           "General Sans",
                  //                                       fontSize: 16,
                  //                                       fontWeight:
                  //                                           FontWeight.w600),
                  //                                 )),
                  //                               ],
                  //                             )),
                  //                           ),
                  //                           Column(
                  //                             mainAxisAlignment:
                  //                                 MainAxisAlignment
                  //                                     .spaceBetween,
                  //                             children: [
                  //                               Text(
                  //                                 order.status.toString(),
                  //                                 style: TextStyle(
                  //                                   fontSize: 10,
                  //                                     color:
                  //                                         ColorValue.kPrimary,
                  //                                     fontFamily:
                  //                                         "General Sans"),
                  //                               ),
                  //                               GestureDetector(
                  //                                 onTap: () {
                  //                                   Get.to(DetailOrder());
                  //                                 },
                  //                                 child: Container(
                  //                                   width: width * 0.2,
                  //                                   height: height * 0.038,
                  //                                   decoration: BoxDecoration(
                  //                                       borderRadius:
                  //                                           BorderRadius
                  //                                               .circular(25),
                  //                                       color: ColorValue
                  //                                           .kSecondary),
                  //                                   child: Row(
                  //                                       mainAxisAlignment:
                  //                                           MainAxisAlignment
                  //                                               .center,
                  //                                       children: [
                  //                                         Text(
                  //                                           "Detail",
                  //                                           style: TextStyle(
                  //                                               color:
                  //                                                   ColorValue
                  //                                                       .kWhite,
                  //                                               fontFamily:
                  //                                                   "General Sans",
                  //                                               fontSize: 12),
                  //                                         ),
                  //                                         Icon(
                  //                                           Icons
                  //                                               .receipt_outlined,
                  //                                           color:
                  //                                               Colors.white,
                  //                                           size: 18,
                  //                                         )
                  //                                       ].withSpaceBetween(
                  //                                           width: 8)),
                  //                                 ),
                  //                               )
                  //                             ],
                  //                           )
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 );
                  //               })
                  //             ]);
                  //           },
                  //         );
                  //       }),
                  //       Obx(() {
                  //         if (paymentController.isLoading.value) {
                  //           return Center(child: CircularProgressIndicator());
                  //         }
                  //
                  //         final orderList = paymentController.orderList.value;
                  //         final selectedPaymentMethod =
                  //             paymentController.paymeth.value;
                  //
                  //         if (orderList == null || orderList.isEmpty) {
                  //           return Center(child: CircularProgressIndicator());
                  //         }
                  //
                  //         return ListView.builder(
                  //           padding: const EdgeInsets.all(16.0),
                  //           itemCount: orderList.length,
                  //           itemBuilder: (context, index) {
                  //             final orderData = orderList[index];
                  //             final order = orderData.order;
                  //
                  //             if (order == null) {
                  //               return Container();
                  //             }
                  //
                  //             return Column(children: [
                  //               ...orderData.products!.map((product) {
                  //                 return Padding(
                  //                   padding: const EdgeInsets.symmetric(
                  //                       horizontal: 10, vertical: 10),
                  //                   child: Container(
                  //                     height: height * 0.2,
                  //                     width: double.infinity,
                  //                     decoration: BoxDecoration(
                  //                         border: Border.fromBorderSide(
                  //                             BorderSide(
                  //                                 color:
                  //                                     ColorValue.kLightGrey)),
                  //                         borderRadius:
                  //                             BorderRadius.circular(10)),
                  //                     child: Padding(
                  //                       padding: const EdgeInsets.all(8),
                  //                       child: Row(
                  //                         children: [
                  //                           Container(
                  //                             height: height * 0.078,
                  //                             width: width * 0.156,
                  //                             foregroundDecoration:
                  //                                 BoxDecoration(
                  //                                     image: DecorationImage(
                  //                                         image: NetworkImage(
                  //                                             product.image!),
                  //                                         fit: BoxFit.cover)),
                  //                           ),
                  //                           SizedBox(
                  //                             width: 5,
                  //                           ),
                  //                           Padding(
                  //                             padding:
                  //                                 const EdgeInsets.symmetric(
                  //                                     vertical: 35),
                  //                             child: Container(
                  //                                 child: Column(
                  //                               crossAxisAlignment:
                  //                                   CrossAxisAlignment.start,
                  //                               children: [
                  //                                 Container(
                  //                                     child: Text(
                  //                                   "Lengan Pendek",
                  //                                   style: TextStyle(
                  //                                       fontFamily:
                  //                                           "General Sans",
                  //                                       fontSize: 10,
                  //                                       color: ColorValue
                  //                                           .kDarkGrey),
                  //                                 )),
                  //                                 FittedBox(
                  //                                   fit: BoxFit.fitWidth,
                  //                                   child: Container(
                  //                                       width: width * 0.45,
                  //                                       child: Text(
                  //                                         product.title!,
                  //                                         style: TextStyle(
                  //                                             fontFamily:
                  //                                                 "General Sans",
                  //                                             fontSize: 14),
                  //                                       )),
                  //                                 ),
                  //                                 Container(
                  //                                     child: Text(
                  //                                   formatPrice(product.price!),
                  //                                   style: TextStyle(
                  //                                       fontFamily:
                  //                                           "General Sans",
                  //                                       fontSize: 16,
                  //                                       fontWeight:
                  //                                           FontWeight.w600),
                  //                                 )),
                  //                               ],
                  //                             )),
                  //                           ),
                  //                           Column(
                  //                             mainAxisAlignment:
                  //                                 MainAxisAlignment
                  //                                     .spaceBetween,
                  //                             children: [
                  //                               Text(
                  //                                 "Selesai",
                  //                                 style: TextStyle(
                  //                                     color:
                  //                                         ColorValue.kPrimary,
                  //                                     fontFamily:
                  //                                         "General Sans"),
                  //                               ),
                  //                               GestureDetector(
                  //                                 onTap: () {
                  //                                   Get.to(DetailOrder());
                  //                                 },
                  //                                 child: Container(
                  //                                   width: width * 0.2,
                  //                                   height: height * 0.038,
                  //                                   decoration: BoxDecoration(
                  //                                       borderRadius:
                  //                                           BorderRadius
                  //                                               .circular(25),
                  //                                       color: ColorValue
                  //                                           .kSecondary),
                  //                                   child: Row(
                  //                                       mainAxisAlignment:
                  //                                           MainAxisAlignment
                  //                                               .center,
                  //                                       children: [
                  //                                         Text(
                  //                                           "Nilai",
                  //                                           style: TextStyle(
                  //                                               color:
                  //                                                   ColorValue
                  //                                                       .kWhite,
                  //                                               fontFamily:
                  //                                                   "General Sans",
                  //                                               fontSize: 12),
                  //                                         ),
                  //                                         Icon(
                  //                                           Icons
                  //                                               .star_purple500_sharp,
                  //                                           color:
                  //                                               Colors.yellow,
                  //                                           size: 18,
                  //                                         )
                  //                                       ].withSpaceBetween(
                  //                                           width: 8)),
                  //                                 ),
                  //                               )
                  //                             ],
                  //                           )
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 );
                  //               })
                  //             ]);
                  //           },
                  //         );
                  //       }),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
