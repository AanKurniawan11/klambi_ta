import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'allproductresponsemodel.dart';

class HomeController extends GetxController {
  RxList<Datum> productResponeAll = <Datum>[].obs;
  RxBool isLoading = false.obs;


  @override
  void onInit() {
    super.onInit();
    loadDataAll();
  }

  loadDataAll() async {
    try {
      isLoading.value =  true;

      final response = await http.get(Uri.parse("https://klambi.ta.rplrus.com/api/product"));
      if (response.statusCode == 200) {
        final allProductResponse = allproductResponseModelFromJson(response.body);
        productResponeAll.value = allProductResponse.data;
      } else {
        print("Status code: " + response.statusCode.toString());
      }
    } catch (e) {
      print("Error: " + e.toString());
    }
  }
}
