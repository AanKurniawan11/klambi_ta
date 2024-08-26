import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:klambi_ta/Pages/menuprofile/components/profile_controller.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/edit/components/edit_response_model.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/edit/components/show_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class EditController extends GetxController {
  // final controller = Get.put(ProfileController());
  late SharedPreferences prefs;
  var pickedImage = Rxn<File>();
  var imageUrl = Rxn<String>();

  var isLoading = false.obs;
  var userProfile = UserProfile(name: '', email: '', image: '').obs;

  final TextEditingController ctrName = TextEditingController();



  @override
  void onInit() {
    super.onInit();
    loadUserProfile();
    loadImageFromPrefs();
  }


  setPreference() async {
    prefs = await SharedPreferences.getInstance();
    update();
  }


  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      pickedImage.value = File(pickedFile.path);
      imageUrl.value = null;

      // Simpan jalur file gambar ke SharedPreferences
      await prefs.setString('userImage', pickedFile.path);
    }
  }

  Future<void> loadUserProfile() async {
    isLoading(true);
    prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    final response = await http.get(
      Uri.parse('https://klambi.ta.rplrus.com/api/showProfile'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      print(token);
      var data = ShowProfileResponse.fromJson(jsonDecode(response.body)).data;
      userProfile.value = data;
      print(response.body);
    } else {
      print(response.body);
      print('Failed to load profile');
      print(ctrName.value);

    }
    isLoading(false);
  }

  Future<void> updateProfile(String name, File? imageFile) async {
    isLoading(true);
    var token = prefs.getString("token");

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://klambi.ta.rplrus.com/api/profile'),
    );

    request.headers['Authorization'] = 'Bearer $token';
    request.fields['name'] = name;

    if (imageFile != null) {
      var imageStream = http.ByteStream(imageFile.openRead());
      var imageLength = await imageFile.length();
      var multipartFile = http.MultipartFile(
        'image',
        imageStream,
        imageLength,
        filename: imageFile.path.split('/').last,
      );
      request.files.add(multipartFile);
    }

    var response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await http.Response.fromStream(response);
      var updatedData = UpdateProfileResponse.fromJson(jsonDecode(responseData.body)).data;
      userProfile.value = UserProfile(
        name: updatedData.name,
        email: userProfile.value.email,
        image: updatedData.image,
      );
      print('Profile updated successfully');
    } else {
      print('Failed to update profile');
    }
    isLoading(false);
  }

  void loadImageFromPrefs() async {
    prefs = await SharedPreferences.getInstance();
    var savedImagePath = prefs.getString('userImage');
    if (savedImagePath != null && savedImagePath.isNotEmpty) {
      pickedImage.value = File(savedImagePath); // Load image from file
    }
  }
}