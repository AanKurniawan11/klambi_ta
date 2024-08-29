import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:klambi_ta/Pages/history/components/history_controller.dart';
import 'package:klambi_ta/Pages/payment/components/paymentmethodemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../history/page/testcontroller.dart';
import '../components/AddHistoryresponsemodel.dart';
import '../components/AddResponseModel.dart';
import '../components/CartOrderResponseModel.dart';

class PaymentController extends GetxController {
  var quantity = 0.obs;
  var size = 'S'.obs;
  var paymeth = ''.obs;
  var selectedIndex = 0.obs;
  Rx<Order?> order = Rx<Order?>(null);
  Rx<Data?> orderData = Rx<Data?>(null);
  var isLoading = false.obs; // State loading
  var selectedPaymentMethod = Rx<String?>(null);
  late final SharedPreferences prefs;
  final HistoryController controller = Get.put(HistoryController());
  int? orderId;

  @override
  void onInit() async {
    super.onInit();
    await setPreference();
    await fetchOrderData(); // Fetch order data to get order ID
  }

  void setPaymentMethod(String method) {
    selectedPaymentMethod.value = method;
  }

  bool isPaymentMethodSelected() {
    return selectedPaymentMethod.value != null;
  }

  Future<void> setPreference() async {
    prefs = await SharedPreferences.getInstance();
  }

  void selectSize(int index) {
    selectedIndex.value = index;
  }

  Future<void> addOrder(int id) async {
    isLoading.value = true; // Set loading to true
    var token = await prefs.getString("token");
    final ordersData = AddOrderponseModel(
      productId: id,
      quantity: quantity.value,
      size: size.value,
    );

    try {
      final response = await http.post(
        Uri.parse('https://klambi.ta.rplrus.com/api/orders/checkout-direct'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(ordersData.toJson()),
      );
      print("ini id saya${orderId}");
      print("ini id saya${response.body}");
      print("ini id saya${response.statusCode}");
      if (response.statusCode == 201) {
        print('Order successful: ${response.body}');
        await fetchOrderData(); // Fetch updated order data after adding
      } else {
        print('Failed to add order: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false; // Set loading to false
    }
  }

  Future<void> addPay() async {
    isLoading.value = true; // Set loading to true
    if (orderId == null) {
      print('Order ID is not available');
      return;
    }

    var token = await prefs.getString("token");
    final paydata = PayresponseModel(
      orderId: orderId!,
      paymentMethod: paymeth.value,
    );

    try {
      final response = await http.post(
        Uri.parse('https://klambi.ta.rplrus.com/api/orders/update-payment-method'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(paydata.toJson()),
      );

      // print('Payment method update response status: ${response.statusCode}');
      // print('Payment method update response body: ${response.body}');

      if (response.statusCode == 200) {
        print('Payment method updated successfully');
        await fetchOrderData(); // Fetch updated order data after updating
      } else {
        print('Failed to update payment method');
      }
    } catch (e) {
      print('Error updating payment method: $e');
    } finally {
      isLoading.value = false; // Set loading to false
    }
  }

  Future<void> addHistory() async {
    isLoading.value = true; // Set loading to true
    if (orderId == null) {
      print('Order ID is not available');
      isLoading.value = false; // Ensure loading is set to false if no orderId
      return;
    }

    var token = await prefs.getString("token");
    final paydata = AddHistoryResponseModel(
      orderId: orderId!,
    );

    try {
      final response = await http.post(
        Uri.parse('https://klambi.ta.rplrus.com/api/orders/history'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(paydata.toJson()), // Convert model to JSON and set body
      );

      print(response.body);
      print("Order ID: ${orderId}");

      if (response.statusCode == 200) {
        print('History added successfully: ${response.body}');
        await fetchOrderData(); // Fetch updated order data after adding history
      } else {
        print('Failed to add history: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false; // Set loading to false
    }
  }

  Future<void> orderfromCart() async {
    isLoading.value = true; // Set loading to true
    var token = await prefs.getString("token");
    try {
      final response = await http.post(
        Uri.parse('https://klambi.ta.rplrus.com/api/carts/checkout-from-cart'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print(response.body);
      if (response.statusCode == 201) {
        print('Order from cart added successfully: ${response.body}');
        await fetchOrderData(); // Fetch updated order data after adding history
      } else {
        print('Failed to add cart order: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false; // Set loading to false
    }
  }

  Future<void> cancelorder() async {
    isLoading.value = true; // Set loading to true
    if (orderId == null) {
      print('Order ID is not available');
      return;
    }

    var token = await prefs.getString("token");
    try {
      final response = await http.delete(
        Uri.parse('https://klambi.ta.rplrus.com/api/order-history/$orderId/cancel'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        print('History added successfully: ${response.body}');
        await controller.fetchOrderHistory(); // Fetch updated order data after adding history
      } else {
        print('Failed to add history: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false; // Set loading to false
    }
  }

  Future<void> fetchOrderData() async {
    isLoading.value = true; // Set loading to true
    var token = await prefs.getString("token");
    String url = 'https://klambi.ta.rplrus.com/api/orders/latest';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print("Response: ${response.body}");

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);

        // Sesuaikan parsing JSON berdasarkan model terbaru
        ShowOrderResponseModel orderResponse = ShowOrderResponseModel.fromJson(jsonResponse);

        orderData.value = orderResponse.data;
        if (orderResponse.data != null && orderResponse.data!.order != null) {
          orderId = orderResponse.data!.order!.id; // Ambil order ID dari model
          order.value = orderResponse.data!.order; // Update order jika ada
        } else {
          print("Order data is null or order is not found");
        }
      } else {
        print("Failed to fetch order data: ${response.statusCode}");
        orderData.value = null; // Handle error case
      }
    } catch (e) {
      print("Error fetching order data: $e");
      orderData.value = null; // Handle exception case
    } finally {
      isLoading.value = false; // Set loading to false
    }
  }
}
