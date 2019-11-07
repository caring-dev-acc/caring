import 'package:flutter/material.dart';

import 'package:CARing/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:CARing/login/button.dart';
import 'package:CARing/login/Authentication.dart';

var isLogged = true;

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LogIn();
}

class LogIn extends State<LoginPage> {
  TextEditingController name = new TextEditingController();
  TextEditingController pwd = new TextEditingController();
  final _formKey = new GlobalKey<FormState>();
  bool clickusename = false;
  bool _obscureText = true;
  bool _remember = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Column(
          children: <Widget>[
            _headerlogin(),
            _formlogin(),
            _buttomlogin(),
          ],
        ),
      ),
    );
  }

  Widget _headerlogin() {
    return Expanded(
        flex: 2,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: primaryDarkBlue,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    offset: Offset(0, 3), color: Colors.black38, blurRadius: 6)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Bine ai revenit pe CARing!',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ));
  }

  Widget _formlogin() {
    return Expanded(
      flex: 5,
      child: Container(
        padding: EdgeInsets.only(left: 32, right: 32, top: 32, bottom: 16),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('E-mail sau Nume utilizator'),
                SizedBox(height: 5),
                _email(),
                SizedBox(height: 5),
                Text('Parola'),
                SizedBox(height: 5),
                _password(),
                SizedBox(height: 5),
                _rememberMe(),
                SizedBox(height: 5),
                _buttonlogin(),
                SizedBox(height: 5),
                _forgetPassword(),
                SizedBox(height: 5),
                _signUp()
              ],
            )),
      ),
    );
  }

  Widget _rememberMe() => Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 8),
      child: Row(children: <Widget>[
        CupertinoSwitch(
            value: _remember,
            activeColor: primaryDarkBlue,
            onChanged: (bool value) => setState(() => _remember = value)),
        Text('Ține minte', style: TextStyle(color: Colors.black, fontSize: 13))
      ]));

  Widget _email() => TextFormField(
      controller: name,
      keyboardType: TextInputType.text,
      validator: _validatorUsername,
      decoration: InputDecoration(
          suffixIcon: clickusename
              ? IconButton(
                  icon: Icon(Icons.backspace),
                  onPressed: () {
                    setState(() {
                      name.text = '';
                    });
                  })
              : null,
          fillColor: Colors.white,
          focusColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: primaryDarkBlue, width: 3)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: primaryDarkBlue, width: 3)),
          prefixIcon: Icon(Icons.mail, size: 30, color: primaryDarkBlue),
          hintText: 'adresa@email.com',
          hintStyle: TextStyle(color: Color(0xFF7D8EA7))));

  Widget _password() => TextFormField(
      controller: pwd,
      obscureText: _obscureText,
      keyboardType: TextInputType.text,
      validator: _validatorPassword,
      decoration: InputDecoration(
          suffixIcon: GestureDetector(
              dragStartBehavior: DragStartBehavior.down,
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  semanticLabel:
                      _obscureText ? 'Arată parola' : 'Ascunde parola')),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: primaryDarkBlue, width: 3)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: primaryDarkBlue, width: 3)),
          prefixIcon: Icon(
            Icons.vpn_key,
            size: 30,
            color: primaryDarkBlue,
          ),
          hintText: '●●●●●●●●',
          hintStyle: TextStyle(fontSize: 10, color: Color(0xFF7D8EA7))));

  Widget _buttonlogin() {
    return Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  offset: Offset(0, 3), color: Colors.black12, blurRadius: 6)
            ]),
        child: RaisedButton(
            color: primaryDarkBlue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ButtonNavigationBarOwner()));
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Autentificare',
                      style: TextStyle(fontSize: 17, color: Colors.white))
                ])));
  }

  Widget _forgetPassword() => GestureDetector(
      onTap: () {},
      child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Ai uitat parola?',
                    style: TextStyle(color: Colors.black, fontSize: 15))
              ])));

  Widget _signUp() => Padding(
      padding: const EdgeInsets.only(top: 16),
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Text('Nu ai cont?',
            style: TextStyle(color: Colors.black, fontSize: 15)),
        GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterPart()));
            },
            child: Text('Înregistrează-te',
                style: TextStyle(
                    color: primaryDarkBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)))
      ]));

  Widget _buttomlogin() {
    return Expanded(
        flex: 2,
        child: Container(
            padding: EdgeInsets.all(32),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      child: Container(
                        color: Colors.black45,
                        height: 1,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                    ),
                    Text(
                      'Conectează-te cu',
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      child: Container(
                        color: Colors.black45,
                        height: 1,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _buttonLogInWithFB(),
                    _buttonLogInWithGoogle()
                  ],
                ),
              ],
            )));
  }

  Widget _buttonLogInWithFB() {
    return Container(
        height: 47.7,
        width: MediaQuery.of(context).size.width * 0.35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  offset: Offset(0, 3), color: Colors.black12, blurRadius: 6)
            ]),
        child: RaisedButton(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: primaryDarkBlue,
                width: 2,
              ),
            ),
            onPressed: () {},
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/facebook.png',
                    width: 35,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Facebook',
                      style: TextStyle(fontSize: 17, color: primaryDarkBlue))
                ])));
  }

  Widget _buttonLogInWithGoogle() {
    return Container(
        height: 47.7,
        width: MediaQuery.of(context).size.width * 0.35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  offset: Offset(0, 3), color: Colors.black12, blurRadius: 6)
            ]),
        child: RaisedButton(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(
                color: Colors.red,
                width: 2,
              ),
            ),
            onPressed: () {},
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <
                Widget>[
              Image.asset(
                'images/google.png',
                width: 35,
              ),
              SizedBox(
                width: 5,
              ),
              Text('G',
                  style: TextStyle(fontSize: 17, color: Colors.blue[600])),
              Text('o', style: TextStyle(fontSize: 17, color: Colors.red[600])),
              Text('o',
                  style: TextStyle(fontSize: 17, color: Colors.yellow[900])),
              Text('g',
                  style: TextStyle(fontSize: 17, color: Colors.blue[600])),
              Text('l', style: TextStyle(fontSize: 17, color: Colors.green)),
              Text('e', style: TextStyle(fontSize: 17, color: Colors.red[600])),
            ])));
  }

  String _validatorUsername(String value) {
    if (value.isEmpty) {
      return 'Email \/ Username can not Empty';
    }
  }

  String _validatorPassword(String value) {
    if (value.isEmpty) {
      return 'Password can not Empty';
    }
  }
}

/*
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 70.0,
        child: Image.asset('assets/caring.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: '',
      decoration: InputDecoration(
        hintText: 'Nume utilizator / Număr înmatriculare',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: '',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Parolă',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text("Îți sug pula fraiere"),
          actions: <Widget>[
            FlatButton(
              child: Text("Închide"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          _showDialog();
        },
        padding: EdgeInsets.all(12),
        color: primaryDarkBlue,
        child: Text('Autentificare', style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Ai uitat deja parola fmm?',
        style: TextStyle(color: Colors.black54),
      ),    
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            forgotLabel
          ],
        ),
      ),
    );
  }
}
*/