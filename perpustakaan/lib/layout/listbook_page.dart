import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListBook extends StatefulWidget {
  const ListBook({Key? key}) : super(key: key);

  @override
  _ListBookState createState() => _ListBookState();
}

class _ListBookState extends State<ListBook> {
  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: screenwidth * 0.5,
        leading: Container(
          child: Row(
            children: [
              Builder(builder: (context) {
                return BackButton(color: Colors.blue);
              }),
            ],
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Title(
          color: Colors.blue,
          child: Text(
            'List Buku',
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
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: screenwidth * 0.001,
        mainAxisSpacing: screenwidth * 0.005,
        childAspectRatio : 1/2,
        children: <Widget>[
          Kategori(
            context: context,
            image: "lib/assets/buku_Bulan.png",
            title: "Programming",
          ),
          Kategori(
            context: context,
            image: "lib/assets/buku_Bulan.png",
            title: "Drama",
          ),
          Kategori(
            context: context,
            image: "lib/assets/buku_Bulan.png",
            title: "Drama",
          ),
          Kategori(
            context: context,
            image: "lib/assets/buku_Bulan.png",
            title: "Drama",
          ),
          Kategori(
            context: context,
            image: "lib/assets/buku_Bulan.png",
            title: "Drama",
          ),
          Kategori(
            context: context,
            image: "lib/assets/buku_Bulan.png",
            title: "Drama",
          ),
          Kategori(
            context: context,
            image: "lib/assets/buku_Bulan.png",
            title: "Drama",
          ),
          Kategori(
            context: context,
            image: "lib/assets/buku_Bulan.png",
            title: "Drama",
          ),
          Kategori(
            context: context,
            image: "lib/assets/buku_Bulan.png",
            title: "Drama",
          ),
        ],
      ),
    ));
  }

Widget Kategori({required BuildContext context, image, title}) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;
    return Padding(
      padding:
          EdgeInsets.fromLTRB(screenwidth * 0.01, 0,screenwidth * 0.01, 0),
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
                    image: AssetImage(
                      image,
                    ),
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
                      title,
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
