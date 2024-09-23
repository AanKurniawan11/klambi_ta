import 'dart:convert';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:klambi_ta/Pages/menuprofile/pages/address/components/addres.model.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/address/components/editaddressmodel.dart';
import 'package:klambi_ta/Pages/menuprofile/pages/address/components/show_addressModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressController extends GetxController {
  late final SharedPreferences prefs;
  RxList<Datum> Show = <Datum>[].obs;
  var teleponError = ''.obs;
  var keterangan = ''.obs;
  var provinsi = ''.obs;
  var kota = ''.obs;
  var categoryId = '1'.obs;
  var nomorTelepon = ''.obs;
  var namaLengkap = ''.obs;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var isLoading = false.obs;
  var formError = ''.obs; // Untuk menyimpan pesan error form

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  GoogleMapController? mapController; // Add this line

  Future<void> _initialize() async {
    prefs = await SharedPreferences.getInstance();
    ShowData();
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

  Future<void> setSelectedAddress(int id) async {
    await prefs.setInt("selected_address_id", id);
  }

  Future<int?> getSelectedAddressId() async {
    return prefs.getInt("selected_address_id");
  }

  bool isValidForm() {
    if (namaLengkap.value.isEmpty) {
      formError.value = 'Nama Lengkap tidak boleh kosong';
      return false;
    }
    if (nomorTelepon.value.isEmpty) {
      formError.value = 'Nomor Telepon tidak boleh kosong';
      return false;
    }
    if (provinsi.value.isEmpty) {
      formError.value = 'Provinsi tidak boleh kosong';
      return false;
    }
    if (keterangan.value.isEmpty) {
      formError.value = 'Keterangan tidak boleh kosong';
      return false;
    }
    if (latitude.value == 0.0 || longitude.value == 0.0) {
      formError.value = 'Lokasi belum dipilih';
      return false;
    }
    formError.value = '';
    return true;
  }
  Future<void> submitAddress() async {
    if (!isValidForm()) {
      Get.snackbar('Error', formError.value,
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    isLoading.value = true; // Mulai loading
    try {
      final token = await _getToken();
      final address = Address(
        keterangan: keterangan.value,
        provinsi: provinsi.value,
        categoryId: categoryId.value,
        nomorTelepon: nomorTelepon.value,
        namaLengkap: namaLengkap.value,
        latitude: latitude.value,
        longitude: longitude.value,
      );

      final response = await http.post(
        Uri.parse('https://klambi.ta.rplrus.com/api/addresses'),
        headers: _getHeaders(token!),
        body: jsonEncode(address.toJson()),
      );

      print(response.body);
      if (response.statusCode == 201) {
        ShowData(); // Update data alamat setelah sukses
        Get.toNamed("/addAddress"); // Arahkan ke halaman lain
      } else {
        _handleErrorResponse(response);
      }
    } catch (e) {
      _handleException(e);
    } finally {
      isLoading.value = false; // Matikan loading setelah selesai
    }
  }

  Future<void> ShowData() async {
    isLoading.value = true; // Mulai loading
    try {
      final token = await _getToken();
      final response = await http.get(
        Uri.parse('https://klambi.ta.rplrus.com/api/addresses'),
        headers: _getHeaders(token!),
      );

      if (response.statusCode == 200) {
        final tes = showAddressFromJson(response.body);
        Show.value = tes.data;
      } else {
        _handleErrorResponse(response);
      }
    } catch (e) {
      _handleException(e);
    } finally {
      isLoading.value = false; // Matikan loading setelah selesai
    }
  }

  Future<void> deleteAddress(int id) async {
    isLoading.value = true;
    try {
      final token = await _getToken();
      final response = await http.delete(
        Uri.parse('https://klambi.ta.rplrus.com/api/addresses/$id'),
        headers: _getHeaders(token!),
      );

      print(response.body);
      if (response.statusCode == 200) {
        Show.removeWhere(
            (address) => address.id == id);
        print('Alamat berhasil dihapus');
      } else {
        _handleErrorResponse(response);
      }
    } catch (e) {
      _handleException(e);
    } finally {
      isLoading.value = false; // Matikan loading setelah selesai
    }
  }

  Future<void> updateAddress(int id) async {
    if (!isValidForm()) {
      Get.snackbar('Error', formError.value,
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true; // Mulai loading
    try {
      final token = await _getToken();
      final address = Addresss(
        keterangan: keterangan.value,
        provinsi: provinsi.value,
        categoryId: categoryId.value,
        nomorTelepon: nomorTelepon.value,
        namaLengkap: namaLengkap.value,
        latitude: latitude.value,
        longitude: longitude.value,
      );

      final response = await http.put(
        Uri.parse('https://klambi.ta.rplrus.com/api/addresses/$id'),
        headers: _getHeaders(token!),
        body: jsonEncode(address.toJson()),
      );

      if (response.statusCode == 200) {
        ShowData();
        Get.toNamed("/addAddress");
      } else {
        _handleErrorResponse(response);
      }
    } catch (e) {
      _handleException(e);
    } finally {
      isLoading.value = false; // Matikan loading setelah selesai
    }
  }

  void _handleErrorResponse(http.Response response) {
    print('Error: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  void _handleException(dynamic e) {
    print("Exception: $e");
  }
}
