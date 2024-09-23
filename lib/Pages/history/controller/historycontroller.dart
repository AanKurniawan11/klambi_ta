import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/history/components/ratingmodelresponse.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../Common/colors/color.dart';
import '../components/showRatingResponsemodel.dart';
import '../page/detailOrder/showdetailordermodel.dart';
import '../components/modeltest1.dart';
import '../components/modeltest2.dart';

class HistoryController extends GetxController {
  late SharedPreferences prefs;
  var isLoading = true.obs;
  var orderHistoryList = <Datum>[].obs; // Menyesuaikan dengan model Datum
  var statusList = <String>[].obs;
  var selectedStatus = 'sedang_dikemas'.obs;
  var rating = 0.obs;
  var komen = 'udah ada'.obs;
  var id = 0.obs;
  var selectedOrderDetail = Rxn<Data>();
  var ratingku = Rxn<Datas>();
  String formatCategoryName(String status) {
    return status.replaceAll('_', ' ');
  }

  @override
  void onInit() {
    fetchStatuses();
    fetchOrderHistory();
    super.onInit();
  }

  Future<void> initializePrefs() async {
    prefs = await SharedPreferences.getInstance();
    fetchStatuses();
    fetchOrderHistory();
  }
  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    return token;
  }

  void fetchStatuses() async {
    isLoading.value = true;
    try {
      final token = await _getToken();
      final response = await http.get(
        Uri.parse('https://klambi.ta.rplrus.com/api/statuses'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final statusResponse = StatusResponse.fromJson(jsonDecode(response.body));
        if (statusResponse.status) {
          statusList.value = statusResponse.data;
        }
      } else {
        print('Failed to load statuses ${response.statusCode}');
      }
    } catch (e) {
      print("Error fetching statuses: $e");
    }finally{
      isLoading.value = false;

    }
  }

  Future<void> fetchOrderHistory() async {
    isLoading.value = true;
    try {
      final token = await _getToken();
      final response = await http.get(
        Uri.parse('https://klambi.ta.rplrus.com/api/order/user/history'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final orderHistoryResponse = OrderHistoryResponse.fromJson(jsonDecode(response.body));
        if (orderHistoryResponse.success) {
          orderHistoryList.value = orderHistoryResponse.data;
        }
      } else {
        print('Failed to load statuses ${response.statusCode}');
      }
    } catch (e) {
      print("Error fetching order history: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchOrderDetail(int historyId) async {
    try {
      final token = await _getToken();
      final response = await http.get(
        Uri.parse('https://klambi.ta.rplrus.com/api/order/show/history/$historyId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final detailOrderResponse = DetailOrderModel.fromJson(jsonDecode(response.body));
        if (detailOrderResponse.success) {
          selectedOrderDetail.value = detailOrderResponse.data;
        }
      } else {
        print('Failed to load statuses ${response.statusCode}');
      }
    } catch (e) {
      print("Error fetching order detail: $e");
    }
  }
  Future<void> cancelOrder(int historyId) async {
    try {
      final token = await _getToken();
      final response = await http.delete(
        Uri.parse('https://klambi.ta.rplrus.com/api/order-history/$historyId/cancel'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
      } else {
        print('Failed to load detail ${response.statusCode}');
      }
    } catch (e) {
      print("Error fetching order detail: $e");
    }
  }

  List<Datum> get filteredOrders {
    if (selectedStatus.value.isEmpty) {
      return orderHistoryList;
    }
    return orderHistoryList.where((order) => order.order.status == selectedStatus.value).toList();
  }

  void filterOrdersByStatus(String status) {
    selectedStatus.value = status;
  }

  void fetchDetailsForSelectedOrder(Datum selectedOrder) {
    final historyId = selectedOrder.order.id;
    if (historyId != null) {
      fetchOrderDetail(historyId);
    } else {
      print('Invalid history ID');
    }
  }

  Future<void> addrate(int productId) async {
    isLoading.value = true;
    final token = await _getToken();
    final ratingData = AddRatingModel(
      productId: productId,
      rating: rating.value,
      review: komen.value,
    );
    try {
      final response = await http.post(
        Uri.parse('https://klambi.ta.rplrus.com/api/ratings'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(ratingData.toJson()),
      );

      if (response.statusCode == 200) {
        print('Rating added successfully');
      } else {
        print('Failed to add rating: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar('Error', 'An error occurred while submitting the rating.');
    } finally {
      isLoading.value = false;
    }
  }
  Future<void> showrate(int productId) async {
    isLoading.value = true;
    try {
      final token = await _getToken();
      final response = await http.get(
        Uri.parse('https://klambi.ta.rplrus.com/api/ratings/$productId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final showRatingResponse = ShowRatingModel.fromJson(jsonDecode(response.body));
        if (showRatingResponse.success) {
          // Simpan data rating ke dalam variabel untuk digunakan di UI
          ratingku.value = showRatingResponse.data;
        }
      } else {
        print('Failed to load ratings: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching ratings: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> confirmOrder(int orderId) async {
    isLoading.value = true;
    try {
      final token = await _getToken();
      final response = await http.post(
        Uri.parse('https://klambi.ta.rplrus.com/api/order-history/$orderId/confirm'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        print('Order confirmed successfully');
        Get.snackbar('Success', 'Order has been confirmed');
      } else {
        // Jika gagal, tampilkan pesan error atau log error
        print('Failed to confirm order: ${response.statusCode}');
        Get.snackbar('Error', 'Failed to confirm order.');
      }
    } catch (e) {
      print('Error confirming order: $e');
      Get.snackbar('Error', 'An error occurred while confirming the order.');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> showRatingDialog(
      BuildContext context,
      int productId,
      HistoryController controller,
      ) async {
    final TextEditingController commentController = TextEditingController();
    int selectedRating = controller.rating.value;

    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            'Beri Rating',
            style: TextStyle(
              fontFamily: 'General Sans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Nilai produk ini:',
                style: TextStyle(
                  fontFamily: 'General Sans',
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: Icon(
                      Icons.star,
                      color: index < selectedRating
                          ? Colors.amber
                          : Colors.grey[300],
                      size: 30,
                    ),
                    onPressed: () {
                      selectedRating = index + 1;
                      controller.rating.value = selectedRating;
                      (dialogContext as Element).markNeedsBuild();
                    },
                  );
                }),
              ),
              // TextField(
              //   controller: commentController,
              //   maxLines: 3,
              //   decoration: InputDecoration(
              //     hintText: 'Tulis ulasan Anda',
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //   ),
              //   style: TextStyle(
              //     fontFamily: 'General Sans',
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Batal',
                style: TextStyle(
                  fontFamily: 'General Sans',
                  fontSize: 16,
                  color: ColorValue.kDanger,
                ),
              ),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            ElevatedButton(
              child: Text(
                'Kirim',
                style: TextStyle(
                  fontFamily: 'General Sans',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                controller.addrate(
                  productId,
                  // selectedRating,
                  // commentController.text,
                );
                Navigator.of(dialogContext).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorValue.kPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

}

