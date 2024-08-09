import 'dart:convert';
import 'package:get/get.dart';
import 'package:klambi_ta/Pages/cart/models/selectedCartModels.dart';
import 'package:klambi_ta/Pages/cart/models/cartModel.dart';
import 'package:klambi_ta/Pages/cart/models/showcartmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CartControllers extends GetxController {
  RxBool isRefresh = false.obs;
  late final SharedPreferences prefs;
  RxList<Item> Cartdata = <Item>[].obs;
  RxList<Item> selectedItems = <Item>[].obs;

  var size = 'S'.obs;
  var quantity = 0.obs;
  var productTitle = ''.obs;
  var productPrice = '1'.obs;
  var imageUrl = ''.obs;
  var productId = 0.obs;
  var cartId = 0.obs;
  var selecteds = true;
  var totalPrice = 0.obs;

  @override
  void onInit() {
    super.onInit();
    setPreference();
    updateTotalPrice();
  }

  Future<void> setPreference() async {
    prefs = await SharedPreferences.getInstance();
    ShowCartData();
  }

  Future<void> selectedCart(int id, bool status, int quantity) async {
    print(id);

    var token = await prefs.getString("token");
    final select = SelectedCartModel(cartId: id, selected: status, quantity: quantity);
    print(token);
    try {
      final response = await http.post(
        Uri.parse('https://klambi.ta.rplrus.com/api/update-selection'),
        // Update this URL as needed
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(select.toJson()),
      );
      print(response.body);

      if (response.statusCode == 200) {
        // ShowCartData();/
      } else {
        print(response.statusCode);
        print(response.obs.value.body);
        print("Failed to send");
        print('Token: $token');
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> addToCart(int id) async {
    var token = await prefs.getString("token");
    final carts = AddToCart(
      size: size.value,
      productsId: id,
      quantity: quantity.value,
    );
    print(token);
    try {
      final response = await http.post(
        Uri.parse('https://klambi.ta.rplrus.com/api/cart/add'),
        // Update this URL as needed
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(carts.toJson()),
      );
      // print(response.body);

      if (response.statusCode == 200) {
        // print('Token: $token');
        // print('Response body: ${response.body}');
        ShowCartData();
        Get.toNamed("/detail");
        print(response.body);
      } else {
        print(response.statusCode);
        print(response.obs.value.body);
        print("Failed to send");
        print('Token: $token');
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> ShowCartData() async {
    var token = await prefs.getString("token");
    final response = await http.get(
      Uri.parse('https://klambi.ta.rplrus.com/api/cart-items'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    // print(response.body);

    if (response.statusCode == 200) {
      ShowCart tes = showCartFromJson(response.body);
      Cartdata.value = tes.items;

      selectedItems.clear();
      for (var i = 0; i < tes.items.length; ++i) {
        if (tes.items[i].selected) {
          selectedItems.add(tes.items[i]);
        }
      }
      updateTotalPrice();
    } else {
      Cartdata.clear();
      print('Gagal');
      print('Token: $token');
      print(response.body);
    }
  }

  Future<void> DeleteCartItem(Map<String, dynamic> body) async {
    var token = await prefs.getString("token");
    final response = await http.delete(
      Uri.parse('https://klambi.ta.rplrus.com/api/cart/remove'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      // Menghapus item dari Cartdata dan selectedItems
      final removedItem = Cartdata.firstWhere((item) => item.productId == body['products_id']);
      Cartdata.remove(removedItem);
      selectedItems.remove(removedItem);

      // Perbarui total harga setelah item dihapus
      updateTotalPrice();
    } else {
      print("Gagal menghapus: ${response.body}");
    }
  }

  void toggleSelection(Item item) {
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }
    updateTotalPrice();
  }

  void updateTotalPrice() {
    final total = selectedItems.fold(0, (sum, item) => sum + (item.quantity * item.productPrice));
    totalPrice.value = total;
  }
}
