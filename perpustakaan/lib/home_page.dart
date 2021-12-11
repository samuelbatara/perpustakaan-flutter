import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: Container(
              padding: EdgeInsets.only(top: screenheight * 0.02),
              child: Text(
                'Catalog',
                style: GoogleFonts.ubuntu(
                  textStyle: TextStyle(
                      color: Colors.blue,
                      letterSpacing: .5,
                      fontSize: screenheight * 0.03,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(screenwidth * 0.03, 0,
                      screenwidth * 0.025, screenheight * 0.015),
                  child: Text(
                    "New Books",
                    style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                          color: Colors.blue,
                          letterSpacing: .2,
                          fontSize: screenheight * 0.032,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(screenwidth * 0.025, 0,
                      screenwidth * 0.025, screenheight * 0.01),
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      "SEE ALL",
                      style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                            color: Colors.blue,
                            letterSpacing: .2,
                            fontSize: screenheight * 0.02,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenheight * 0.35,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Buku(
                    context: context,
                    image: "lib/assets/buku_Bulan.png",
                    title: "Mengenal Anak Hewan",
                    author: "Valerie Willame"),
                  Buku(
                    context: context,
                    image: "lib/assets/buku_FilosofiTeras.png",
                    title: "Filosofi Teras",
                    author: "Affan Noviananda"),
                  Buku(
                    context: context,
                    image: "lib/assets/buku_RichDadPoorDad.png",
                    title: "Rich Dad And Por Dad",
                    author: "Raha Baiq"),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(screenwidth * 0.03, 0,
                      screenwidth * 0.025, screenheight * 0.015),
                  child: Text(
                    "Recommended",
                    style: GoogleFonts.ubuntu(
                      textStyle: TextStyle(
                          color: Colors.blue,
                          letterSpacing: .2,
                          fontSize: screenheight * 0.032,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(screenwidth * 0.025, 0,
                      screenwidth * 0.025, screenheight * 0.01),
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      "SEE ALL",
                      style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                            color: Colors.blue,
                            letterSpacing: .2,
                            fontSize: screenheight * 0.02,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenheight * 0.35,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Buku(
                    context: context,
                    image: "lib/assets/buku_Bulan.png",
                    title: "Mengenal Anak Hewan",
                    author: "Valerie Willame"),
                  Buku(
                    context: context,
                    image: "lib/assets/buku_FilosofiTeras.png",
                    title: "Filosofi Teras",
                    author: "Affan Noviananda"),
                  Buku(
                    context: context,
                    image: "lib/assets/buku_RichDadPoorDad.png",
                    title: "Rich Dad And Por Dad",
                    author: "Raha Baiq"),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }

  Widget Buku({required BuildContext context, image, title, author}) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;
    return Padding(
      padding:
          EdgeInsets.fromLTRB(screenwidth * 0.03, 0, 0, screenheight * 0.015),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 0.5),
                    child: Text(
                      author,
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
    );
  }
}
