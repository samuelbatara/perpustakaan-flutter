import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perpustakaan/models/kategori.dart';

class HomeKategoriItem extends StatelessWidget {
  final Kategori kategori;
  const HomeKategoriItem({Key? key, required this.kategori}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;
    return Padding(
      padding:
          EdgeInsets.fromLTRB(screenwidth * 0.04, 0, 0, screenheight * 0.005),
      child: SizedBox(
        width: screenwidth / 1 / 3,
        height: screenheight / 1 / 3,
        child: Card(
          elevation: 0.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: screenheight / 1 / 5.5,
                width: screenwidth / 1 / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://perpustakaanartji.000webhostapp.com/webservice/assets/${kategori.fileGambar}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 0.5),
                    child: Text(
                      kategori.nama,
                      style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                            color: Colors.blue,
                            letterSpacing: .2,
                            fontSize: screenheight * 0.02,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
