import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailController extends GetxController{

  dynamic argumentData = Get.arguments;
  var isBookmarkClicked = false.obs;

  @override

  void toggleBookmark() {
    isBookmarkClicked.value = !isBookmarkClicked.value;
  }
  void onInit() {
    // print(argumentData[0]["first"]);
    // print(argumentData[0]['first']);
    // print(argumentData[1]['second']);
    super.onInit();
  }
}