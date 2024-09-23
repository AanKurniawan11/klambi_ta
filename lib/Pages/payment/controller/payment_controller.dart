import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/CartOrderResponseModel.dart';

class PaymentController extends GetxController {
  var quantity = 0.obs;
  var size = 'S'.obs;
  var paymeth = ''.obs;
  var shipmeth = ''.obs;
  var selectedIndex = 0.obs;

  Rx<Order?> order = Rx<Order?>(null);
  Rx<Data?> orderData = Rx<Data?>(null);
  Rx<Address?> address = Rx<Address?>(null);
  RxList<Product> produk = <Product>[].obs;

  var isLoading = false.obs;
  var selectedPaymentMethod = Rx<String?>(null);
  late final SharedPreferences prefs;
  final picker = ImagePicker();
  File? selectedImage;
  int? orderId;

  @override
  void onInit() async {
    super.onInit();
    await setPreference();
    await fetchLatestOrder();
  }

  Future<void> setPreference() async {
    prefs = await SharedPreferences.getInstance();
  }
  void selectSize(int index) {
    selectedIndex.value = index;
  }

  Future<void> fetchLatestOrder() async {
    final prefs = await SharedPreferences.getInstance();
    var token = await prefs.getString("token");

    final response = await http.get(
      Uri.parse('https://klambi.ta.rplrus.com/api/orders/latest'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var responseData = ShowOrderResponseModel.fromJson(json.decode(response.body));
      orderData.value = responseData.data;
      orderId = orderData.value?.id;
    } else {
      throw Exception('Failed to load order');
    }
  }

  Future<void> addOrder(int id) async {
    isLoading.value = true;
    var token = await prefs.getString("token");
    final ordersData = {
      'product_id': id,
      'quantity': quantity.value,
      'size': size.value,
    };

    try {
      final response = await http.post(
        Uri.parse('https://klambi.ta.rplrus.com/api/orders/checkout-direct'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(ordersData),
      );

      print(response.body);
      if (response.statusCode == 201) {
        await fetchLatestOrder();
      } else {
        print('Failed to add order: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addPay() async {
    isLoading.value = true;
    if (orderId == null) {
      print('Order ID is not available');
      return;
    }

    var token = await prefs.getString("token");
    final paydata = {
      'order_id': orderId!,
      'payment_method': paymeth.value,
    };

    try {
      final response = await http.post(
        Uri.parse('https://klambi.ta.rplrus.com/api/orders/update-payment-method'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(paydata),
      );

      if (response.statusCode == 200) {
        print('Payment method updated successfully');
        await fetchLatestOrder();
      } else {
        print('Failed to update payment method');
      }
    } catch (e) {
      print('Error updating payment method: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addShipping() async {
    isLoading.value = true;
    if (orderId == null) {
      print('Order ID is not available');
      return;
    }

    var token = await prefs.getString("token");
    final shipdata = {
      'order_id': orderId!,
      'shipping_method': shipmeth.value,
    };

    try {
      final response = await http.post(
        Uri.parse('https://klambi.ta.rplrus.com/api/orders/update-shipping-method'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(shipdata),
      );

      if (response.statusCode == 200) {
        print('Payment method updated successfully');
        await fetchLatestOrder();
      } else {
        print('Failed to update payment method');
      }
    } catch (e) {
      print('Error updating payment method: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addHistory() async {
    isLoading.value = true;
    if (orderId == null) {
      print('Order ID is not available');
      return;
    }

    var token = await prefs.getString("token");
    final historyData = {
      'order_id': orderId!,
      'payment_method': paymeth.value,
      'shipping_method': shipmeth.value,

    };

    try {
      final response = await http.post(
        Uri.parse('https://klambi.ta.rplrus.com/api/orders/history'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(historyData),
      );

      print(response.body);
      if (response.statusCode == 200) {
        print('Order history updated successfully');
      } else {
        print('Failed to update order history');
      }
    } catch (e) {
      print('Error updating order history: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);
      update(); // Untuk memperbarui UI jika diperlukan
    } else {
      Get.snackbar('Error', 'No image selected');
    }
  }

  Future<void> confirmPayment() async {
    if (selectedImage == null) {
      Get.snackbar('Error', 'No image selected for payment proof');
      return;
    }

    if (orderId == null) {
      Get.snackbar('Error', 'Order ID is not available');
      return;
    }

    isLoading.value = true;

    try {
      String url = 'https://klambi.ta.rplrus.com/api/store-payment';
      var request = http.MultipartRequest('POST', Uri.parse(url));

      // Add the image file to the request
      var imageFile = await http.MultipartFile.fromPath(
        'file',
        selectedImage!.path,
        filename: path.basename(selectedImage!.path),
      );
      request.files.add(imageFile);

      // Add order_id as an integer in the request body
      request.fields['order_id'] = orderId.toString(); // Add this if needed in form-data

      // Set authorization header
      var token = await prefs.getString("token");
      request.headers['Authorization'] = 'Bearer $token';

      // Send the request
      var response = await request.send();

      print(response.statusCode);
      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseData);
        if (jsonResponse['success']) {
          Get.snackbar(
            'Success',
            'Payment proof uploaded and order updated successfully',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          fetchLatestOrder();
          // Get.offAllNamed("/payment");
        } else {
          Get.snackbar(
            'Error',
            jsonResponse['message'],
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        Get.snackbar(
          'Error',
          'Failed to upload payment proof. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }}

