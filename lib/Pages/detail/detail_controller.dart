import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailController extends GetxController{

  dynamic argumentData = Get.arguments;

  @override
  void onInit() {
    // print(argumentData[0]["first"]);
    // print(argumentData[0]['first']);
    // print(argumentData[1]['second']);
    super.onInit();
  }

}