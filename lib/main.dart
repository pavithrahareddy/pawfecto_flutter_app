import 'package:flutter/material.dart';
import 'package:pawfecto/screens/auth/adopt_login.dart';
import 'package:pawfecto/screens/auth/adopt_register.dart';
import 'package:pawfecto/screens/auth/shelter_login.dart';
import 'package:pawfecto/screens/auth/shelter_register.dart';
import 'package:pawfecto/screens/shelter/addEvent.dart';
import 'package:pawfecto/screens/shelter/addPet.dart';
import 'package:pawfecto/screens/shelter/appointments.dart';
import 'package:pawfecto/screens/shelter/lost_and_found.dart';
import 'package:pawfecto/screens/shelter/registeredUsers.dart';
import 'package:pawfecto/screens/shelter/shelter_main_events.dart';
import 'package:pawfecto/screens/shelter/shelter_profile.dart';
import 'package:pawfecto/screens/shelter/sheltersidebar.dart';
import 'package:pawfecto/screens/user/LostandFound/LAF_page.dart';
import 'package:pawfecto/screens/user/LostandFound/lost_and_found.dart';
// import 'package:pawfecto/screens/user/LostandFound/straypet_form.dart';
import 'package:pawfecto/screens/user/Pawstagram/pawstagram.dart';
import 'package:pawfecto/screens/user/adopt/adopt_form.dart';
import 'package:pawfecto/screens/user/adopt/favourites.dart';
import 'package:pawfecto/screens/user/adopt_main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:pawfecto/screens/user/donation/donate_form.dart';
import 'package:pawfecto/screens/user/donation/donate_page.dart';
import 'package:pawfecto/screens/user/donation/donators.dart';
import 'package:pawfecto/screens/user/events/event_register.dart';
import 'package:pawfecto/screens/user/adopt/pet_details.dart';
import 'package:pawfecto/screens/user/events/event_details.dart';
import 'package:pawfecto/screens/user/profile.dart';
import 'package:pawfecto/screens/user/settings.dart';
import 'package:pawfecto/screens/user/sidebar.dart';
import 'package:pawfecto/screens/welcome.dart';
import 'package:pawfecto/screens/shelter/shelter_main_pet.dart';
import 'package:pawfecto/screens/shelter/donation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DotEnv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        AdoptForm.id: (context) => AdoptForm(),
        ProfilePage.id: (context) => ProfilePage(),
        DonatePage.id: (context) => DonatePage(),
        DonateForm.id: (context) => DonateForm(),
        LAFPage.id: (context) => LAFPage(),
        // StrayPetForm.id: (context) => StrayPetForm(),
        LostAndFound.id: (context) => LostAndFound(),
        DonationDetails.id: (context) => DonationDetails(),
        Donators.id: (context) => Donators(),
        ShelterProfile.id: (context) => ShelterProfile(),
        RegisteredUsers.id: (context) => RegisteredUsers(),
        Settings.id: (context) => Settings(),
        Favorites.id: (context) => Favorites(),
        Appointments.id: (context) => Appointments(),
        Pawstagram.id: (context) => Pawstagram(),
        LostPets.id: (context) => LostPets(),
      },
    );
  }
}
