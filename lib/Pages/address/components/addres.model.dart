import 'package:shared_preferences/shared_preferences.dart';

class Address {
  String keterangan;
  String provinsi;
  String categoryId;
  String nomorTelepon;
  String namaLengkap;

  Address({
    required this.keterangan,
    required this.provinsi,
    required this.categoryId,
    required this.nomorTelepon,
    required this.namaLengkap,
  });

  // Konversi dari JSON ke model
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      keterangan: json['keterangan'],
      provinsi: json['provinsi'],
      categoryId: json['category_id'],
      nomorTelepon: json['nomor_telepon'],
      namaLengkap: json['nama_lengkap'],
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
  }

  // Memuat address dari SharedPreferences
  static Future<Address?> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final keterangan = prefs.getString('keterangan');
    final provinsi = prefs.getString('provinsi');
    final kota = prefs.getString('kota');
    final kodePos = prefs.getString('kodePos');
    final categoryId = prefs.getString('categoryId');
    final kecamatan = prefs.getString('kecamatan');
    final nomorTelepon = prefs.getString('nomorTelepon');
    final namaLengkap = prefs.getString('namaLengkap');

    if (
        keterangan != null &&
        provinsi != null &&
        kota != null &&
        kodePos != null &&
        categoryId != null &&
        kecamatan != null &&
        nomorTelepon != null &&
        namaLengkap != null) {
      return Address(
        keterangan: keterangan,
        provinsi: provinsi,
        categoryId: categoryId,
        nomorTelepon: nomorTelepon,
        namaLengkap: namaLengkap,
      );
    }
    return null;
  }

  // Menghapus address dari SharedPreferences
  static Future<void> clearPrefs() async {
    final prefs = await SharedPreferences.getInstance();
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
