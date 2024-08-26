import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ImageUploadController extends GetxController {
  RxBool isLoading = false.obs;
  int? orderId;


  Future<void> uploadImage(File image) async {
    isLoading(true);
    var token = await SharedPreferences.getInstance().then((prefs) => prefs.getString("token"));

    var uri = Uri.parse('https://klambi.ta.rplrus.com/api/order/$orderId/upload-image');
    var request = http.MultipartRequest('POST', uri)
      ..headers['Authorization'] = 'Bearer $token'
      ..files.add(await http.MultipartFile.fromPath('image', image.path));
    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        print('Image uploaded successfully: $responseBody');
      } else {
        var responseBody = await response.stream.bytesToString();
        print('Failed to upload image: ${response.statusCode}');
        print('Response body: $responseBody');
      }
    } catch (e) {
      print('Error uploading image: $e');
    } finally {
      isLoading(false);
    }
  }
}
