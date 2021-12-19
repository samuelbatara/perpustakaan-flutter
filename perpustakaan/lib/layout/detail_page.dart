

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailBuku extends StatefulWidget {
  @override
  _DetailBukuState createState() => _DetailBukuState();
}



class _DetailBukuState extends State<DetailBuku> {

  final ScrollController _sliverScrollController = ScrollController();
  
  var isPinned = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          controller: _sliverScrollController,
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 300.0,
              backgroundColor: Colors.white,
              leadingWidth: MediaQuery.of(context).size.width * 0.5,
              leading: Container(
                child: (isPinned == false)
                  ? Row(
                      children: [
                        BackButton(color: Colors.white),
                        SizedBox(width: 10),
                        Text("back", style: TextStyle(color:Colors.white, fontFamily: 'Poppins Medium'))
                      ],
                    )
                  : Row(
                      children: [
                        BackButton(color: Colors.black),
                        SizedBox(width: 10),
                        Text("back", style: TextStyle(color:Colors.black, fontFamily: 'Poppins Medium'))
                      ],
                    ),
              ),
              title: (isPinned == true)
                  ? Container(
                      alignment: Alignment.topRight,
                      child: Text("Nama Buku",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height / 40,
                      
                        ),
                      )
                  ): (SizedBox(height: 0)),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("lib/assets/ArtjiVisual_01.jpg"),
                      fit: BoxFit.cover
                    )
                  ),
                )
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "Appan bikin yaa",
                            style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                  color: Colors.blue,
                                  letterSpacing: .5,
                                  fontSize: MediaQuery.of(context).size.width * 0.03,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ),
                        Divider(),
                      ]
                    )
                  )
                ]
              ),
            )
          ]
        )
      )

    );
  }
}