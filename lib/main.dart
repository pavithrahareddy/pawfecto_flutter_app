import 'package:flutter/material.dart';
import 'package:pawfecto/screens/auth/adopt_login.dart';
import 'package:pawfecto/screens/auth/adopt_register.dart';
import 'package:pawfecto/screens/auth/shelter_login.dart';
import 'package:pawfecto/screens/auth/shelter_register.dart';
import 'package:pawfecto/screens/shelter/addEvent.dart';
import 'package:pawfecto/screens/shelter/addPet.dart';
import 'package:pawfecto/screens/shelter/shelter_main_events.dart';
import 'package:pawfecto/screens/shelter/sheltersidebar.dart';
import 'package:pawfecto/screens/user/adopt/adopt_form.dart';
import 'package:pawfecto/screens/user/adopt_main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pawfecto/screens/user/events/event_register.dart';
import 'file:///C:/Users/PavithraReddy/AndroidStudioProjects/pawfecto/lib/screens/user/events/event_details.dart';
import 'file:///C:/Users/PavithraReddy/AndroidStudioProjects/pawfecto/lib/screens/user/adopt/pet_details.dart';
import 'package:pawfecto/screens/user/sidebar.dart';
import 'package:pawfecto/screens/welcome.dart';
import 'package:pawfecto/screens/shelter/shelter_main_pet.dart';

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
        ShelterMainPet.id: (context) => ShelterMainPet(),
        ShelterMainEvents.id: (context) => ShelterMainEvents(),
        SideBar.id: (context) => SideBar(),
        PetDetails.id: (context) => PetDetails(),
        ShelterSideBar.id: (context) => ShelterSideBar(),
        AddPet.id: (context) => AddPet(),
        AddEvent.id: (context) => AddEvent(),
        EventDetails.id: (context) => EventDetails(),
        EventRegister.id: (context) => EventRegister(),
        AdoptForm.id:(context) =>AdoptForm(),
      },
    );
  }
}
