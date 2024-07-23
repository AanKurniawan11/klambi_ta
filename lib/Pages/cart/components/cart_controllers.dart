import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:klambi_ta/Pages/cart/components/addtoCartresponsemodel.dart';

class CartControllers extends GetxController {
  RxBool isRefresh = false.obs;
  RxBool isLoading = false.obs;
  final String bearerToken = '14|QP42Ak9eA6zuWs3VtTbP5pn9EhIMlPO2SZpRCqazde08752b';

  Future<void> addtoCart(AddtoCartResponseModel cartRequest) async {
    final url = Uri.parse("https://klambi.ta.rplrus.com/api/cart/add");

    try {
      isLoading.value = true;

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $bearerToken',
        },
        body: jsonEncode(cartRequest.toJson()),
      );

      if (response.statusCode == 200) {
        print("Product berhasil ditambahkan");
      } else {
        print("Gagal menambahkan produk");
        print(response.body);
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
