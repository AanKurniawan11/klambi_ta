import 'package:get/get.dart';
import 'package:klambi_ta/Pages/login/toast_message.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  late final SharedPreferences prefs;
  RxBool isLoading = false.obs;
  RxString message = "".obs;

  @override
  void onInit() {
    super.onInit();
    setPreference();
  }

  Future<void> setPreference() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> loginAction(String email, String password) async {
    print('LOGIN...');
    if (email.isEmpty || password.isEmpty) {
      message.value = "Fields cannot be empty";
      ToastMessage.show(message.value);
      return;
    }

    try {
      isLoading.value = true;

      final url = Uri.parse("https://klambi.ta.rplrus.com/api/login");
      final body = {"email": email, "password": password};
      final response = await http.post(url, body: body);

      if (response.statusCode == 200) {
        // Assuming the response body contains a token
        final responseData = response.body;  // Parse JSON if needed
        // Save token or necessary information to SharedPreferences
        await prefs.setString("username", email);
        // Assuming the token is in responseData["token"]
        // await prefs.setString("token", responseData["token"]);

        ToastMessage.show("berhasil login");
        Get.offAllNamed('/navbar');  // Navigate to the main screen
      } else {
        message.value = "Login failed: ${response.statusCode}";
        ToastMessage.show(message.value);
      }
    } catch (e) {
      message.value = "An error occurred";
      ToastMessage.show(message.value);
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> checkIfLoggedIn() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('username');
  }

  Future<void> logout() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed('/login');
  }
}
