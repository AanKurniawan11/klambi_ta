import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController{
  late final SharedPreferences prefs;
  RxString username = "".obs;
  RxString email = "".obs;

  void getEmail() {
    email.value = prefs.getString("email") ?? "";
  }
  void getUser() {
    username.value = prefs.getString("username") ?? "";
  }

  setPreference() async {
    prefs = await SharedPreferences.getInstance();
    getUser();
    getEmail();
  }

  @override
  void onInit() {

    super.onInit();
    setPreference();
  }

  void logout() {
    prefs.clear();
    Get.offAllNamed("/login");
  }

}