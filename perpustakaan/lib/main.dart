import 'package:flutter/material.dart';
import 'loading_page.dart';

void main() {
  runApp(const Perpustakaan());
}

class Perpustakaan extends StatelessWidget {
  const Perpustakaan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Perpustakaan Artji',
      debugShowCheckedModeBanner: false,
      home: LoadingPage(),
    );
  }
}



