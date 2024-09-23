import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/edit/components/edit_response_model.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/edit/components/show_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class EditController extends GetxController {
  late SharedPreferences prefs;
  var pickedImage = Rxn<File>();
  var imageUrl = Rxn<String>();
  var isImageValid = true.obs; // Menyimpan status validasi ukuran gambar


  var isLoading = false.obs;
  var userProfile = Data(name: '', image: '').obs; // Perbarui ini

  final TextEditingController ctrName = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  Future<void> _initialize() async {
    prefs = await SharedPreferences.getInstance();
    loadUserProfile();
    loadImageFromPrefs();
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final selectedImage = File(pickedFile.path);
      final imageLength = await selectedImage.length();

      if (imageLength <= 2048 * 1024) { // 2 MB
        pickedImage.value = selectedImage;
        imageUrl.value = null;
        await prefs.setString('userImage', pickedFile.path);
        isImageValid.value = true; // Gambar valid
      } else {
        // Tampilkan pesan kesalahan jika ukuran melebihi 2 MB
        Get.snackbar(
          "Ukuran Gambar Terlalu Besar",
          "Silakan pilih gambar dengan ukuran maksimal 2 MB.",
          snackPosition: SnackPosition.BOTTOM,
        );
        pickedImage.value = null; // Reset pickedImage
        isImageValid.value = false; // Gambar tidak valid
      }
    }
  }

  Future<void> loadUserProfile() async {
    _setLoading(true);
    try {
      final token = await _getToken();
      final response = await http.get(
        Uri.parse('https://klambi.ta.rplrus.com/api/showProfile'),
        headers: _getHeaders(token!),
      );

      print("ini show"+response.body);
      if (response.statusCode == 200) {
        final data = ShowProfileResponse.fromJson(jsonDecode(response.body)).data;
        userProfile.value = data;
      } else {
        _handleErrorResponse(response);
      }
    } catch (e) {
      _handleException(e);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> updateProfile(String name, File? imageFile) async {
    _setLoading(true);
    try {
      final token = await _getToken();
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('https://klambi.ta.rplrus.com/api/profile'),
      );

      request.headers['Authorization'] = 'Bearer $token';
      request.fields['name'] = name;

      // Validasi ukuran file gambar
      if (imageFile != null) {
        final imageLength = await imageFile.length();
        if (imageLength > 2048 * 1024) {  // Batas ukuran 2MB
          Get.snackbar("Gagal", "gambar minimal 2 mb");
          return;
        }

        final imageStream = http.ByteStream(imageFile.openRead());
        final multipartFile = http.MultipartFile(
          'image',
          imageStream,
          imageLength,
          filename: imageFile.path.split('/').last,
        );
        request.files.add(multipartFile);
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      print("ini update: " + response.body);

      if (response.statusCode == 200) {
        final updatedData = UpdateProfileResponse.fromJson(jsonDecode(response.body)).data;
        userProfile.value = Data(
          name: updatedData.name,
          image: updatedData.image,
        );
        loadUserProfile();  // Memuat ulang profil setelah update berhasil
      } else {
        _handleErrorResponse(response);  // Menggunakan response yang sudah dalam bentuk http.Response
      }
    } catch (e) {
      _handleException(e);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> loadImageFromPrefs() async {
    final savedImagePath = prefs.getString('userImage');
    if (savedImagePath != null && savedImagePath.isNotEmpty) {
      pickedImage.value = File(savedImagePath);
    }
  }

  Future<String?> _getToken() async {
    return prefs.getString("token");
  }

  Map<String, String> _getHeaders(String token) {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  void _setLoading(bool value) {
    isLoading.value = value;
  }

  void _handleErrorResponse(http.Response response) {
    print(response.body);
    print('Error: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  void _handleException(dynamic e) {
    print("Exception: $e");
  }
}
