// To parse this JSON data, do
//
//     final editAddress = editAddressFromJson(jsonString);

import 'dart:convert';

EditAddress editAddressFromJson(String str) => EditAddress.fromJson(json.decode(str));

String editAddressToJson(EditAddress data) => json.encode(data.toJson());

class EditAddress {
  bool success;
  String message;
  Data data;

  EditAddress({
    required this.success,
    required this.message,
    required this.data,
  });

  factory EditAddress.fromJson(Map<String, dynamic> json) => EditAddress(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  int id;
  int userId;
  String nomorTelepon;
  String namaLengkap;
  String keterangan;
  String provinsi;
  String kota;
  String kecamatan;
  int kodePos;
  DateTime createdAt;
  DateTime updatedAt;

  Data({
    required this.id,
    required this.userId,
    required this.nomorTelepon,
    required this.namaLengkap,
    required this.keterangan,
    required this.provinsi,
    required this.kota,
    required this.kecamatan,
    required this.kodePos,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    userId: json["user_id"],
    nomorTelepon: json["nomor_telepon"],
    namaLengkap: json["nama_lengkap"],
    keterangan: json["keterangan"],
    provinsi: json["provinsi"],
    kota: json["kota"],
    kecamatan: json["kecamatan"],
    kodePos: json["kode_pos"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "nomor_telepon": nomorTelepon,
    "nama_lengkap": namaLengkap,
    "keterangan": keterangan,
    "provinsi": provinsi,
    "kota": kota,
    "kecamatan": kecamatan,
    "kode_pos": kodePos,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
