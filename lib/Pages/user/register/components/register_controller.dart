import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:klambi_ta/Pages/user/login/components/toast_message.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  RxBool isLoading = false.obs;
  RxString message = "".obs;



  Future<void> registerAction(String username, String email, String password,
      String confirmPassword) async {
    try {
      isLoading.value = true;
      if (username.isEmpty ||
          email.isEmpty ||
          password.isEmpty ||
          confirmPassword.isEmpty) {
        message.value = "Fields cannot be empty";

        isLoading.value = false;
        ToastMessage.show(message.value);
        return;
      }
      if (password != confirmPassword) {
        message.value = "Password and confirmation password do not match";

        isLoading.value = false;
        ToastMessage.show(message.value);
        return;
      }

      final url = Uri.parse("https://klambi.ta.rplrus.com/api/register");
      final body = {
        "name": username,
        "email": email,
        "password": password,
        "confirm_password": confirmPassword,
      };

      print(body);
      final response = await http.post(url, body: body);
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        // final responseData = registerResponseModelFromJson(response.body);
        // message.value = responseData.message;

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('name', username);
        await prefs.setString('email', email);
        print(response.statusCode);

        isLoading.value = false;
        ToastMessage.show("Register berhasil");
        Get.offAllNamed('/login');  // Navigate to the main screen
      } else {
        print(response.statusCode);
        message.value = "Registration failed: ${response.statusCode}";
        ToastMessage.show(message.value);
        isLoading.value = false;
      }
    } catch (e) {
      message.value = "No Internet";
      ToastMessage.show(message.value);
      print(e);
      isLoading.value = false;
    }
  }

  Future<bool> checkIfRegistered() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('username') && prefs.containsKey('email');
  }
}