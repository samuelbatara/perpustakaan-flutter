import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perpustakaan/models/buku.dart';

class ListBukuItem extends StatelessWidget {
  final Buku buku;
  const ListBukuItem({Key? key, required this.buku}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;
    return Padding(
      padding:
          EdgeInsets.fromLTRB(screenwidth * 0.01, 0, screenwidth * 0.01, 0),
      child: SizedBox(
        child: Card(
          elevation: 0.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: screenheight / 1 / 3,
                width: screenwidth / 1 / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://perpustakaanartji.000webhostapp.com/webservice/assets/${buku.fileGambar}'),
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
                      buku.judul,
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
