import 'package:flutter/material.dart';

import 'login/Splash.dart';

Color primaryDarkBlue = Color(0xFF14213d);
Color secondaryPopYellow = Color(0xFFfca311);

void main() => runApp(CARingApp());

class CARingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CARing',
      theme: ThemeData(
        fontFamily: 'Nunito',
        brightness: Brightness.light, // Alta optiune: Brightness.dark (Dark Mode)
      ),
      home: SplashPage(),
    );
  }
}