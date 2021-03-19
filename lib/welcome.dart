import 'package:flutter/material.dart';
import 'package:pawfecto/authentication/adopt_register.dart';
import 'package:pawfecto/authentication/shelter_register.dart';
import 'package:pawfecto/components/rounded_button.dart';

class Welcome extends StatefulWidget {
  static const String id = 'welcome';
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        bottom: true,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 160, horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: Image.asset('images/pawsfecto.png'),
                    ),
                    SizedBox(
                      height: 48.0,
                    ),
                    RoundedButton(
                      title: 'Adopt',
                      colour: Color.fromARGB(255, 202, 247, 227),
                      tcolor: Color.fromARGB(255, 0, 136, 145),
                      onPressed: () {
                        Navigator.pushNamed(context, AdoptRegister.id);
                      },
                    ),
                    RoundedButton(
                      title: 'Shelter',
                      colour: Color.fromARGB(255, 0, 136, 145),
                      tcolor: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, SRegister.id);
                      },
                    ),
                    RoundedButton(
                      title: 'Report',
                      colour: Color.fromARGB(255, 218, 120, 120),
                      tcolor: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, AdoptRegister.id);
                      },
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 70,
                color: Color.fromARGB(255, 202, 247, 227),
                child: GestureDetector(
                    child: Text("Terms and Conditions\nPrivacy Policy",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17,
                            // decoration: TextDecoration.underline,
                            color: Color.fromARGB(255, 0, 136, 145))),
                    onTap: () {
                      // link to terms and conditions
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
