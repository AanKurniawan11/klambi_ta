import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'allproductresponsemodel.dart' as product_model;
import 'categoryresponsemodel.dart' as category_model;

class HomeController extends GetxController {
  final RefreshController refreshController = RefreshController(initialRefresh: false);
  RxList<product_model.Datum> productResponseAll = <product_model.Datum>[].obs;
  RxList<String> categoryResponseAll = <String>[].obs;
  RxInt selectedIndex = 0.obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadDataProduct("All");
    loadCategory();
  }

  loadCategory() async {
    try {
      isLoading.value = true;

      final response = await http.get(Uri.parse("https://klambi.ta.rplrus.com/api/products/category/all"));

      if (response.statusCode == 200) {
        final allCategoryResponse = category_model.categoryResponseModelFromJson(response.body);
        categoryResponseAll.value = allCategoryResponse.data;
      } else {
        print("Status code: " + response.statusCode.toString());
      }
    } catch (e) {
      print("Error: " + e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  loadDataProduct(String? category) async {
    try {
      isLoading.value = true;

      String newTemp = "";

      if (category == null) {
        newTemp = "";
      } else if (category != null) {
        newTemp = "category/$category";
      }


      final response = await http.get(Uri.parse("https://klambi.ta.rplrus.com/api/products/$newTemp"));

      if (response.statusCode == 200) {
        final allProductResponse = product_model.allproductResponseModelFromJson(response.body);
        productResponseAll.value = allProductResponse.data;
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

  void refreshList() async {
    await loadDataProduct(selectedIndex.value == 0 ? null : categoryResponseAll[selectedIndex.value]);
    refreshController.refreshCompleted();
  }

  String imageUrl(String path) {
    final baseUrl = 'https://klambi.ta.rplrus.com/storage/';
    return '$baseUrl$path';
  }
}
