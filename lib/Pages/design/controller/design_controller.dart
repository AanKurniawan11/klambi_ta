import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:klambi_ta/Pages/payment/controller/payment_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as path;

class ImageUploadController extends GetxController {
  RxBool isLoading = false.obs;
  final PaymentController controller = Get.find<PaymentController>();

  Future<void> uploadImage(File imageFile) async {
    if (controller.orderId == null) {
      print("Order ID is null, cannot upload image");
      return;
    }

    isLoading(true);
    print(controller.orderId);
    try {
      // Mendapatkan token dari SharedPreferences
      var token = await SharedPreferences.getInstance().then((prefs) => prefs.getString("token"));


      // Baca file gambar sebagai bytes
      var imageBytes = await imageFile.readAsBytes();

      // Buat request multipart
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://klambi.ta.rplrus.com/api/order/upload-image'),
      );

      request.headers['Authorization'] = 'Bearer $token';

      // Tambahkan field order_id
      request.fields['order_id'] = controller.orderId.toString();

      // Tambahkan file gambar sebagai bytes
      request.files.add(
        http.MultipartFile.fromBytes(
          'image',
          imageBytes,
          filename: path.basename(imageFile.path),
        ),
      );

      // Kirim request dan dapatkan response
      var response = await request.send();

      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        print('Image uploaded successfully: $responseBody');
      } else {
        print('Failed to upload image: ${response.statusCode}');
        var responseBody = await response.stream.bytesToString();
        print('Response body: $responseBody');
      }
    } catch (e) {
      print('Error uploading image: $e');
    } finally {
      isLoading(false);
    }
  }
}
