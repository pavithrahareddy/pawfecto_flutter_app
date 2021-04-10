import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pawfecto/screens/auth/adopt_login.dart';
import 'package:pawfecto/screens/shelter/appointments.dart';
import 'package:pawfecto/screens/shelter/donation.dart';
import 'package:pawfecto/screens/shelter/lost_and_found.dart';
import 'package:pawfecto/screens/shelter/shelter_main_events.dart';
import 'package:pawfecto/screens/shelter/shelter_main_pet.dart';

class ShelterSideBar extends StatefulWidget {
  static const String id = 'shelter_sidebar';

  @override
  _ShelterSideBarState createState() => _ShelterSideBarState();
}

class _ShelterSideBarState extends State<ShelterSideBar> {
  String selectedMenuItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff008891),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff008891),
      ),
      body: Container(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage('images/cat1.jpg'),
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    Text(
                      'Hello there!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 22.0,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(context, ShelterMainPet.id);
                  },
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.paw,
                        color: Colors.white.withOpacity(0.7),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        'Pets',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(context, ShelterMainEvents.id);
                  },
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.calendar,
                        color: Colors.white.withOpacity(0.7),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        'Events',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(context, Appointments.id);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Colors.white.withOpacity(0.7),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        'Adopters',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(context, DonationDetails.id);
                  },
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.donate,
                        color: Colors.white.withOpacity(0.7),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        'Donation',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedMenuItem = 'lostandfound';
                      Navigator.pushNamed(context, LostPets.id);
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.phoneAlt,
                        color: Colors.white.withOpacity(0.7),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        'Lost And Found',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.cog,
                        color: Colors.white.withOpacity(0.7),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        'Settings',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Material(
                      elevation: 5.0,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, AdoptLogin.id, (route) => false);
                        },
                        minWidth: 150.0,
                        height: 30.0,
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 0, 136, 145),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
