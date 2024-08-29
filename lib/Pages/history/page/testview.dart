import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/Pages/history/page/testcontroller.dart';
import 'package:klambi_ta/Pages/history/page/testview2.dart';
import 'package:klambi_ta/component/format_price.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../components/showHistoryModel.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HistoryController historyController = Get.put(HistoryController());
    historyController.fetchOrderHistory();
    historyController.fetchStatuses();

    // Daftar ikon untuk setiap status
    final List<IconData> statusIcons = [
      Icons.shopping_bag, // Contoh untuk status pertama
      Icons.local_shipping, // Contoh untuk status kedua
      Icons.check_circle, // Contoh untuk status ketiga
      Icons.cancel, // Contoh untuk status keempat
    ];

    return Obx(() {
      final statusListLength = historyController.statusList.length;

      if (historyController.isLoading.value) {
        return Center(
          child: LoadingAnimationWidget.discreteCircle(
            color: ColorValue.kPrimary,
            size: 50,
            secondRingColor: ColorValue.kSecondary,
            thirdRingColor: ColorValue.kDanger,
          ),
        );
      }
      return DefaultTabController(
        length: statusListLength,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Order History', style: TextStyle(fontWeight: FontWeight.bold)),
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.white,
              unselectedLabelColor: ColorValue.kLightGrey,
              labelColor: ColorValue.kSecondary,
              tabs: List.generate(statusListLength, (index) {
                final status = historyController.statusList[index];
                final icon = index < statusIcons.length ? statusIcons[index] : Icons.shopping_bag;
                return Tab(
                  text: historyController.formatCategoryName(status),
                  icon: Icon(icon),
                );
              }),
              onTap: (index) {
                historyController.filterOrdersByStatus(historyController.statusList[index]);
              },
            ),
          ),
          body: Obx(() {
            return TabBarView(
              children: historyController.statusList.map((status) {
                final filteredOrders = historyController.filteredOrders;
                if (filteredOrders.isEmpty) {
                  return Center(child: Text('No orders found for $status', style: TextStyle(fontSize: 16, color: Colors.grey)));
                }

                return ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: filteredOrders.length,
                  itemBuilder: (context, index) {
                    final order = filteredOrders[index];

                    return Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(16),
                        title: Text(
                          '${order.products[0].title}',
                          style: TextStyle(fontFamily: "General Sans"),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${formatPrice(order.order.totalPrice)}', style: TextStyle(color: ColorValue.kBlack,fontFamily: "General Sans",fontSize: 16,fontWeight: FontWeight.w600)),
                            SizedBox(height: 4),
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                historyController.formatCategoryName(status),
                                style: TextStyle(color: ColorValue.kPrimary,fontSize: 14,fontFamily: "General Sans"),
                              ),
                            ),
                            IconButton(onPressed: (){
                              historyController.cancelOrder(order.orderHistoryId);
                            }, icon: Icon(Icons.cancel_outlined))
                          ],
                        ),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: order.products.isNotEmpty
                              ? Image.network(order.products.first.image, width: 50, height: 50, fit: BoxFit.cover)
                              : Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
                        ),
                        onTap: () {
                          // Navigasi ke halaman detail order
                          Get.to(OrderDetailPage(historyId: order.orderHistoryId));
                        },
                      ),
                    );
                  },
                );
              }).toList(),
            );
          }),
        ),
      );
    });
  }
}
