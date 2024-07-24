import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/home/allproductresponsemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DetailController extends GetxController{
  late final SharedPreferences prefs;
  dynamic argumentData = Get.arguments;
  var isBookmarkClicked = false.obs;
  String? token = "";
  RxBool isLoading = false.obs;
  late Datum item;


  @override

  void toggleBookmark() {
    isBookmarkClicked.value = !isBookmarkClicked.value;
  }

  var selectedIndex = 0.obs;

  void selectSize(int index) {
    selectedIndex.value = index;
  }

  Future<void> setPreference() async {
    prefs = await SharedPreferences.getInstance();
    token = await prefs.getString("token");
  }

  loadDataProduct(int quantity, String size ) async {
    try {
      isLoading.value = true;

      final response = await http.post(
          Uri.parse("https://klambi.ta.rplrus.com/api/cart/add"),
          body: {
            "quantity": quantity,
            "size": size,
            "product_id": item.id,
          },
          headers: {'Authorization': 'Bearer $token'}
      );
      if (response.statusCode == 200) {
      } else {
        print("Status code: " + response.statusCode.toString());
        print(response.body);
      }
    } catch (e) {
      print("Error: " + e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void onInit() {
    super.onInit();
    setPreference();
  }
}