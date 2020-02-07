import 'package:flutter/material.dart';
import 'package:CARing/packages/CARing.dart';

import 'package:CARing/screens/Benefits.dart';
import 'package:CARing/screens/Conversations.dart';
import 'package:CARing/screens/Profile.dart';
import 'package:CARing/login/Login.dart';

var isLogged = false; // Utilizatorul este autentificat sau nu

class HomeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (isLogged == true) { // Daca este autentificat se afiseaza meniul urmator
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
      // Dacă nu este autentificat, atunci se afișează ecranul de autentificare
      return new MaterialApp(
        home: LoginPage(),
      );
    }
  }
}