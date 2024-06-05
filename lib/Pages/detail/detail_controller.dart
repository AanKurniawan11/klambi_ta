import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailController extends GetxController{

  dynamic argumentData = Get.arguments;
  var isBookmarkClicked = false.obs;

  @override

  void toggleBookmark() {
    isBookmarkClicked.value = !isBookmarkClicked.value;
  }

  var selectedIndex = 0.obs;

  void selectSize(int index) {
    selectedIndex.value = index;
  }
  // void onInit() {
  //   super.onInit();
  // }
}