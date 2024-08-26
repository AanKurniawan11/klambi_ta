import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:klambi_ta/Pages/history/components/history_controller.dart';
import 'package:klambi_ta/Pages/history/page/detailOrder/detail_order.dart';
import 'package:klambi_ta/common/colors/color.dart';

import 'allstatusmodel.dart';


class OrderCard extends StatelessWidget {
  final Datum order;
  final HistoryController controller = Get.find();

   OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    // Create a NumberFormat object for Indonesian Rupiah
    final NumberFormat currencyFormat = NumberFormat.currency(locale: 'id', symbol: 'Rp. ', decimalDigits: 0);

    // Format the order date to show only the date without the time
    final String formattedDate = DateFormat('dd MMM yyyy').format(order.order.orderTime.toLocal());

    return GestureDetector(
      onTap: () {
        Get.to(DetailOrder(orderId: order.order.orderId));
      },
      child: Container(
        width: width * 0.9,
        height: 200,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: ColorValue.kWhite,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: ColorValue.kBlack.withOpacity(0.15),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 20),
                    child: Image.network(
                      order.products.isNotEmpty
                          ? order.products[0].image
                          : 'https://via.placeholder.com/150',
                      height: height / 7,
                      width: width / 4.5,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            order.products.isNotEmpty ? order.products[0].title : 'No Title',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: ColorValue.kBlack,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Order ID: #${order.order.orderId}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: ColorValue.kDarkGrey,
                            ),
                          ),
                          Text(
                            'Pembeli: ${order.order.address.namaLengkap}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: ColorValue.kDarkGrey,
                            ),
                          ),
                          Text(
                            'Total: ${currencyFormat.format(order.order.totalPrice)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: ColorValue.kDarkGrey,
                            ),
                          ),
                          Text(
                            'Tanggal: $formattedDate',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: ColorValue.kDarkGrey,
                            ),
                          ),
                          Text(
                            '${controller.formatCategoryName(order.order.status) }',
                            style: const TextStyle(
                              color: ColorValue.kPrimary,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}