// To parse this JSON data, do
//
//     final showAddress = showAddressFromJson(jsonString);

import 'dart:convert';

ShowAddress showAddressFromJson(String str) => ShowAddress.fromJson(json.decode(str));

String showAddressToJson(ShowAddress data) => json.encode(data.toJson());

class ShowAddress {
  bool success;
  String message;
  List<Datum> data;

  ShowAddress({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ShowAddress.fromJson(Map<String, dynamic> json) => ShowAddress(
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
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

  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
