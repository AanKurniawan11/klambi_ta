import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:klambi_ta/Pages/menuprofile/pages/address/components/addres.model.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/address/components/editaddressmodel.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/address/components/show_addressModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressController extends GetxController {
  late final SharedPreferences prefs;
  RxList<Datum> Show = <Datum>[].obs;


  var keterangan = ''.obs;
  var provinsi = ''.obs;
  var categoryId = '1'.obs;
  var nomorTelepon = ''.obs;
  var namaLengkap = ''.obs;
  var isLoading = true.obs;


  @override
  void onInit() {
    super.onInit();
    setPreference();
  }

  Future<void> setPreference() async {
    prefs = await SharedPreferences.getInstance();
    ShowData();
  }

  Future<void> setSelectedAddress(int id) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setInt("selected_address_id", id);
  }

  Future<int?> getSelectedAddressId() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getInt("selected_address_id");
  }

  Future<void> submitAddress() async {
    var token = prefs.getString("token");
    final address = Address(
      keterangan: keterangan.value,
      provinsi: provinsi.value,
      categoryId: categoryId.value,
      nomorTelepon: nomorTelepon.value,
      namaLengkap: namaLengkap.value,
    );

    final response = await http.post(
      Uri.parse('https://klambi.ta.rplrus.com/api/addresses'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(address.toJson()),
    );

    print(response.body);
    if (response.statusCode == 201) {
      isLoading(true);
      ShowData();
      Get.toNamed("/addAddress");
    } else {
      print("Gagal mengirim alamat");
      print('Response body: ${response.body}');
    }
  }

  Future<void> ShowData() async {
    var token = prefs.getString("token");
    final response = await http.get(
      Uri.parse('https://klambi.ta.rplrus.com/api/addresses'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      isLoading(false);
      ShowAddress tes = showAddressFromJson(response.body);
      Show.value = tes.data;
    } else {
      print("Gagal mengambil data alamat");
      print('Response body: ${response.body}');
    }
  }

  Future<void> deleteAddress(int id) async {
    var token = await prefs.getString("token");
    final response = await http.delete(
      Uri.parse('https://klambi.ta.rplrus.com/api/addresses/$id'), // Menyisipkan ID di URL
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      Show.removeWhere((address) => address.id == id); // Menghapus alamat dari list
      print('Alamat berhasil dihapus');
    } else {
      print('Gagal menghapus alamat');
      print('Response body: ${response.body}');
    }
  }
  Future<void> updateAddress(int id) async {
    var token = prefs.getString("token");
    final address = Addresss(
      keterangan: keterangan.value,
      provinsi: provinsi.value,
      categoryId: categoryId.value,
      nomorTelepon: nomorTelepon.value,
      namaLengkap: namaLengkap.value,
    );

    final response = await http.put(
      Uri.parse('https://klambi.ta.rplrus.com/api/addresses/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(address.toJson()),
    );

    if (response.statusCode == 200) {
      ShowData();
      Get.toNamed("/addAddress");
      print(response.body);
    } else {
      print("Gagal memperbarui alamat");
    }
  }
}
