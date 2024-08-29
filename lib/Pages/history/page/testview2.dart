import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:klambi_ta/Pages/history/page/detailOrder/ordercard.dart';
import 'package:klambi_ta/Pages/history/page/testcontroller.dart';
import 'package:klambi_ta/component/space_extension.dart';

import '../../../Common/colors/color.dart';
import '../../../component/format_price.dart';

class OrderDetailPage extends StatelessWidget {
  final int historyId;

  OrderDetailPage({required this.historyId});

  @override
  Widget build(BuildContext context) {
    final HistoryController historyController = Get.find();
    historyController.fetchOrderDetail(historyId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
      ),
      body: Obx(() {
        final isLoading = historyController.isLoading.value;
        final orderDetail = historyController.selectedOrderDetail.value;
        // final ordertest = historyController.selectedOrderDetail.value?.product;

        if (isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (orderDetail == null) {
          return Center(child: Text('No order details found.'));
        }

        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
                height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.fromBorderSide(
                      BorderSide(color: ColorValue.kLightGrey)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Rincian",
                            style: TextStyle(
                                fontFamily: "General Sans", fontSize: 18),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            ],
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Waktu Pesanan",
                                      style: TextStyle(
                                          fontFamily: "General Sans", fontSize: 16),
                                    ),
                                    Text(
                                      // DateFormat.yMMMd().format(order.createdAt),
                                      DateFormat.MMMMEEEEd().format(
                                          orderDetail.orderHistory.orderTime),
                                      style: TextStyle(
                                          fontFamily: "General Sans", fontSize: 16),
                                    ),
                                  ],
                                ),
                                const Divider(
                                  thickness: 1,
                                  indent: 0,
                                  endIndent: 0,
                                  color: ColorValue.kLightGrey,
                                ),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(orderDetail.product.image ?? "https://via.placeholder.com/150"), // Ganti dengan gambar produk
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 190,
                                                child: Text(
                                                  orderDetail.product.title ?? "Nama Produk", // Ganti dengan nama produk
                                                  style: TextStyle(fontFamily: "General Sans"),
                                                ),
                                              ),
                                              Text(
                                                "Size ${orderDetail.product.size ?? 'N/A'}", // Ganti dengan ukuran produk jika ada
                                                style: TextStyle(fontFamily: "General Sans", color: ColorValue.kLightGrey),
                                              ),
                                              Text(
                                                formatPrice(orderDetail.product.price), // Ganti dengan harga produk jika ada
                                                style: TextStyle(fontFamily: "General Sans", fontWeight: FontWeight.w600),
                                              ),
                                            ],
                                          )
                                        ].withSpaceBetween(width: 8),
                                      ),
                                    ),
                                  ),
                                const Divider(
                                  thickness: 1,
                                  indent: 0,
                                  endIndent: 0,
                                  color: ColorValue.kLightGrey,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Subtotal",
                                      style: TextStyle(
                                          fontFamily: "General Sans", fontSize: 16),
                                    ),
                                    Text(
                                      "test",
                                      style: TextStyle(
                                          fontFamily: "General Sans", fontSize: 16),
                                    ),
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Biaya Penangan",
                                      style: TextStyle(
                                          fontFamily: "General Sans", fontSize: 16),
                                    ),
                                    Text(
                                      formatPrice(orderDetail.orderHistory.handlingFee) ,
                                      style: TextStyle(
                                          fontFamily: "General Sans", fontSize: 16),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Biaya Pengiriman",
                                      style: TextStyle(
                                          fontFamily: "General Sans", fontSize: 16),
                                    ),
                                    Text(
                                      // DateFormat.yMMMd().format(order.createdAt),
                                      formatPrice(orderDetail.orderHistory.shippingFee) ,
                                      style: TextStyle(
                                          fontFamily: "General Sans", fontSize: 16),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Potongan Harga",
                                      style: TextStyle(
                                          fontFamily: "General Sans", fontSize: 16),
                                    ),
                                    Text(
                                      // DateFormat.yMMMd().format(order.createdAt),
                                      // formatPrice(orderDetail.orderHistory.) ,
                                      "",
                                      style: TextStyle(
                                          fontFamily: "General Sans", fontSize: 16),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ]))));
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          historyController.fetchOrderDetail(historyId);
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
