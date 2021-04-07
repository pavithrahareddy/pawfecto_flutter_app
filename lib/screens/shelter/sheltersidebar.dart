import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pawfecto/screens/auth/shelter_login.dart';
import 'package:pawfecto/screens/shelter/donation.dart';
import 'package:pawfecto/screens/shelter/shelter_main_events.dart';
import 'package:pawfecto/screens/shelter/shelter_main_pet.dart';
import 'package:pawfecto/screens/shelter/shelter_profile.dart';

class ShelterSideBar extends StatefulWidget {
  static const String id = 'shelter_sidebar';
  @override
  _ShelterSideBarState createState() => _ShelterSideBarState();
}

class _ShelterSideBarState extends State<ShelterSideBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff008891),
      body: Container(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45.0),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Positioned(
                  top: MediaQuery.of(context).size.height * .05,
                  left: 0,
                  child: GestureDetector(
                    child: Icon(
                      FontAwesomeIcons.arrowLeft,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * .18,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.popAndPushNamed(
                                context, ShelterProfile.id);
                          },
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.userAlt,
                                color: Colors.white.withOpacity(0.7),
                              ),
                              SizedBox(
                                width: 30.0,
                              ),
                              Text(
                                'Profile',
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
                            Navigator.popAndPushNamed(
                                context, ShelterMainPet.id);
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
                            Navigator.popAndPushNamed(
                                context, ShelterMainEvents.id);
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
                            Navigator.popAndPushNamed(
                                context, DonationDetails.id);
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
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * .77,
                  child: Row(
                    children: [
                      Material(
                        elevation: 5.0,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, ShelterLogin.id);
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
