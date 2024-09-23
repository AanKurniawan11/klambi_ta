import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:klambi_ta/Pages/history/controller/historycontroller.dart';
import '../../../Common/colors/color.dart';
import '../../../component/format_price.dart';

class OrderDetailPage extends StatelessWidget {
  final int historyId;

  OrderDetailPage({required this.historyId});

  @override
  Widget build(BuildContext context) {
    final HistoryController historyController = Get.find();
    // historyController.fetchOrderDetail(historyId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pesanan Saya'),
      ),
      body: Obx(() {
        final isLoading = historyController.isLoading.value;
        final orderDetail = historyController.selectedOrderDetail.value;

        if (isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (orderDetail == null) {
          return Center(child: Text('No order details found.'));
        }

        return SingleChildScrollView(  // Tambahkan SingleChildScrollView di sini
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Detail Pesanan",
                    style: TextStyle(
                      fontFamily: "General Sans",
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      color: ColorValue.kPrimary,
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildDetailRow(
                    context,
                    "Order ID:",
                    orderDetail.orderHistory.orderId.toString(),
                  ),
                  SizedBox(height: 8),
                  _buildDetailRow(
                    context,
                    "Order Date:",
                    DateFormat('d MMMM yyyy').format(orderDetail.orderHistory.orderTime),
                  ),
                  SizedBox(height: 8),
                  _buildDetailRow(
                    context,
                    "Status:",
                    orderDetail.orderHistory.status,
                  ),
                  SizedBox(height: 16),
                  Divider(color: ColorValue.kLightGrey, thickness: 1),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width * 0.2,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(orderDetail.product.image ?? "https://via.placeholder.com/150"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              orderDetail.product.title ?? "Product Name",
                              style: TextStyle(
                                fontFamily: "General Sans",
                                fontSize: MediaQuery.of(context).size.width * 0.04,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Size: ${orderDetail.product.size ?? 'N/A'}",
                              style: TextStyle(
                                fontFamily: "General Sans",
                                color: ColorValue.kLightGrey,
                              ),
                            ),
                            Text(
                              formatPrice(orderDetail.product.price),
                              style: TextStyle(
                                fontFamily: "General Sans",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Divider(color: ColorValue.kLightGrey, thickness: 1),
                  SizedBox(height: 16),
                  _buildDetailRow(context, "Biaya Pengiriman", formatPrice(orderDetail.orderHistory.handlingFee)),
                  SizedBox(height: 8),
                  _buildDetailRow(context, "Biaya Penangan", formatPrice(orderDetail.orderHistory.shippingFee)),
                  SizedBox(height: 8),
                  _buildDetailRow(context, "Potongan Harga", formatPrice(orderDetail.product.price)),
                  SizedBox(height: 8),
                  Divider(color: ColorValue.kLightGrey, thickness: 1),
                  SizedBox(height: 16),
                  _buildDetailRow(context, "Total", formatPrice(orderDetail.orderHistory.totalPrice)),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildDetailRow(BuildContext context, String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: "General Sans",
            fontSize: MediaQuery.of(context).size.width * 0.04,
            fontWeight: FontWeight.w500,
          ),
        ),
        Flexible(
          child: Text(
            value,
            style: TextStyle(
              fontFamily: "General Sans",
              fontSize: MediaQuery.of(context).size.width * 0.04,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
