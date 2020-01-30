import 'package:flutter/material.dart';
import 'package:CARing/packages/CARing.dart';

import 'login/Intro.dart';
//import 'screens/Home.dart';
import 'login/Splash.dart';
import 'login/Login.dart';

var routes = <String, WidgetBuilder> {c
  //"/splash": (BuildContext context) => SplashPage(),
  "/intro": (BuildContext context) => IntroPage(),
  "/login": (BuildContext context) => LoginPage(),
};

void main() => runApp(CARingApp());

class CARingNavigator {
  static void goToLogin(BuildContext context) {
    Navigator.pushNamed(context, "/login");
  }
  static void goToIntro(BuildContext context) {
    Navigator.pushNamed(context, "/intro");
  }
}

class CARingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: CARing.name,
      theme: ThemeData(
        fontFamily: 'Nunito',
        brightness: Brightness.light, // Alta optiune: Brightness.dark (Dark Mode)
      ),
      home: SplashPage(),
      routes: routes,
    );
  }
}