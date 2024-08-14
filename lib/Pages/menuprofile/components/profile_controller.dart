import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfileController extends GetxController {
  late final SharedPreferences prefs;
  RxString username = "".obs;
  RxString email = "".obs;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  var user = Rxn<User>();
  var selectedImage = ''.obs; // Menggunakan RxString untuk gambar yang dipilih
  var name = "".obs;
  var image = "".obs;

  final ImagePicker _picker = ImagePicker();
  RxBool isLoading = false.obs;

  void getUser() {
    username.value = prefs.getString("username") ?? "";
    email.value = prefs.getString("email") ?? "";
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
      if (firebaseUser != null) {
        // Set user details after login
        username.value = firebaseUser.displayName ?? "";
        email.value = firebaseUser.email ?? "";
      }
    });
  }

  Future<void> logoutg() async {
    try {
      isLoading(true); // Menampilkan indikator loading

      // Logout dari Firebase dan Google
      await FirebaseAuth.instance.signOut();
      await googleSignIn.signOut();

      // Hapus data pengguna dari SharedPreferences
      await prefs.clear();

      // Reset state pengguna
      user.value = null;
      username.value = "";
      email.value = "";
      selectedImage.value = "";

      // Memuat ulang halaman login
      Get.offAllNamed("/login");
    } catch (e) {
      print("Error during logout: $e");
    } finally {
      isLoading(false); // Sembunyikan indikator loading setelah logout
    }
  }

  // Tambahkan metode untuk memuat ulang data profil
  void reloadProfile() async {
    setPreference();
    update();
  }
}
