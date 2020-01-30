import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:cloud_firestore/cloud_firestore.dart';
=======
// Import screens from screens folder
import 'screens/Benefits.dart';
import 'screens/Conversations.dart';
import 'screens/Profile.dart';

// Import Auth from login folder

import 'login/Authentication.dart';
import 'login/Firebase.dart';
>>>>>>> John

void main() => runApp(MyApp());

};

MaterialColor primaryDarkBlue = MaterialColor(0xFF14213d, primaryDarkBlue_map);

Map<int, Color> secondaryPopYellow_map = {
};


class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MaterialApp(
      title: 'CARing',
      theme: ThemeData(
        primarySwatch: primaryDarkBlue,
        secondaryHeaderColor: secondaryPopYellow,
=======
    // TODO: implement build
    return new MaterialApp(
      color: secondaryPopYellow,
      home: DefaultTabController(
        length: 3,
        child: new Scaffold(
          body: TabBarView(
            children: [
              new Container(
                color: Colors.yellow, 
              ),
              new Contacts(''
              ),
              new Container(
                color: Colors.lightGreen,
              ),
            ],
          ),
          bottomNavigationBar: new TabBar(
            tabs: [
              Tab(
                icon: new Icon(Icons.account_circle),
                text: 'Cont',
              ),
              Tab(
                icon: new Icon(Icons.message),
                text: 'Mesaje',
                ),
              Tab(
                icon: new Icon(Icons.card_giftcard),
                text: 'Beneficii',
              ),
            ],
            labelColor: secondaryPopYellow,
            unselectedLabelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: secondaryPopYellow,
          ),
          backgroundColor: primaryDarkBlue,
        ),
>>>>>>> John
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
    Firestore.instance.collection('test').document()
  .setData({ 'test rand 1': 'merge', 'test rand 2': 'merge si asta' });
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