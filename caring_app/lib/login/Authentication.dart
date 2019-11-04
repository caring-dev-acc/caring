import 'package:CARing/main.dart';
import 'package:flutter/material.dart';

// Simple variable to check if the user is logged
var isLogged = true;

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'logo',
      child: Padding(
        padding: EdgeInsets.all(16.0),
          new Container(
            decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage('assets/caring.png')
              )
            ),
          )
      ),
    );

    final title = Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        'CARing',
        style: TextStyle(fontSize: 38.0, color: Colors.white),
      ),
    );

    final text = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Găsește instant șoferul doar pe baza plăcuței de înmatriculare',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 26.0, color: Colors.white),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      child: Column(
        children: <Widget>[logo, title, text],
      ),
    );

    return Scaffold(
      backgroundColor: primaryDarkBlue,
      body: body,
    );
  }
}

/*class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: Center(
          child: Text('Login screen'),
        )
      );
  }
} // TBC*/

class RegisterPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryDarkBlue,
        body: SafeArea(
          top: true,
          bottom: true,
          child: new Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    'Bine ai \nvenit pe \nCARing!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  //color: Colors.red,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                Container(
                  child: RegisterForm(),
                )
              ],
            ),
            padding: EdgeInsets.all(30),
          ),
        ));
  }
}

final _formKey = GlobalKey<FormState>();

class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                color: Colors.white,
                child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Numele meu este...', fillColor: Colors.white),
                  style: TextStyle(color: primaryDarkBlue),
                )),
            Container(
              color: Colors.white,
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Sunt un...'),
                style: TextStyle(color: primaryDarkBlue),
              ),
            ),
            Container(
              color: Colors.white,
              child: TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Mail-ul meu este...'),
                style: TextStyle(color: primaryDarkBlue),
              ),
            ),
            Container(
              color: Colors.white,
              child: TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Și îmi doresc parola...'),
                style: TextStyle(color: primaryDarkBlue),
                obscureText: true,
              ),
            ),
            Container(
              color: Colors.white,
              child: TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Scrisă încă odată...'),
                style: TextStyle(color: primaryDarkBlue),
                obscureText: true,
              ),
            )
          ],
        ));
  }
}