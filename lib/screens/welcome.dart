import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pawfecto/screens/auth/adopt_login.dart';
import 'package:pawfecto/screens/auth/shelter_login.dart';
import 'package:pawfecto/components/rounded_button.dart';
import 'package:url_launcher/url_launcher.dart';

class Welcome extends StatefulWidget {
  static const String id = 'welcome';
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final _turl =
      'https://drive.google.com/file/d/1zik_v5Avasv83EwWjmyM0qVx6R0_t45D/view?usp=sharing';
  final _purl =
      'https://drive.google.com/file/d/1Dx4VBTz9pw6v-oEVDEn-ug4LpHnquQOD/view?usp=sharing';

  void _tlaunchURL() async => await canLaunch(_turl)
      ? await launch(_turl)
      : throw 'Could not launch $_turl';

  void _plaunchURL() async => await canLaunch(_purl)
      ? await launch(_purl)
      : throw 'Could not launch $_purl';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/Home2.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .28,
            child: Container(
              width: MediaQuery.of(context).size.width * .8,
              height: 100.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/pawsfecto.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .43,
            child: Container(
              child: RoundedButton(
                title: 'ADOPT',
                colour: Color.fromARGB(255, 202, 247, 227),
                tcolor: Color.fromARGB(255, 0, 136, 145),
                onPressed: () {
                  Navigator.pushNamed(context, AdoptLogin.id);
                },
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .50,
            child: Container(
              child: RoundedButton(
                title: 'SHELTER',
                colour: Color.fromARGB(255, 0, 136, 145),
                tcolor: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, ShelterLogin.id);
                },
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .91,
            child: Container(
              child: Column(
                children: [
                  GestureDetector(
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 136, 145),
                      ),
                    ),
                    onTap: _plaunchURL,
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  GestureDetector(
                    child: Text(
                      'Terms and Conditions',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 136, 145),
                      ),
                    ),
                    onTap: _tlaunchURL,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
