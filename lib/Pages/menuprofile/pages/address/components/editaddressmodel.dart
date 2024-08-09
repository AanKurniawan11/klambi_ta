class Addresss {
  String keterangan;
  String provinsi;
  String categoryId;
  String nomorTelepon;
  String namaLengkap;

  Addresss({
    required this.keterangan,
    required this.provinsi,
    required this.categoryId,
    required this.nomorTelepon,
    required this.namaLengkap,
  });

  Map<String, dynamic> toJson() {
    return {
      'keterangan': keterangan,
      'provinsi': provinsi,
      'category_id': categoryId,
      'nomor_telepon': nomorTelepon,
      'nama_lengkap': namaLengkap,
    };
  }
}
