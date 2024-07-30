import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:klambi_ta/Pages/address/components/addres.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressController extends GetxController {

  var keterangan = ''.obs;
  var provinsi = ''.obs;
  var kota = ''.obs;
  var kodePos = ''.obs;
  var categoryId = '1'.obs;
  var kecamatan = ''.obs;
  var nomorTelepon = ''.obs;
  var namaLengkap = ''.obs;

  String? token = "";
  late SharedPreferences prefs;

  @override
  void onInit() {
    super.onInit();
    _initPrefs();
  }

  Future<void> _initPrefs() async   {
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    print('Token: $token');

    keterangan.value = prefs.getString('keterangan') ?? '';
    provinsi.value = prefs.getString('provinsi') ?? '';
    kota.value = prefs.getString('kota') ?? '';
    kodePos.value = prefs.getString('kodePos') ?? '';
    categoryId.value = prefs.getString('categoryId') ?? '1';
    kecamatan.value = prefs.getString('kecamatan') ?? '';
    nomorTelepon.value = prefs.getString('nomorTelepon') ?? '';
    namaLengkap.value = prefs.getString('namaLengkap') ?? '';
  }

  Future<void> submitAddress() async {
    final address = Address(
      keterangan: keterangan.value,
      provinsi: provinsi.value,
      kota: kota.value,
      kodePos: kodePos.value,
      categoryId: categoryId.value,
      kecamatan: kecamatan.value,
      nomorTelepon: nomorTelepon.value,
      namaLengkap: namaLengkap.value,
    );

    final response = await http.post(
      Uri.parse('https://klambi.ta.rplrus.com/api/addresses'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(address.toJson()),
    );

    if (response.statusCode == 200) {
      // Berhasil mengirim data, simpan data ke SharedPreferences
      await saveAddressToPrefs();
      print('Token: $token'); // Debugging untuk memastikan token ada
      print('Response body: ${response.body}'); // Debugging
      Get.toNamed("/navbar");
    } else {
      // Gagal mengirim data
      print('Token: $token'); // Debugging untuk memastikan token ada
      print('Response body: ${response.body}'); // Debugging untuk memeriksa respon
    }
  }

  Future<void> saveAddressToPrefs() async {
    await prefs.setString('keterangan', keterangan.value);
    await prefs.setString('provinsi', provinsi.value);
    await prefs.setString('kota', kota.value);
    await prefs.setString('kodePos', kodePos.value);
    await prefs.setString('categoryId', categoryId.value);
    await prefs.setString('kecamatan', kecamatan.value);
    await prefs.setString('nomorTelepon', nomorTelepon.value);
    await prefs.setString('namaLengkap', namaLengkap.value);

    print('Data alamat berhasil disimpan di SharedPreferences');
  }

  Future<bool> deleteAddress() async {
    final response = await http.delete(
      Uri.parse('https://klambi.ta.rplrus.com/api/addresses/id'), // Pastikan untuk mengganti 'id' dengan ID alamat yang sesuai
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      // Berhasil menghapus data, hapus data dari SharedPreferences
      await clearPrefs();
      return true;
    } else {
      // Gagal menghapus data
      print('Token: $token'); // Debugging untuk memastikan token ada
      print('Response body: ${response.body}'); // Debugging untuk memeriksa respon
      return false;
    }
  }

  Future<void> clearPrefs() async {
    await prefs.remove('keterangan');
    await prefs.remove('provinsi');
    await prefs.remove('kota');
    await prefs.remove('kodePos');
    await prefs.remove('categoryId');
    await prefs.remove('kecamatan');
    await prefs.remove('nomorTelepon');
    await prefs.remove('namaLengkap');
  }
}
