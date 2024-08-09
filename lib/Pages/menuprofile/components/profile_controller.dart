import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/edit/components/edit_response_model.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/edit/components/show_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  late final SharedPreferences prefs;
  RxString username = "".obs;
  RxString email = "".obs;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  var user = Rxn<User>();
  var selectedImage = ''.obs;
  var name = "".obs;
  var image = "".obs;
  // Rx<Data> profileData = Data(name: '', image: '',).obs;


  final ImagePicker _picker = ImagePicker();
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

  void pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      selectedImage.value = image.path;
    }
  }
  Future<void> EditPtofile() async {
    var token = await prefs.getString("token");

    // final Edit = Data(
    //     name: name.value,
    //     image: image.value);

    final response = await http.post(
      Uri.parse('https://klambi.ta.rplrus.com/api/profile'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      // body: jsonEncode(Edit.toJson()),
    );

    if (response.statusCode == 200) {

      print('Token: $token'); // Debugging untuk memastikan token ada
      print('Response body: ${response.body}'); // Debugging
    } else {
      print('Token: $token'); // Debugging untuk memastikan token ada
      print('Response body: ${response.body}'); // Debugging untuk memeriksa respon
    }
  }
  // Future<void> ShowUserProfile() async {
  //   var token = await prefs.getString("token");
  //
  //   final response = await http.get(
  //     Uri.parse('https://klambi.ta.rplrus.com/api/showProfile'),
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Bearer $token'
  //     },
  //   );
  //
  //
  //   if (response.statusCode == 200) {
  //
  //     ShowProfile test = showProfileFromJson(response.body);
  //     // profileData.value = test.data ;
  //
  //     print('Token: $token'); // Debugging untuk memastikan token ada
  //     print('Response body: ${response.body}'); // Debugging
  //   } else {
  //     print('Token: $token'); // Debugging untuk memastikan token ada
  //     print('Response body: ${response.body}'); // Debugging untuk memeriksa respon
  //   }
  // }

  // Future<void> fetchProfileData() async {
  //   prefs = await SharedPreferences.getInstance();
  //   var token = prefs.getString("token");
  //   // final editdata= Data(
  //   //     name: name.value,
  //   //     image: image.value);
  //   final response = await http.post(
  //     Uri.parse('https://klambi.ta.rplrus.com/api/profile'),
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Bearer $token',
  //     },
  //     // body: jsonDecode(editdata.toString())
  //
  //   );
  //
  //   if (response.statusCode == 200) {
  //     EditProfileModel profile = editProfileModelFromJson(response.body);
  //     // profileData.value = profile.data;
  //   } else {
  //     print("Failed to fetch menuprofile data: ${response.body}");
  //   }
  // }


  // void updateProfileData(String name, String image) {
  //   print(name);
  //   print(image);
  //   profileData.update((val) {
  //     val?.name = name;
  //     val?.image = image;
  //   });
  //   fetchProfileData();
  // }

  Future<void> logoutg() async {
    await FirebaseAuth.instance.signOut();
    await googleSignIn.signOut(); // Sign out from Google account
    user.value = null;
    prefs.clear();
    Get.offAllNamed("/login");
  }
}
