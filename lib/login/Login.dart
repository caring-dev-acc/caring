import 'package:flutter/material.dart';
import 'package:CARing/packages/CARing.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool SigninForm;
  void initState() {
    super.initState();
    SigninForm = true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (!SigninForm) {
          setState(() {
            SigninForm = true;
          });
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: primaryDarkBlue,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 30.0),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 60.0,
                  child: Image.asset(CARing.logo_path_200),
                ),
              ),
              SizedBox(height: 10.0),
              AnimatedSwitcher(
                child: SigninForm ? LoginForm() : SignupForm(),
                duration: Duration(milliseconds: 200),
              ),
              SizedBox(height: 20.0),
              Text(
                SigninForm ? 'Nu ai cont ?' : 'Ai deja cont ?',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(height: 10.0),
              OutlineButton(
                borderSide: BorderSide(color: Colors.white, width: 0.6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(10.0),
                textColor: Colors.white,
                child: SigninForm
                    ? Text(
                        'Înregistrează-te',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    : Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    SigninForm = !SigninForm;
                  });
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.all(10.0),
                textColor: Colors.white,
                color: Colors.red,
                child: Text('Autentificare cu Google',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final FocusNode passwordField = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Autentificare',
            style: TextStyle(color: primaryDarkBlue,fontSize: 30, fontWeight: FontWeight.bold),
            //style: Theme.of(context).textTheme.display1,
          ),
          SizedBox(height: 10.0),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryDarkBlue, width: 1.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryDarkBlue, width: 1.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              contentPadding: EdgeInsets.all(15.0),
              labelText: 'Nume utilizator / Număr înmatriculare',
              labelStyle: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(passwordField),
          ),
          SizedBox(height: 15.0),
          TextFormField(
            focusNode: passwordField,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryDarkBlue, width: 1.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryDarkBlue, width: 1.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              contentPadding: EdgeInsets.all(15.0),
              labelText: 'Parola',
              labelStyle: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
            obscureText: true,
            autofocus: false,
            validator: (value) {
              if (value.isEmpty) {
                return 'Parola este obligatoriu de completat.';
              }
              if (value.length < 6) {
                return 'Parola este prea scurtă.';
              }
            },
          ),
          SizedBox(height: 20.0),
          Container(
            width: double.infinity,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(10.0),
              color: secondaryPopYellow,
              textColor: primaryDarkBlue,
              child: Text('Autentificare',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class SignupForm extends StatelessWidget {
  final FocusNode passwordField = FocusNode();
  final FocusNode confirmPasswordField = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: <Widget>[
          Text(
            'Înregistrare',
            style: TextStyle(color: primaryDarkBlue,fontSize: 30, fontWeight: FontWeight.bold),
            //style: Theme.of(context).textTheme.display1,
          ),
          SizedBox(height: 10.0),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryDarkBlue, width: 1.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryDarkBlue, width: 1.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              contentPadding: EdgeInsets.all(15.0),
              labelText: 'Nume utilizator / Număr înmatriculare',
              labelStyle: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(passwordField),
          ),
          SizedBox(height: 15.0),
          TextFormField(
            focusNode: passwordField,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryDarkBlue, width: 1.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryDarkBlue, width: 1.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              contentPadding: EdgeInsets.all(15.0),
              labelText: 'Parola',
              labelStyle: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
            obscureText: true,
            autofocus: false,
            validator: (value) {
              if (value.isEmpty) {
                return 'Parola este obligatoriu de completat.';
              }
              if (value.length < 6) {
                return 'Parola este prea scurtă.';
              }
            },
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(confirmPasswordField),
          ),
          SizedBox(height: 15.0),
          TextFormField(
            focusNode: confirmPasswordField,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryDarkBlue, width: 1.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryDarkBlue, width: 1.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              contentPadding: EdgeInsets.all(15.0),
              labelText: 'Confirmă parola',
              labelStyle: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
            obscureText: true,
            autofocus: false,
            validator: (value) {
              if (value.isEmpty) {
                return 'Parola este obligatoriu de completat.';
              }
              if (value.length < 6) {
                return 'Parola este prea scurtă.';
              }
            },
          ),
          SizedBox(height: 30.0),
          Container(
            width: double.infinity,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(10.0),
              color: secondaryPopYellow,
              textColor: primaryDarkBlue,
              child: Text('Înregistrare',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
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
        radius: 80.0,
        child: Image.asset('assets/caring200x200.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Nume utilizator / Număr înmatriculare',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Parola este obligatorie de completat!';
        }
      },
      decoration: InputDecoration(
        hintText: 'Parola',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {},
        padding: EdgeInsets.all(12),
        color: primaryDarkBlue,
        child: Text('Autentificare', style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Ai uitat parola?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 25.0, right: 25.0),
          children: <Widget>[
            SizedBox(height: 120.0),
            logo,
            SizedBox(height: 40.0),
            email,
            SizedBox(height: 10.0),
            password,
            SizedBox(height: 20.0),
            loginButton,
            SizedBox(height: 10.0),
            forgotLabel,
            SizedBox(height: 110.0),
          ],
        ),
      ),
    );
  }
}
*/
