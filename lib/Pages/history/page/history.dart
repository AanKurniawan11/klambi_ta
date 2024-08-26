import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/Pages/history/components/history_controller.dart';
import 'package:klambi_ta/Pages/history/components/orderlist.dart';
import 'package:klambi_ta/Pages/history/components/tabbar.dart';
import 'package:klambi_ta/Pages/history/page/detailOrder/detail_order.dart';
import 'package:klambi_ta/Pages/payment/controller/payment_controller.dart';

import '../../home/components/header.dart';


class HistoryPage extends GetView<HistoryController> {
  HistoryPage({super.key});

  final HistoryController historyController = Get.put(HistoryController());
  final PaymentController paymentController = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorValue.kBackground,
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(
                color: ColorValue.kSecondary,
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  TabBarTest(),
                  const SizedBox(height: 25),
                  const OrderList(),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}

