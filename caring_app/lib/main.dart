import 'package:flutter/material.dart';

// Import screens from screens folder
import 'screens/Benefits.dart';
import 'screens/Conversations.dart';
import 'screens/Profile.dart';

// Import Auth from login folder
import 'login/Authentication.dart';
import 'login/Home.dart';
import 'login/Login.dart';

var isLogged = false;

Color primaryDarkBlue = Color(0xFF14213d);
Color secondaryPopYellow = Color(0xFFfca311);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (isLogged == true) {
      return new MaterialApp(
        debugShowCheckedModeBanner: false,
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
                      child: ProfilePage(),
                    ),
                  ),
                ),
                new Container(
                  child: new Scaffold(
                    body: Center(
                      child: ConversationsPage(),
                    ),
                  ),
                ),
                new Container(
                  child: new Scaffold(
                    body: Center(
                      child: BenefitsPage(),
                    ),
                  ),
                ),
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
    } else {
      // Dacă nu e logat, atunci afișează ecranul de login
      return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      );
    }
  }
}
