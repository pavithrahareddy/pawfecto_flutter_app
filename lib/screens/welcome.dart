import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pawfecto/screens/auth/adopt_register.dart';
import 'package:pawfecto/screens/auth/shelter_register.dart';
import 'package:pawfecto/components/rounded_button.dart';
import 'package:pawfecto/screens/user/sidebar.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 30.0, right: 30.0, bottom: 40.0),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset('images/pawsfecto.png'),
                ),
              ),
              flex: 4,
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RoundedButton(
                      title: 'ADOPT',
                      colour: Color.fromARGB(255, 202, 247, 227),
                      tcolor: Color.fromARGB(255, 0, 136, 145),
                      onPressed: () {
                        Navigator.pushNamed(context, AdoptRegister.id);
                      },
                    ),
                    RoundedButton(
                      title: 'SHELTER',
                      colour: Color.fromARGB(255, 0, 136, 145),
                      tcolor: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, SRegister.id);
                      },
                    ),
                    RoundedButton(
                      title: 'REPORT',
                      colour: Color.fromARGB(255, 218, 120, 120),
                      tcolor: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, SideBar.id);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
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
            ),
          ],
        ),
      ),
    );
  }
}
