import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    //panggil fungsi loading ketika halaman dimuat
    startLoading();
  }

  //fungsi loading 1200 ms = 1.2s
  startLoading() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool boolValue = prefs.getBool('firstRun') ?? false; //if null then false
    var duration = const Duration(milliseconds: 1200);
    return Timer(duration, () {
      //push replacement ke halaman WelcomePage
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        if (boolValue == false) {
          return const HomePage();
        } else {
          return const HomePage();
        }
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Image.asset("lib/assets/artji.jpg",
              height: 200, width: 200)),
    ));
  }
}
