import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'models/allproductresponsemodel.dart' as product_model;
import 'models/OversizeResponseModel.dart' as product_category;
import 'models/categoryresponsemodel.dart' as category_model;

class HomeController extends GetxController {
  RxList<product_model.Datum> productResponseAll = <product_model.Datum>[].obs;
  RxList<String> categoryResponseAll = <String>[].obs;
  RxList<product_category.Datum> categoryResponseOversize = <product_category.Datum>[].obs;


  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadDataBaju(null);
    loadCategory();
  }

  loadCategory() async {
    try {
      isLoading.value = true;

      final response = await http.get(Uri.parse("https://klambi.ta.rplrus.com/api/product/category/all"));
      if (response.statusCode == 200) {
        final allCategoryResponse = category_model.categoryResponseModelFromJson(response.body);
        categoryResponseAll.value = allCategoryResponse;
      } else {
        print("Status code: " + response.statusCode.toString());
      }
    } catch (e) {
      print("Error: " + e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  loadDataBaju(String? category) async {

    try {
      isLoading.value = true;

      String newTemp = "";


      if(category == null){
        newTemp = "";
      }else if(category != null){
        newTemp = "category/$category";
      }

      final response = await http.get(Uri.parse("https://klambi.ta.rplrus.com/api/product/$newTemp"));
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

  loadDataAll(String? category) async {
    try {
      isLoading.value = true;

      final response = await http.get(Uri.parse("https://klambi.ta.rplrus.com/api/product/category/${category ?? 'all'}"));
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

  // loadDataOversize() async {
  //   try {
  //     isLoading.value = true;
  //
  //     final response = await http.get(Uri.parse("https://klambi.ta.rplrus.com/api/product/category/Oversize"));
  //     if (response.statusCode == 200) {
  //       final OversizeProductResponse = .oversizeResponseModelFromJson(response.body);
  //       categoryResponseOversize.value = OversizeProductResponse.data;
  //     } else {
  //       print("Status code: " + response.statusCode.toString());
  //       print(response.body);
  //
  //     }
  //   } catch (e) {
  //     print("Error: " + e.toString());
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  // loadDataLPendek(String category) async {
  //   try {
  //     isLoading.value = true;
  //
  //     final response = await http.get(Uri.parse("https://klambi.ta.rplrus.com/api/product/category/Lengan%20pendek"));
  //     if (response.statusCode == 200) {
  //       final allProductResponse = product_model.allproductResponseModelFromJson(response.body);
  //       productResponseAll.value = allProductResponse.data;
  //     } else {
  //       print("Status code: " + response.statusCode.toString());
  //       print(response.body);
  //
  //     }
  //   } catch (e) {
  //     print("Error: " + e.toString());
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
  //
  // loadDataLPanjang(String category) async {
  //   try {
  //     isLoading.value = true;
  //
  //     final response = await http.get(Uri.parse("https://klambi.ta.rplrus.com/api/product/category/Lengan%20panjang"));
  //     if (response.statusCode == 200) {
  //       final allProductResponse = product_model.allproductResponseModelFromJson(response.body);
  //       productResponseAll.value = allProductResponse.data;
  //     } else {
  //       print("Status code: " + response.statusCode.toString());
  //       print(response.body);
  //
  //     }
  //   } catch (e) {
  //     print("Error: " + e.toString());
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
}
