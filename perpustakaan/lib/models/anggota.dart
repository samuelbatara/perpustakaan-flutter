import 'dart:convert';

AnggotaResp anggotaRespFromJson(String str) =>
    AnggotaResp.fromJson(json.decode(str));

String anggotaRespToJson(AnggotaResp data) => json.encode(data.toJson());

class AnggotaResp {
  AnggotaResp({
    required this.success,
    required this.message,
    required this.anggota,
  });

  int success;
  String message;
  Anggota anggota;

  factory AnggotaResp.fromJson(Map<String, dynamic> json) => AnggotaResp(
        success: json["success"],
        message: json["message"],
        anggota: Anggota.fromJson(json["Anggota"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "Anggota": anggota.toJson(),
      };
}

class Anggota {
  Anggota({
    required this.nim,
    required this.nama,
    required this.password,
    required this.alamat,
    required this.kota,
    required this.email,
    required this.noTelp,
    this.rememberToken,
    this.createdAt,
    required this.updatedAt,
  });

  String nim;
  String nama;
  String password;
  String alamat;
  String kota;
  String email;
  String noTelp;
  dynamic rememberToken;
  dynamic createdAt;
  DateTime updatedAt;

  factory Anggota.fromJson(Map<String, dynamic> json) => Anggota(
        nim: json["nim"] ?? "",
        nama: json["nama"] ?? "",
        password: json["password"] ?? "",
        alamat: json["alamat"] ?? "",
        kota: json["kota"] ?? "",
        email: json["email"] ?? "",
        noTelp: json["no_telp"] ?? "",
        rememberToken: json["remember_token"] ?? "",
        createdAt: json["created_at"] ?? "",
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "nim": nim,
        "nama": nama,
        "password": password,
        "alamat": alamat,
        "kota": kota,
        "email": email,
        "no_telp": noTelp,
        "remember_token": rememberToken,
        "created_at": createdAt,
        "updated_at": updatedAt.toIso8601String(),
      };
}
