import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:klambi_ta/Common/colors/color.dart';
import 'package:klambi_ta/Pages/menuprofile/components/menu_item.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/address/controller/address_controller.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/edit/controller/edit_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  late final SharedPreferences prefs;
  RxString username = "".obs;
  RxString email = "".obs;
  RxString imageUrl = "".obs;

  final GoogleSignIn googleSignIn = GoogleSignIn();
  var user = Rxn<User>();
  var selectedImage = ''.obs;
  final ImagePicker _picker = ImagePicker();
  RxBool isLoading = false.obs;

  void getUser() {
    username.value = prefs.getString("username") ?? "";
    email.value = prefs.getString("email") ?? "";
    imageUrl.value = prefs.getString("imageUrl") ?? "";
  }

  void setUser(User? firebaseUser) {
    user.value = firebaseUser;
    if (firebaseUser != null) {
      username.value = firebaseUser.displayName ?? "";
      email.value = firebaseUser.email ?? "";

      prefs.setString("username", username.value);
      prefs.setString("email", email.value);

      if (firebaseUser.photoURL != null) {
        imageUrl.value = firebaseUser.photoURL!;
        prefs.setString("imageUrl", imageUrl.value);
      }

      update();
    }
  }

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
      email.value = "";
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

  Future<void> showLogoutConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          title: Text('Confirm Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorValue.kDanger,
              ),
              child: Text('Log Out'),
              onPressed: () async {
                await logoutg();
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
