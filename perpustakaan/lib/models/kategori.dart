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
  });

  String idkategori;
  String nama;

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
        idkategori: json["idkategori"] ?? "",
        nama: json["nama"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "idkategori": idkategori,
        "nama": nama,
      };
}
