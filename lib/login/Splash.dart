import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'package:CARing/main.dart';
import 'package:CARing/login/Login.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AfterSplashScreen();
}

class AfterSplashScreen extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: LoginPage(),
      backgroundColor: primaryDarkBlue,
      photoSize: 60,
      image: Image.asset('assets/caring200x200.png'),
      title: Text(
        'CARing',
        style: TextStyle(color: Colors.white, fontSize: 40.0),
      ),
      loaderColor: secondaryPopYellow,
    );
  }
}

/* OLD VERSION
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'logo',
        child: Container(
          height: 120,
          width: 120,
            decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage('assets/caring.png')
              )
            ),
          ),
      );

    final title = Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        'CARing',
        style: TextStyle(fontSize: 38.0, color: Colors.white),
      ),
    );

    final text = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Găsește instant șoferul doar pe baza plăcuței de înmatriculare',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 26.0, color: Colors.white),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      child: Column(
        children: <Widget>[logo, title, text],
      ),
    );

    return Scaffold(
      backgroundColor: primaryDarkBlue,
      body: body,
    );
  }
}*/