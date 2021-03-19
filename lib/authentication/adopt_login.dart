import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pawfecto/authentication/adopt_main.dart';
import 'package:pawfecto/authentication/adopt_register.dart';
import 'package:pawfecto/components/rounded_button.dart';
import 'package:pawfecto/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class AdoptLogin extends StatefulWidget {
  static const String id = 'adopt_login';
  @override
  _AdoptLoginState createState() => _AdoptLoginState();
}

class _AdoptLoginState extends State<AdoptLogin> {
  final _auth = FirebaseAuth.instance;
  bool isLoading = false;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: SafeArea(
          top: true,
          bottom: true,
          right: true,
          left: true,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: Image.asset('images/pawsfecto.png'),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Container(
                      child: Text(
                        'USER LOGIN',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 136, 145),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 38.0,
                    ),
                    TextFormField(
                      decoration: textinputdecoration.copyWith(
                        hintText: 'Enter Email',
                        labelText: 'EMAIL',
                      ),
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: textinputdecoration.copyWith(
                        hintText: 'Enter Password',
                        labelText: 'PASSWORD',
                      ),
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RoundedButton(
                      title: 'LOGIN',
                      colour: Color.fromARGB(255, 0, 136, 145),
                      tcolor: Colors.white,
                      onPressed: () async {
                        // set spinner to true
                        setState(() {
                          isLoading = true;
                        });

                        try {
                          final user = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);

                          if (user != null) {
                            Navigator.pushNamed(context, AdoptMain.id);
                          }

                          // set spinner to false
                          setState(() {
                            isLoading = false;
                          });
                        } catch (e) {
                          print(e);
                        }
                      },
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      alignment: Alignment.center,
                      child: GestureDetector(
                        child: Text(
                          'FORGOT PASSWORD?',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 136, 145),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          //for forgot password
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      alignment: Alignment.center,
                      child: GestureDetector(
                          child: Text("Don't have an account? Register",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 17,
                                  decoration: TextDecoration.underline,
                                  color: Color.fromARGB(255, 0, 136, 145))),
                          onTap: () {
                            Navigator.pushNamed(context, AdoptRegister.id);
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
