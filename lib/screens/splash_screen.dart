import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/layouts/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  Splash createState() => Splash();
  static const String routeName = "Splash";
}

class Splash extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen())));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Image.asset(
          "assets/images/splash.png",
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
