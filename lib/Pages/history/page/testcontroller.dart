import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'detailOrder/showdetailordermodel.dart';
import 'modeltest1.dart';
import 'modeltest2.dart';

class HistoryController extends GetxController {
  var isLoading = true.obs;
  var orderHistoryList = <Datum>[].obs; // Menyesuaikan dengan model `Datum`
  var statusList = <String>[].obs;
  var selectedStatus = ''.obs;
  var selectedOrderDetail = Rxn<Data>();
  String formatCategoryName(String status) {
    return status.replaceAll('_', ' ');
  }

  @override
  void onInit() {
    fetchStatuses();
    fetchOrderHistory();
    super.onInit();
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
        print('Failed to load statuses');
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

      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final orderHistoryResponse = OrderHistoryResponse.fromJson(jsonDecode(response.body));
        if (orderHistoryResponse.success) {
          orderHistoryList.value = orderHistoryResponse.data;
        }
      } else {
        print('Failed to load order history');
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
      print(response.body);
      if (response.statusCode == 200) {
        final detailOrderResponse = DetailOrderModel.fromJson(jsonDecode(response.body));
        if (detailOrderResponse.success) {
          selectedOrderDetail.value = detailOrderResponse.data;
        }
      } else {
        print(response.body);
        print(response.statusCode);
        print('Failed to load order detail');
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
      print(response.body);
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print('Failed to load order detail');
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

  // Method to fetch details for a specific order from the order history list
  void fetchDetailsForSelectedOrder(Datum selectedOrder) {
    final historyId = selectedOrder.order.id;
    if (historyId != null) {
      fetchOrderDetail(historyId);
    } else {
      print('Invalid history ID');
    }
  }
}
