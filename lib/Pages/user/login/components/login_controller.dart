import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:klambi_ta/Pages/menuprofile/components/profile_controller.dart';
import 'package:klambi_ta/Pages/user/login/components/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart'; // Tambahkan ini untuk menggunakan Colors dan EdgeInsets

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

  Future<void> loginAction(String username, String password) async {
    if (username.isEmpty) {
      showStyledSnackbar("Username tidak boleh kosong");
      return;
    }

    if (password.isEmpty) {
      showStyledSnackbar("Password tidak boleh kosong");
      return;
    }

    try {
      // isLoading.value = true;
      final url = Uri.parse("https://klambi.ta.rplrus.com/api/login");
      final body = {"username": username, "password": password};

      final response = await http.post(
        url,
        body: body,
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        LoginResponseModel loginResponseModel =
        loginResponseModelFromJson(response.body);
        onLoginSuccess(loginResponseModel);
        print("skdjs"+ response.body);
        Get.offNamed("/navbar");
      } else {
        showStyledSnackbar("Username atau Password salah: ${response.statusCode}");
      }
    } catch (e) {
      showStyledSnackbar("Terjadi kesalahan, silakan coba lagi");
    }
    // finally {
    //   isLoading.value = false;
    // }
  }

  Future<void> logoutAction() async {
    try {
      // Ambil token yang disimpan
      String? savedToken = await prefs.getString("token");

      // Menandakan bahwa proses logout sedang berlangsung
      isLoading.value = true;

      final url = Uri.parse("https://klambi.ta.rplrus.com/api/logout");

      // Kirim permintaan logout
      final response = await http.post(
        url,
        headers: {'Authorization': 'Bearer $savedToken'},
      );

      print(response.body);
      if (response.statusCode == 200) {
        // Menghapus semua data pengguna yang disimpan di SharedPreferences
        await prefs.remove("username");
        await prefs.remove("name");
        await prefs.remove("image");
        await prefs.remove("token");

        // Logout dari Firebase dan Google Sign-In
        await FirebaseAuth.instance.signOut();
        await googleSignIn.signOut();

        // Set user menjadi null
        setUser(null);

        // Tampilkan snackbar sukses
        showStyledSnackbar("Logout berhasil");
      } else {
        showStyledSnackbar("Gagal logout: ${response.statusCode}");
      }
    } catch (e) {
      showStyledSnackbar("Terjadi kesalahan, silakan coba lagi");
      print(e);
    } finally {
      // Pastikan isLoading di-set menjadi false setelah proses logout
      isLoading.value = false;
    }
  }

  void onLoginSuccess(LoginResponseModel loginResponseModel) async {
    await prefs.setString("username", loginResponseModel.data.username);
    await prefs.setString("token", loginResponseModel.data.token);

    profileController.setUser(user.value);

    String? savedToken = await prefs.getString("token");
    print("Token yang disimpan: $savedToken");

    showStyledSnackbar("Berhasil login");

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

  // Function to show styled snackbar
  void showStyledSnackbar(String message) {
    Get.snackbar(
      'Informasi', // Judul
      message, // Pesan
      snackPosition: SnackPosition.TOP, // Posisi Snackbar
      backgroundColor: Colors.blue, // Warna Background
      colorText: Colors.white, // Warna teks
      borderRadius: 10,
      margin: EdgeInsets.all(15),
      duration: Duration(seconds: 3), // Durasi tampilan
      icon: Icon(Icons.info, color: Colors.white), // Ikon di Snackbar
      isDismissible: true, // Snackbar bisa di-dismiss
      forwardAnimationCurve: Curves.easeOutBack, // Animasi munculnya Snackbar
    );
  }
}
