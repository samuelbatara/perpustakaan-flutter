import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perpustakaan/models/buku.dart';

class HomeBukuItem extends StatelessWidget {
  final Buku buku;
  const HomeBukuItem({Key? key, required this.buku}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding:
            EdgeInsets.fromLTRB(screenwidth * 0.04, 0, 0, screenheight * 0.015),
        child: SizedBox(
          width: screenwidth / 1 / 3,
          child: Card(
            elevation: 0.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: screenheight / 1 / 4,
                  width: screenwidth / 1 / 3,
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
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                              color: Colors.blue,
                              letterSpacing: .2,
                              fontSize: screenheight * 0.02,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0.5),
                      child: Text(
                        buku.pengarang,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                              color: Colors.black,
                              letterSpacing: .2,
                              fontSize: screenheight * 0.015,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
