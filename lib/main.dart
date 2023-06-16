import 'package:flutter/material.dart';
import 'package:news_app/layouts/home.dart';
import 'package:news_app/provider/provider_search.dart';
import 'package:news_app/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SearchProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SplashScreen.routeName: (context) => SplashScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
