import 'package:flutter/material.dart';
import 'package:pawfecto/authentication/adopt_login.dart';
import 'package:pawfecto/authentication/adopt_register.dart';
import 'package:pawfecto/authentication/shelter_login.dart';
import 'package:pawfecto/authentication/shelter_register.dart';
import 'package:pawfecto/welcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Welcome.id,
      routes: {
        Welcome.id: (context) => Welcome(),
        AdoptLogin.id: (context) => AdoptLogin(),
        ShelterLogin.id: (context) => ShelterLogin(),
        AdoptRegister.id: (context) => AdoptRegister(),
        SRegister.id: (context) => SRegister(),
      },
    );
  }
}
