import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:klambi_ta/Pages/menuprofile/components/profile_controller.dart';
import 'package:klambi_ta/Pages/user/login/components/login_response_model.dart';
import 'package:klambi_ta/Pages/user/login/components/toast_message.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  late final SharedPreferences prefs;
  RxBool isLoading = false.obs;
  RxString message = "".obs;
  var user = Rxn<User>();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  String? token = "";
  final profileController = Get.put(ProfileController());

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
    print(token);
    token = await prefs.getString("token");
    print("token anda" + token.toString());

    if (email.isEmpty || password.isEmpty) {
      message.value = "Fields cannot be empty";
      ToastMessage.show(message.value);
      return;
    }
    try {
      isLoading.value = true;

      final url = Uri.parse("https://klambi.ta.rplrus.com/api/login");
      final body = {"email": email, "password": password};

      final response = await http.post(
        url,
        body: body,
        headers: {'Authorization': 'Bearer $token'},
      );
      print(response.body);
      print("ini email ${email}");

      if (response.statusCode == 200) {
        LoginResponseModel loginResponseModel = loginResponseModelFromJson(response.body);

        onLoginSuccess(loginResponseModel);
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
  Future<void> logoutAction() async {
    try {
      isLoading.value = true;

      final url = Uri.parse("https://klambi.ta.rplrus.com/api/logout");

      final response = await http.post(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );

      print(response.body);
      if (response.statusCode == 200) {
        // Hapus data dari SharedPreferences
        await prefs.remove("username");
        await prefs.remove("email");
        await prefs.remove("token");

        // Logout dari Firebase Authentication jika diperlukan
        await FirebaseAuth.instance.signOut();
        await googleSignIn.signOut();

        // Set nilai user menjadi null
        setUser(null);

        // Navigasi ke halaman login atau halaman lainnya setelah logout
        Get.offAllNamed('/login');

        print("Logout berhasil");
      } else {
        message.value = "Gagal logout: ${response.statusCode}";
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
  

  void onLoginSuccess(LoginResponseModel loginResponseModel) async {
    await prefs.setString("username", loginResponseModel.data.name);
    await prefs.setString("email", loginResponseModel.data.email);
    await prefs.setString("token", loginResponseModel.data.token);


    profileController.setUser(user.value);

    String? savedToken = await prefs.getString("token");
    print("Token yang disimpan: $savedToken");
    ToastMessage.show("Berhasil login");

    Get.offAllNamed('/navbar');
  }

  Future<void> saveUserId(int userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('user_id', userId);
  }

  Future<bool> checkIfLoggedIn() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('username') || FirebaseAuth.instance.currentUser != null;
  }

}
