import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  late final SharedPreferences prefs;
  RxString username = "".obs;
  RxString imageUrl = "".obs;

  final GoogleSignIn googleSignIn = GoogleSignIn();
  var user = Rxn<User>();
  var selectedImage = ''.obs;
  final ImagePicker _picker = ImagePicker();
  RxBool isLoading = false.obs;

  void getUser() {
    username.value = prefs.getString("username") ?? "";
    imageUrl.value = prefs.getString("imageUrl") ?? "";
    print("Email loaded from prefs: ${username.value}");

  }

  // void setUser(User? firebaseUser) {
  //   user.value = firebaseUser;
  //   if (firebaseUser != null) {
  //     username.value = firebaseUser.displayName ?? "";
  //     email.value = firebaseUser.email ?? "";
  //
  //     prefs.setString("username", username.value);
  //     prefs.setString("email", email.value);
  //
  //     print("ini email ${email}");
  //
  //     if (firebaseUser.photoURL != null) {
  //       imageUrl.value = firebaseUser.photoURL!;
  //       prefs.setString("imageUrl", imageUrl.value);
  //     }
  //
  //     update();
  //   }
  // }

  setPreference() async {
    prefs = await SharedPreferences.getInstance();
    getUser();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    setPreference();
    FirebaseAuth.instance.authStateChanges().listen((User? firebaseUser) {
      if (firebaseUser != null) {
        setUser(firebaseUser);
      }
    });
  }

  Future<void> logoutg() async {
    try {
      isLoading(true);

      await FirebaseAuth.instance.signOut();
      await googleSignIn.signOut();

      await prefs.clear();

      user.value = null;
      username.value = "";
      imageUrl.value = "";

      update();

      Get.offAllNamed("/login");
    } catch (e) {
      print("Error during logout: $e");
    } finally {
      isLoading(false);
    }
  }

  void reloadProfile() async {
    setPreference();
  }

  void setUser(User? firebaseUser) {
    user.value = firebaseUser;
    if (firebaseUser != null) {
      username.value = firebaseUser.displayName ?? "";

      prefs.setString("username", username.value);

      print("Email set in setUser: ${username.value}");

      if (firebaseUser.photoURL != null) {
        imageUrl.value = firebaseUser.photoURL!;
        prefs.setString("imageUrl", imageUrl.value);
      }

      update();
    }
  }


}
