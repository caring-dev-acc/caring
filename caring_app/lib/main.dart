import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      home: MyHomePage(title: 'CARing'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    Firestore.instance.collection('books').document()
  .setData({ 'title': 'title', 'author': 'author' });
  }

  @override
  Widget build(BuildContext context) {
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: ListView(
          
            children:<Widget>[Text('World Hello! This is the first testing of the app...we will start slowly, as slowly as possible.'
                'This is the main screen, and we will add widgets and whatnot.'),
                Text('tesst'),
                const Image(
                  image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                )
                ]
        )
    );

  }
}