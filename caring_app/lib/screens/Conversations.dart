import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  Contacts(this.listType);
  final String listType;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        color: Colors.red,
        child: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.blue,
          items: [
            new BottomNavigationBarItem(
              icon: new Icon(
                Icons.message
                ),
              activeIcon: new Icon(
                Icons.satellite,
              ),
              title: new Text(
                'Primite'
                ),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(
                Icons.message
              ),
              title: new Text(
                'Trimise'
              )
            )
          ],
        ),
      ),
    );
  }
}
