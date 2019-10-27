import 'package:CARing/main.dart';
import 'package:flutter/material.dart';

// Simple variable to check if the user is logged
var isLogged = true;

class RegisterPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryDarkBlue,
        body: SafeArea(
          top: true,
          bottom: true,
          child: Container(
            child: new Container(
              child: Text(
                'Bine ai \nvenit pe \nCARing!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                ),
              ),
              //color: Colors.red,
            ),
            padding: EdgeInsets.all(30),
          ),
        ));
  }
}

final _formKey = GlobalKey<FormState>();

class RegisterForm extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Form(
      key: _formKey,
      child: Column(children: <Widget>[
        Text('Numele meu este...'),
        TextFormField(),
        Text('Sunt un...'),
        TextFormField(),
        Text('Mail-ul meu este...'),
        TextFormField(),
        Text('Și îmi doresc parola...'),
        TextFormField(),
        Text('Scrisă încă odată...'),
        TextFormField(),
      ],)
    );
  }
}
