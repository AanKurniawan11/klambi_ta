class Addresss {
  String keterangan;
  String provinsi;
  String categoryId;
  String nomorTelepon;
  String namaLengkap;
  double latitude;
  double longitude;

  Addresss({
    required this.keterangan,
    required this.provinsi,
    required this.categoryId,
    required this.nomorTelepon,
    required this.namaLengkap,
    required this.latitude,
    required this.longitude,
  });

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
}
