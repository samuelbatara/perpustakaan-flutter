import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perpustakaan/models/buku.dart';
import 'package:perpustakaan/server_handler.dart';
import 'package:perpustakaan/widgets/list_buku_item.dart';

class ListBook extends StatefulWidget {
  const ListBook({Key? key}) : super(key: key);

  @override
  _ListBookState createState() => _ListBookState();
}

class _ListBookState extends State<ListBook> {
  Future<List<Buku>> getBuku() async {
    List<Buku> buku = await ServerHandler().listBuku();
    return buku;
  }

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leadingWidth: screenwidth * 0.5,
          leading: Row(
            children: [
              Builder(builder: (context) {
                return const BackButton(color: Colors.blue);
              }),
            ],
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Title(
            color: Colors.blue,
            child: Text(
              'Catalog Buku',
              style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                    color: Colors.blue,
                    letterSpacing: .2,
                    fontSize: screenheight * 0.025,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        body: FutureBuilder<List<Buku>>(
          future: getBuku(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: screenwidth * 0.001,
                mainAxisSpacing: screenwidth * 0.005,
                childAspectRatio: 1 / 2,
                children:
                    snapshot.data!.map((e) => ListBukuItem(buku: e)).toList(),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
