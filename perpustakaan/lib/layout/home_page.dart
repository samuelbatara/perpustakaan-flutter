import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:perpustakaan/layout/listbook_page.dart';
import 'package:perpustakaan/models/buku.dart';
import 'package:perpustakaan/models/kategori.dart';
import 'package:perpustakaan/server_handler.dart';
import 'package:perpustakaan/widgets/home_buku_item.dart';
import 'package:perpustakaan/widgets/home_kategori_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Buku>> getBuku() async {
    List<Buku> buku = await ServerHandler().listBuku();
    return buku;
  }

  Future<List<Kategori>> getKategori() async {
    List<Kategori> kategori = await ServerHandler().listKategori();
    return kategori;
  }

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blue),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
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
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.only(left: screenwidth * 0.02),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(
                    screenwidth * 0.03,
                    screenheight * 0.015,
                    screenwidth * 0.025,
                    screenheight * 0.015),
                child: SizedBox(
                  height: screenheight * 0.050,
                  width: screenwidth * 0.85,
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFF3F4F6),
                      contentPadding: const EdgeInsets.only(left: 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                      hintText: 'Masukkan nama buku',
                      hintStyle: GoogleFonts.ubuntu(
                          color: const Color(0xFF9CA3AF),
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                      suffixIcon: const Icon(
                        Icons.search,
                        color: Color(0xFF9CA3AF),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenwidth * 0.045, 0,
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
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ListBook()));
                      },
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
                child: FutureBuilder<List<Buku>>(
                  future: getBuku(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Buku>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView(
                        scrollDirection: Axis.horizontal,
                        children: snapshot.data!
                            .map((e) => HomeBukuItem(buku: e))
                            .toList(),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(screenwidth * 0.04, 0,
                        screenwidth * 0.025, screenheight * 0.015),
                    child: Text(
                      "Kategori",
                      style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                            color: Colors.blue,
                            letterSpacing: .2,
                            fontSize: screenheight * 0.032,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height: screenheight * 0.35,
                  child: FutureBuilder<List<Kategori>>(
                    future: getKategori(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.count(
                          crossAxisCount: 2,
                          children: snapshot.data!
                              .map((e) => HomeKategoriItem(kategori: e))
                              .toList(),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ))
            ],
          ),
        )),
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor:
                Colors.blue, //This will change the drawer background to blue.
            //other styles
          ),
          child: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Text('Menu',
                        style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                              color: Colors.white,
                              letterSpacing: .2,
                              fontSize: 19,
                              fontWeight: FontWeight.w800),
                        ))),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Nama',
                      style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                            color: Colors.white,
                            letterSpacing: .2,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      )),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.badge),
                  title: Text('NIM',
                      style: GoogleFonts.ubuntu(
                        textStyle: TextStyle(
                            color: Colors.white,
                            letterSpacing: .2,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      )),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      child: ListTile(
                        leading: Icon(Icons.logout),
                        title: Text('Logout',
                            style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: .2,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            )),
                        onTap: () {
                          // Update the state of the app
                          // ...
                          // Then close the drawer
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
