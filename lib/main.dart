import 'package:flutter/material.dart';
import 'package:pawfecto/screens/auth/adopt_login.dart';
import 'package:pawfecto/screens/auth/adopt_register.dart';
import 'package:pawfecto/screens/auth/shelter_login.dart';
import 'package:pawfecto/screens/auth/shelter_register.dart';
import 'package:pawfecto/screens/shelter/sheltersidebar.dart';
import 'package:pawfecto/screens/user/adopt_main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pawfecto/screens/user/pet_details.dart';
import 'package:pawfecto/screens/user/sidebar.dart';
import 'package:pawfecto/screens/welcome.dart';
import 'package:pawfecto/screens/shelter/shelter_main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

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
        AdoptMain.id: (context) => AdoptMain(),
        ShelterMain.id: (context) => ShelterMain(),
        SideBar.id: (context) => SideBar(),
        PetDetails.id: (context) => PetDetails(),
        ShelterSideBar.id: (context) => ShelterSideBar(),
      },
    );
  }
}
