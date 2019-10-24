import 'package:flutter/material.dart';
// Import screens from screens folder
import 'screens/Benefits.dart';
import 'screens/Conversations.dart';
import 'screens/Profile.dart';

// Import Auth from login folder

import 'login/Authentication.dart';
import 'login/Firebase.dart';

void main() => runApp(MyApp());

Map<int, Color> primaryDarkBlue_map = {
  50: Color.fromRGBO(8, 13, 24, .1),
  100: Color.fromRGBO(8, 13, 24, .2),
  200: Color.fromRGBO(8, 13, 24, .3),
  300: Color.fromRGBO(8, 13, 24, .4),
  400: Color.fromRGBO(8, 13, 24, .5),
  500: Color.fromRGBO(8, 13, 24, .6),
  600: Color.fromRGBO(8, 13, 24, .7),
  700: Color.fromRGBO(8, 13, 24, .8),
  800: Color.fromRGBO(8, 13, 24, .9),
  900: Color.fromRGBO(8, 13, 24, 1),
};

MaterialColor primaryDarkBlue = MaterialColor(0xFF14213d, primaryDarkBlue_map);

Map<int, Color> secondaryPopYellow_map = {
  50: Color.fromRGBO(99, 64, 7, .1),
  100: Color.fromRGBO(99, 64, 7, .2),
  200: Color.fromRGBO(99, 64, 7, .3),
  300: Color.fromRGBO(99, 64, 7, .4),
  400: Color.fromRGBO(99, 64, 7, .5),
  500: Color.fromRGBO(99, 64, 7, .6),
  600: Color.fromRGBO(99, 64, 7, .7),
  700: Color.fromRGBO(99, 64, 7, .8),
  800: Color.fromRGBO(99, 64, 7, .9),
  900: Color.fromRGBO(99, 64, 7, 1),
};

MaterialColor secondaryPopYellow =
    MaterialColor(0xFFfca311, secondaryPopYellow_map);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'CARing',
      color: secondaryPopYellow,
      home: DefaultTabController(
        length: 3,
        child: new Scaffold(
          body: TabBarView(
            children: [
              new Container(
                  child: new Scaffold(
                      body: Center(
                child: Icon(Icons.battery_charging_full),
              ))),
              new Container(
                  child: new Scaffold(
                      body: Center(
                child: Icon(Icons.chat),
              ))),
              new Container(
                  child: new Scaffold(
                      body: Center(
                child: Icon(Icons.textsms),
              ))),
            ],
          ),
          bottomNavigationBar: new TabBar(
            isScrollable: false,
            tabs: [
              Tab(
                icon: new Icon(Icons.account_circle),
                text: 'Cont',
              ),
              Tab(icon: new Icon(Icons.message), text: 'Mesaje'),
              Tab(
                icon: new Icon(Icons.card_giftcard),
                text: 'Beneficii',
              ),
            ],
            labelColor: secondaryPopYellow,
            unselectedLabelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: secondaryPopYellow,
          ),
          backgroundColor: primaryDarkBlue,
        ),
      ),
    );
  }
}
