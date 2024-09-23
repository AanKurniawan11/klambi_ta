import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/Pages/history/controller/historycontroller.dart';
import 'package:klambi_ta/component/format_price.dart';
import 'package:klambi_ta/component/loadinfanimation.dart';
import 'detailhistory.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HistoryController historyController = Get.put(HistoryController());
    historyController.fetchOrderHistory(); // Memanggil fungsi untuk mengambil data saat halaman dibangun

    final List<IconData> statusIcons = [
      CupertinoIcons.clock,
      Icons.card_giftcard_outlined,
      Icons.local_shipping,
      Icons.local_shipping_outlined,
      Icons.check_circle,
    ];

    return Obx(() {
      if (historyController.isLoading.value) {
        return Scaffold(
          body: Loading(), // Indikator loading
        );
      }

      final defaultTabIndex = historyController.statusList.indexOf('sedang_diproses');
      final statusListLength = historyController.statusList.length;

      return DefaultTabController(
        length: statusListLength,
        initialIndex: defaultTabIndex >= 0 ? defaultTabIndex : 0,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(130),
            child: AppBar(
              automaticallyImplyLeading: false,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  color: ColorValue.kWhite,
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'Riwayat',
                        style: TextStyle(
                          fontFamily: 'General Sans',
                          fontSize: 22,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      TabBar(
                        isScrollable: true,
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(width: 3.5, color: ColorValue.kSecondary),
                          insets: EdgeInsets.symmetric(horizontal: 16.0),
                        ),
                        unselectedLabelColor: ColorValue.kLightGrey,
                        labelColor: ColorValue.kSecondary,
                        labelStyle: TextStyle(
                          fontFamily: 'General Sans',
                          fontSize: 14,
                        ),
                        tabs: List.generate(statusListLength, (index) {
                          final status = historyController.statusList[index];
                          final icon = index < statusIcons.length ? statusIcons[index] : Icons.cancel;
                          return Tab(
                            text: historyController.formatCategoryName(status),
                            icon: Icon(icon, size: 20),
                          );
                        }),
                        onTap: (index) {
                          historyController.filterOrdersByStatus(historyController.statusList[index]);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
          body: TabBarView(
            children: historyController.statusList.map((status) {
              final filteredOrders = historyController.filteredOrders
                  .where((order) => order.order.status == status)
                  .toList();

              if (filteredOrders.isEmpty) {
                return Center(
                  child: Text(
                    'Tidak ada Pesanan ${historyController.formatCategoryName(status)}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontFamily: 'General Sans',
                    ),
                  ),
                );
              }

              return ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: filteredOrders.length,
                itemBuilder: (context, index) {
                  final order = filteredOrders[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(OrderDetailPage(historyId: order.orderHistoryId));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: order.products.isNotEmpty
                                      ? Image.network(
                                    order.products.first.image,
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  )
                                      : Icon(
                                    Icons.image_not_supported,
                                    size: 60,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            historyController.formatCategoryName(status),
                                            style: TextStyle(
                                                fontFamily: "General Sans",
                                                color: ColorValue.kPrimary),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        order.products.isNotEmpty
                                            ? order.products[0].title
                                            : 'No Product Title',
                                        style: TextStyle(
                                          fontFamily: 'General Sans',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: ColorValue.kBlack,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${order.products[0].size},",
                                            style: TextStyle(
                                              fontFamily: 'General Sans',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: ColorValue.kDarkGrey,
                                            ),
                                          ),
                                          Text(
                                            " ${order.products[0].quantity.toString()}",
                                            style: TextStyle(
                                              fontFamily: 'General Sans',
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: ColorValue.kDarkGrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        formatPrice(order.order.totalPrice),
                                        style: TextStyle(
                                          fontFamily: 'General Sans',
                                          fontSize: 16,
                                          color: ColorValue.kBlack,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                if (status == 'terkirim')
                                  ElevatedButton(
                                    onPressed: () {
                                      historyController.confirmOrder(order.orderHistoryId);
                                    },
                                    child: Text(
                                      'Pesanan Diterima',
                                      style: TextStyle(
                                        fontFamily: 'General Sans',
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: ColorValue.kPrimary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                if (status == 'pesanan_selesai')
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      historyController.showRatingDialog(
                                        context,
                                        order.products[0].productId,
                                        historyController,
                                      );
                                    },
                                    icon: Icon(Icons.star, color: Colors.white),
                                    label: Text(
                                      'Beri Nilai',
                                      style: TextStyle(
                                        fontFamily: 'General Sans',
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: ColorValue.kSecondary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                if (status == 'sedang_dikemas')
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      historyController.cancelOrder(order.orderHistoryId);
                                    },
                                    icon: Icon(Icons.cancel, color: Colors.white),
                                    label: Text(
                                      'Batalkan',
                                      style: TextStyle(
                                        fontFamily: 'General Sans',
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: ColorValue.kDanger,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
      );
    });
  }

}
