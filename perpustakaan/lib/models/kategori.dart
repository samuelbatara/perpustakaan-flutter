// To parse this JSON data, do
//
//     final kategoriResp = kategoriRespFromJson(jsonString);

import 'dart:convert';

KategoriResp kategoriRespFromJson(String str) =>
    KategoriResp.fromJson(json.decode(str));

String kategoriRespToJson(KategoriResp data) => json.encode(data.toJson());

class KategoriResp {
  KategoriResp({
    required this.success,
    required this.kategori,
  });

  int success;
  List<Kategori> kategori;

  factory KategoriResp.fromJson(Map<String, dynamic> json) => KategoriResp(
        success: json["success"],
        kategori: List<Kategori>.from(
            json["Kategori"].map((x) => Kategori.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "Kategori": List<dynamic>.from(kategori.map((x) => x.toJson())),
      };
}

class Kategori {
  Kategori({
    required this.idkategori,
    required this.nama,
    required this.fileGambar,
  });

  String idkategori;
  String nama;
  String fileGambar;

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
        idkategori: json["idkategori"] ?? "",
        nama: json["nama"] ?? "",
        fileGambar: json["file_gambar"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "idkategori": idkategori,
        "nama": nama,
        "file_gambar": fileGambar,
      };
}
