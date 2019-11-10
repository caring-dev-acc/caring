import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Text(
          sayHello(),
          style: TextStyle(fontSize: 30.0),
        ),
      )
    );
  }
}
String sayHello() {
  String hello;
  DateTime now = new DateTime.now();
  int hour = now.hour;
  if (hour < 12) {
    hello = "Good morning";
  }
  else if (hour < 18) {
    hello = "Good afternoon";
  }
  else {
    hello = "Good evening";
  }
  return hello;
}