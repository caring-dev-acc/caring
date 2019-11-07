import 'package:flutter/material.dart';
import 'package:CARing/main.dart';

class SplashPage extends StatelessWidget {
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
}