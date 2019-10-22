import 'package:flutter/material.dart';

void main() => runApp(MyApp());

Map<int, Color> primaryDarkBlue_map =
{
  50:Color.fromRGBO(8,13,24, .1),
  100:Color.fromRGBO(8,13,24, .2),
  200:Color.fromRGBO(8,13,24, .3),
  300:Color.fromRGBO(8,13,24, .4),
  400:Color.fromRGBO(8,13,24, .5),
  500:Color.fromRGBO(8,13,24, .6),
  600:Color.fromRGBO(8,13,24, .7),
  700:Color.fromRGBO(8,13,24, .8),
  800:Color.fromRGBO(8,13,24, .9),
  900:Color.fromRGBO(8,13,24, 1),
};

MaterialColor primaryDarkBlue = MaterialColor(0xFF14213d, primaryDarkBlue_map);

Map<int, Color> secondaryPopYellow_map = {
  50:Color.fromRGBO(99, 64, 7, .1),
  100:Color.fromRGBO(99, 64, 7, .2),
  200:Color.fromRGBO(99, 64, 7, .3),
  300:Color.fromRGBO(99, 64, 7, .4),
  400:Color.fromRGBO(99, 64, 7, .5),
  500:Color.fromRGBO(99, 64, 7, .6),
  600:Color.fromRGBO(99, 64, 7, .7),
  700:Color.fromRGBO(99, 64, 7, .8),
  800:Color.fromRGBO(99, 64, 7, .9),
  900:Color.fromRGBO(99, 64, 7, 1),
};

MaterialColor secondaryPopYellow = MaterialColor(0xFFfca311, secondaryPopYellow_map);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CARing',
      theme: ThemeData(
        primarySwatch: primaryDarkBlue,
        secondaryHeaderColor: secondaryPopYellow,
      ),
      home: MainPartPages(),
    );
  }
}

class MainPartPages extends StatefulWidget {
  MainPartPages({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MainPartPages> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 40, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Cont',
      style: optionStyle,
    ),
    Text(
      'Index 1: Mesaje',
      style: optionStyle,
    ),
    Text(
      'Index 2: Beneficii',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primaryDarkBlue,
        selectedItemColor: secondaryPopYellow,
        unselectedItemColor: Colors.white,
        selectedFontSize: 22,
        unselectedFontSize: 12,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            activeIcon: SizedBox.shrink(),
            title: Text('Cont')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            activeIcon: SizedBox.shrink(),
            title: Text('Mesaje'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            activeIcon: SizedBox.shrink(),
            title: Text('Beneficii'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}