import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  late final SharedPreferences prefs;
  RxString username = "".obs;
  RxString email = "".obs;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  var user = Rxn<User>();

  RxBool isLoading = false.obs;

  void getUser() {
    username.value = prefs.getString("username") ?? "";
    email.value = prefs.getString("email") ?? "";
    print(email.value.obs);
  }

  void setUser(User? firebaseUser) {
    user.value = firebaseUser;
  }

  setPreference() async {
    prefs = await SharedPreferences.getInstance();
    getUser();
  }

  @override
  void onInit() {
    super.onInit();
    setPreference();
    FirebaseAuth.instance.authStateChanges().listen((User? firebaseUser) {
      user.value = firebaseUser;
    });
  }

  Future<void> logoutg() async {
    await FirebaseAuth.instance.signOut();
    await googleSignIn.signOut(); // Sign out from Google account
    user.value = null;
    prefs.clear();
    Get.offAllNamed("/login");
  }
}
