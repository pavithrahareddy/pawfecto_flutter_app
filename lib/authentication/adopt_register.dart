import 'package:flutter/material.dart';
import 'package:pawfecto/authentication/adopt_login.dart';
import 'package:pawfecto/components/rounded_button.dart';
import 'package:pawfecto/constants.dart';

class AdoptRegister extends StatefulWidget {
  static const String id = 'adopt_register';
  @override
  _AdoptRegisterState createState() => _AdoptRegisterState();
}

class _AdoptRegisterState extends State<AdoptRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                      'REGISTER USER',
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
                      hintText: 'Enter Name',
                      labelText: 'NAME',
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    decoration: textinputdecoration.copyWith(
                      hintText: 'Enter Email',
                      labelText: 'EMAIL',
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    decoration: textinputdecoration.copyWith(
                      hintText: 'Enter Phone Number',
                      labelText: 'PHONE',
                    ),
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
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RoundedButton(
                    title: 'REGISTER',
                    colour: Color.fromARGB(255, 0, 136, 145),
                    tcolor: Colors.white,
                    onPressed: () {
                      // must register to firebase
                    },
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: GestureDetector(
                        child: Text("Already a user? Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 17,
                                decoration: TextDecoration.underline,
                                color: Color.fromARGB(255, 0, 136, 145))),
                        onTap: () {
                          Navigator.pushNamed(context, AdoptLogin.id);
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
