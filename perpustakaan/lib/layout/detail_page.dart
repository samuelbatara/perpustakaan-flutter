import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perpustakaan/models/buku.dart';

class DetailBuku extends StatefulWidget {
  static const routeName = '/detail-buku';

  final Buku buku;

  const DetailBuku({Key? key, required this.buku}) : super(key: key);

  @override
  _DetailBukuState createState() => _DetailBukuState();
}

class _DetailBukuState extends State<DetailBuku>
    with SingleTickerProviderStateMixin {
  // void getDetailBuku(String id) {
  //   ServerHandler()
  //       .getDetailBuku(id)
  //       .then((value) => {
  //             setState(() {
  //               buku = value;
  //             })
  //           })
  //       .catchError((e) => print(e));
  // }

  final ScrollController _sliverScrollController = ScrollController();

  var isPinned = false;
  @override
  void initState() {
    super.initState();
    //atur isPinned
    _sliverScrollController.addListener(() {
      if (!isPinned &&
          _sliverScrollController.hasClients &&
          _sliverScrollController.offset > kToolbarHeight) {
        setState(() {
          isPinned = true;
        });
      } else if (isPinned &&
          _sliverScrollController.hasClients &&
          _sliverScrollController.offset < kToolbarHeight) {
        setState(() {
          isPinned = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(controller: _sliverScrollController, slivers: <
            Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 300.0,
            backgroundColor: Colors.white,
            leadingWidth: MediaQuery.of(context).size.width * 0.5,
            leading: Container(
              child: (isPinned == false)
                  ? Row(
                      children: const [
                        BackButton(color: Colors.blue),
                        SizedBox(width: 10),
                        Text("back",
                            style: TextStyle(
                                color: Colors.blue,
                                fontFamily: 'Poppins Medium'))
                      ],
                    )
                  : Row(
                      children: const [
                        BackButton(color: Colors.blue),
                        SizedBox(width: 10),
                        Text("back",
                            style: TextStyle(
                                color: Colors.blue,
                                fontFamily: 'Poppins Medium'))
                      ],
                    ),
            ),
            title: (isPinned == true)
                ? Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      widget.buku.judul,
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height / 40,
                      ),
                    ))
                : (const SizedBox(height: 0)),
            flexibleSpace: FlexibleSpaceBar(
                background: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://perpustakaanartji.000webhostapp.com/webservice/assets/${widget.buku.fileGambar}'),
                      fit: BoxFit.contain)),
            )),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.buku.judul,
                          style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                                color: Colors.blue,
                                letterSpacing: .5,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.055,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: screenheight * 0.01,
                              bottom: screenheight * 0.0015),
                          child: Text(
                            widget.buku.pengarang,
                            style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                  color: Colors.grey,
                                  letterSpacing: .5,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.035,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Padding(
                            padding:
                                EdgeInsets.only(top: screenheight * 0.0015),
                            child: Row(
                              children: [
                                Text(
                                  "ISBN : ",
                                  style: GoogleFonts.ubuntu(
                                    textStyle: TextStyle(
                                        color: Colors.grey,
                                        letterSpacing: .5,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.035,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Text(
                                  widget.buku.isbn,
                                  style: GoogleFonts.ubuntu(
                                    textStyle: TextStyle(
                                        color: Colors.grey,
                                        letterSpacing: .5,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.035,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                            padding:
                                EdgeInsets.only(top: screenheight * 0.0015),
                            child: Row(
                              children: [
                                Text(
                                  widget.buku.penerbit,
                                  style: GoogleFonts.ubuntu(
                                    textStyle: TextStyle(
                                        color: Colors.grey,
                                        letterSpacing: .5,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.035,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            )),
                        const Divider(),
                        Padding(
                          padding: EdgeInsets.only(bottom: screenheight * 0.01),
                          child: Text(
                            "Deskripsi Buku",
                            style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                  color: Colors.blue,
                                  letterSpacing: .5,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.045,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sed blandit massa. Integer in quam varius, laoreet orci finibus, hendrerit augue. Quisque ipsum augue,"
                            "porta vitae diam gravida, efficitur hendrerit diam. Aliquam ut neque mi. Nunc vehicula sem non elit porta varius."
                            "Maecenas in hendrerit velit. Curabitur ut lorem non libero mollis eleifend eget eget nisl. Morbi at diam dolor. Maecenas commodo euismod quam et tempor."
                            "Aliquam erat volutpat. Donec vitae auctor eli"
                            "Aenean et cursus nibh. Suspendisse sollicitudin sem in congue sagittis. Sed vehicula orci arcu, sagittis aliquet augue cursus eu."
                            "Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere"
                            "cubilia curae; Nam purus sem, elementum vel venenatis ac, accumsan vel libero. Maecenas at pretium ipsum. Aenean dictum risus in sem vestibulum, vitae semper lacus aliquet."
                            "Mauris quis dolor laoreet, ornare mi nec, luctus dolor. Cras fringilla, tellus vel condimentum lobortis, nulla arcu semper nisl, sit amet vulputate arcu ex et eros."
                            "Phasellus gravida nunc non lorem aliquet, non mollis leo vestibulum. Nulla sodales, est sed bibendum pellentesque, ante elit dapibus nunc, a tincidunt est ex vitae erat. Nulla facilisi."
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sed blandit massa. Integer in quam varius, laoreet orci finibus, hendrerit augue. Quisque ipsum augue,"
                            "porta vitae diam gravida, efficitur hendrerit diam. Aliquam ut neque mi. Nunc vehicula sem non elit porta varius."
                            "Maecenas in hendrerit velit. Curabitur ut lorem non libero mollis eleifend eget eget nisl. Morbi at diam dolor. Maecenas commodo euismod quam et tempor."
                            "Aliquam erat volutpat. Donec vitae auctor eli"
                            "Aenean et cursus nibh. Suspendisse sollicitudin sem in congue sagittis. Sed vehicula orci arcu, sagittis aliquet augue cursus eu."
                            "Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere"
                            "cubilia curae; Nam purus sem, elementum vel venenatis ac, accumsan vel libero. Maecenas at pretium ipsum. Aenean dictum risus in sem vestibulum, vitae semper lacus aliquet."
                            "Mauris quis dolor laoreet, ornare mi nec, luctus dolor. Cras fringilla, tellus vel condimentum lobortis, nulla arcu semper nisl, sit amet vulputate arcu ex et eros."
                            "Phasellus gravida nunc non lorem aliquet, non mollis leo vestibulum. Nulla sodales, est sed bibendum pellentesque, ante elit dapibus nunc, a tincidunt est ex vitae erat. Nulla facilisi.",
                            maxLines: 100,
                            overflow: TextOverflow.ellipsis,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.ubuntu(
                              textStyle: TextStyle(
                                  color: Colors.grey,
                                  letterSpacing: .5,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.035,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ]))
            ]),
          )
        ]),
      ),
    );
  }
}
