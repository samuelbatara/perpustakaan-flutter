import 'dart:convert';

BookResponse bookResponseFromJson(String str) =>
    BookResponse.fromJson(json.decode(str));

String bookResponseToJson(BookResponse data) => json.encode(data.toJson());

class BookResponse {
  BookResponse({
    required this.success,
    required this.buku,
  });

  int success;
  List<Buku> buku;

  factory BookResponse.fromJson(Map<String, dynamic> json) => BookResponse(
        success: json["success"],
        buku: List<Buku>.from(json["Buku"].map((x) => Buku.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "Buku": List<dynamic>.from(buku.map((x) => x.toJson())),
      };
}

class Buku {
  Buku({
    required this.idbuku,
    required this.isbn,
    required this.judul,
    required this.idkategori,
    required this.pengarang,
    required this.penerbit,
    required this.kotaTerbit,
    required this.editor,
    required this.fileGambar,
    required this.createdAt,
    required this.updatedAt,
    required this.stok,
    required this.stokTersedia,
  });

  String idbuku;
  String isbn;
  String judul;
  String idkategori;
  String pengarang;
  String penerbit;
  String kotaTerbit;
  String editor;
  String fileGambar;
  DateTime createdAt;
  DateTime updatedAt;
  String stok;
  String stokTersedia;

  factory Buku.fromJson(Map<String, dynamic> json) => Buku(
        idbuku: json["idbuku"] ?? "",
        isbn: json["isbn"] ?? "",
        judul: json["judul"] ?? "",
        idkategori: json["idkategori"] ?? "",
        pengarang: json["pengarang"] ?? "",
        penerbit: json["penerbit"] ?? "",
        kotaTerbit: json["kota_terbit"] ?? "",
        editor: json["editor"] ?? "",
        fileGambar: json["file_gambar"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        stok: json["stok"] ?? "",
        stokTersedia: json["stok_tersedia"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "idbuku": idbuku,
        "isbn": isbn,
        "judul": judul,
        "idkategori": idkategori,
        "pengarang": pengarang,
        "penerbit": penerbit,
        "kota_terbit": kotaTerbit,
        "editor": editor,
        "file_gambar": fileGambar,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "stok": stok,
        "stok_tersedia": stokTersedia,
      };
}
