import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:klambi_ta/Pages/history/components/showOrderModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryController extends GetxController {
  RxList<Datum> showAll = <Datum>[].obs;
  RxInt selectedIndex = 0.obs;
  late final SharedPreferences prefs;
  RxBool isLoading = false.obs;


  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    isLoading.value = true;
    try {
      prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token'); // Ambil token dari SharedPreferences
      final response = await http.get(
        Uri.parse('https://klambi.ta.rplrus.com/api/orders'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token', // Sertakan token dalam header
        },
      );

      if (response.statusCode == 200) {
        final showOrderModel = showOrderModelFromJson(response.body);
        showAll.value = showOrderModel.data;
      } else {
        Get.snackbar("Error", "Failed to fetch orders: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch orders: $e");
    } finally {
      isLoading.value = false;
    }
  }

}


