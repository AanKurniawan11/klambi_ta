import 'package:shared_preferences/shared_preferences.dart';

class Address {
  String keterangan;
  String provinsi;
  String categoryId;
  String nomorTelepon;
  String namaLengkap;
  double latitude;
  double longitude;

  Address({
    required this.keterangan,
    required this.provinsi,
    required this.categoryId,
    required this.nomorTelepon,
    required this.namaLengkap,
    required this.latitude,
    required this.longitude,
  });

  // Konversi dari JSON ke model
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      keterangan: json['keterangan'],
      provinsi: json['provinsi'],
      categoryId: json['category_id'],
      nomorTelepon: json['nomor_telepon'],
      namaLengkap: json['nama_lengkap'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  // Konversi dari model ke JSON
  Map<String, dynamic> toJson() {
    return {
      'keterangan': keterangan,
      'provinsi': provinsi,
      'category_id': categoryId,
      'nomor_telepon': nomorTelepon,
      'nama_lengkap': namaLengkap,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  // Menyimpan address ke SharedPreferences
  Future<void> saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('keterangan', keterangan);
    await prefs.setString('provinsi', provinsi);
    await prefs.setString('categoryId', categoryId);
    await prefs.setString('nomorTelepon', nomorTelepon);
    await prefs.setString('namaLengkap', namaLengkap);
    await prefs.setDouble('latitude', latitude);
    await prefs.setDouble('longitude', longitude);
  }

  // Memuat address dari SharedPreferences
  static Future<Address?> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final keterangan = prefs.getString('keterangan');
    final provinsi = prefs.getString('provinsi');
    final categoryId = prefs.getString('categoryId');
    final nomorTelepon = prefs.getString('nomorTelepon');
    final namaLengkap = prefs.getString('namaLengkap');
    final latitude = prefs.getDouble('latitude');
    final longitude = prefs.getDouble('longitude');

    if (keterangan != null &&
        provinsi != null &&
        categoryId != null &&
        nomorTelepon != null &&
        namaLengkap != null &&
        latitude != null &&
        longitude != null) {
      return Address(
        keterangan: keterangan,
        provinsi: provinsi,
        categoryId: categoryId,
        nomorTelepon: nomorTelepon,
        namaLengkap: namaLengkap,
        latitude: latitude,
        longitude: longitude,
      );
    }
    return null;
  }

  // Menghapus address dari SharedPreferences
  static Future<void> clearPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('keterangan');
    await prefs.remove('provinsi');
    await prefs.remove('categoryId');
    await prefs.remove('nomorTelepon');
    await prefs.remove('namaLengkap');
    await prefs.remove('latitude');
    await prefs.remove('longitude');
  }
}
