import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:klambi_ta/Pages/home/components/allproductresponsemodel.dart';
import 'package:klambi_ta/Pages/payment/components/paymentmethodemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/AddResponseModel.dart';
import '../components/CartOrderResponseModel.dart';

class PaymentController extends GetxController {
  var quantity = 0.obs;
  var size = 'S'.obs;
  var paymeth = ''.obs;
  var selectedIndex = 0.obs;
  Rx<Order?> order = Rx<Order?>(null);
  Rx<Data?> orderData = Rx<Data?>(null);
  Datum? selectedProduct;
  var isLoading = false.obs;
  late final SharedPreferences prefs;
  int? orderId;

  @override
  void onInit() async {
    super.onInit();
    await setPreference();
    await fetchOrderData(); // Fetch order data to get order ID
  }

  Future<void> setPreference() async {
    prefs = await SharedPreferences.getInstance();
  }

  void selectSize(int index) {
    selectedIndex.value = index;
  }

  Future<void> addOrder(int id) async {
    var token = await prefs.getString("token");
    final ordersData = AddresponseModel(
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
      if (response.statusCode == 201) {
        print('Order successful: ${response.body}');
        await fetchOrderData(); // Fetch updated order data after adding
      } else {
        print('Failed to add order: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> addPay() async {
    if (orderId == null) {
      print('Order ID is not available');
      return;
    }

    var token = await prefs.getString("token");
    final paydata = PayresponseModel(
      paymentMethod: paymeth.value,
    );

    try {
      final response = await http.post(
        Uri.parse('https://klambi.ta.rplrus.com/api/orders/$orderId/update-payment-method'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(paydata.toJson()),
      );

      if (response.statusCode == 200) {
        print('Payment method updated: ${response.body}');
        // Fetch updated order data to reflect any changes
        await fetchOrderData();
      } else {
        print('Failed to update payment method: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  Future<void> addHistory() async {
    if (orderId == null) {
      print('Order ID is not available');
      return;
    }

    var token = await prefs.getString("token");
    try {
      final response = await http.post(
        Uri.parse('https://klambi.ta.rplrus.com/api/orders/$orderId/history'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        print('History added successfully: ${response.body}');
        await fetchOrderData(); // Fetch updated order data after adding history
      } else {
        print('Failed to add history: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
  Future<void> orderfromCart() async {
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
        print('oreder from cart added successfully: ${response.body}');
        await fetchOrderData(); // Fetch updated order data after adding history
      } else {
        print('Failed to add cart order: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchOrderData() async {
    var token = await prefs.getString("token");
    String url = 'https://klambi.ta.rplrus.com/api/orders/latest';
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
      ShowOrderResponseModel orderResponse = ShowOrderResponseModel.fromJson(jsonResponse);

      // Update orderData with data retrieved
      orderData.value = orderResponse.data;
      // Retrieve order ID from model
      if (orderResponse.data != null) {
        orderId = orderResponse.data!.order?.id; // Get order ID from data
        order.value = orderResponse.data!.order; // Update order if necessary
      }
    } else {
      print("Failed to fetch order data: ${response.statusCode}");
      orderData.value = null; // Handle error case
    }
  }
}
