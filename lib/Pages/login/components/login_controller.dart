import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:klambi_ta/Pages/login/components/login_response_model.dart';
import 'package:klambi_ta/Pages/login/components/toast_message.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  late final SharedPreferences prefs;
  RxBool isLoading = false.obs;
  RxString message = "".obs;
  var user = Rxn<User>();
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  void onInit() {
    super.onInit();
    setPreference();
    FirebaseAuth.instance.authStateChanges().listen((User? firebaseUser) {
      user.value = firebaseUser;
    });
  }

  void setUser(User? firebaseUser) {
    user.value = firebaseUser;
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
      print("Login..");

      if (response.statusCode == 200) {
        LoginResponseModel loginResponseModel = loginResponseModelFromJson(response.body);
            loginResponseModelFromJson(response.body);

        await prefs.setString("username", loginResponseModel.data.name);
        await prefs.setString("email", loginResponseModel.data.email);
        await prefs.setString("token", loginResponseModel.data.token);

        ToastMessage.show("Berhasil login");
        Get.offAllNamed('/navbar');  // Navigate to the main screen
        await prefs.getString("username");
        await prefs.getString("email");
        await prefs.getString("token");

        ToastMessage.show("berhasil login");
        Get.offAllNamed('/navbar'); // Navigate to the main screen
      } else {
        message.value = "Username atau Password salah : ${response.statusCode}";
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
    await FirebaseAuth.instance.signOut();
    await googleSignIn.signOut(); // Sign out from Google account
    user.value = null;
    Get.offAllNamed('/login');
  }
}
