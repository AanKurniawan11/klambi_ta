import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  RxBool isLoading = false.obs;
  RxString message = "".obs;

  Future<void> registerAction(
      String username, String name, String password, String confirmPassword) async {
    if (username.isEmpty || name.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      showStyledSnackbar("Error", "Fields cannot be empty", Colors.red);
      return;
    }

    if (password != confirmPassword) {
      showStyledSnackbar("Error", "Password and confirmation password do not match", Colors.red);
      return;
    }

    try {
      isLoading.value = true;
      final url = Uri.parse("https://klambi.ta.rplrus.com/api/register");

      final body = {
        "username": username,
        "name": name,
        "password": password,
        "confirm_password": confirmPassword,
      };

      final response = await http.post(url, body: body);

      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('username', username);

        showStyledSnackbar("Success", "Daftar Berhasil", Colors.green);
        Get.offAllNamed('/login');  // Arahkan ke layar login
      } else {
        showStyledSnackbar("Error", "Daftar Gagal: ${response.statusCode}", Colors.red);
      }
    } catch (e) {
      showStyledSnackbar("Error", "No Internet", Colors.red);
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> checkIfRegistered() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('username') && prefs.containsKey('name');
  }

  void showStyledSnackbar(String title, String message, Color backgroundColor) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: backgroundColor,
      colorText: Colors.white,
      borderRadius: 10,
      margin: EdgeInsets.all(15),
      duration: Duration(seconds: 3),
      icon: Icon(
        backgroundColor == Colors.red ? Icons.error : Icons.check,
        color: Colors.white,
      ),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
