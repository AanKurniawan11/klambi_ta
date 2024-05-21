import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailController extends GetxController{

  dynamic argumentData = Get.arguments;
  var isBookmarkClicked = false.obs;

  @override

  void toggleBookmark() {
    isBookmarkClicked.value = !isBookmarkClicked.value;
  }
  // void onInit() {
  //   super.onInit();
  // }
}