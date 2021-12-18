// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'package:perpustakaan/models/buku.dart';
import 'package:perpustakaan/models/kategori.dart';

class ServerHandler {
  final String _baseUrl =
      "https://perpustakaanartji.000webhostapp.com/webservice/";

  Future<List<Buku>> listBuku() async {
    try {
      http.Response response =
          await http.get(Uri.parse('$_baseUrl/buku/listbuku'));

      BookResponse responseJson = bookResponseFromJson(response.body);

      return responseJson.buku;
    } catch (e) {
      print('Server Handler : error : ' + e.toString());
      rethrow;
    }
  }

  Future<List<Kategori>> listKategori() async {
    try {
      http.Response response =
          await http.get(Uri.parse('$_baseUrl/kategori/listkat'));

      KategoriResp responseJson = kategoriRespFromJson(response.body);

      return responseJson.kategori;
    } catch (e) {
      print('Server Handler : error : ' + e.toString());
      rethrow;
    }
  }
}
