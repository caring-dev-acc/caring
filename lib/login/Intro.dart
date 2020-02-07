import 'package:flutter/material.dart';
import 'package:CARing/packages/CARing.dart';
import 'package:CARing/packages/Walkthrough.dart';

import '../main.dart';

class IntroPage extends StatefulWidget {
  @override
  IntroScreenState createState() {
    return IntroScreenState();
  }
}

class IntroScreenState extends State<IntroPage> {
  final PageController controller = new PageController();
  int currentPage = 0;
  bool lastPage = false;

  void onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == 3) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryDarkBlue,
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 3,
            child: PageView(
              children: <Widget>[
                Walkthrough(
                  title: 'Găsește instant șoferul',
                  content: 'Doar pe baza plăcuței de înmatriculare.',
                  imageIcon: Icons.directions_car,
                  imagecolor: primaryDarkBlue,
                ),
                Walkthrough(
                  title: 'Interacționează direct cu șoferul',
                  content: 'Poți lua legătura cu orice șofer.',
                  imageIcon: Icons.chat,
                  imagecolor: primaryDarkBlue,
                ),
                Walkthrough(
                  title: 'Comunitate',
                  content: 'Fiecare pieton cu spirit civic poate contribui.',
                  imageIcon: Icons.people,
                  imagecolor: primaryDarkBlue,
                ),
                Walkthrough(
                  title: 'Protecția datelor personale',
                  content: 'Datele personale sunt în siguranță cu noi.',
                  imageIcon: Icons.verified_user,
                  imagecolor: primaryDarkBlue,
                ),
              ],
              controller: controller,
              onPageChanged: onPageChanged,
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text(lastPage ? '' : 'SĂRI PESTE',
                      style: TextStyle(
                          color: secondaryPopYellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  onPressed: () => lastPage ? null : CARingNavigator.goToLogin(context),
                ),
                FlatButton(
                  child: Text(
                    lastPage ? 'AM ÎNȚELES' : 'URMĂTORUL',
                    style: TextStyle(
                        color: secondaryPopYellow,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                  onPressed: () => lastPage ? CARingNavigator.goToLogin(context) : controller.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}