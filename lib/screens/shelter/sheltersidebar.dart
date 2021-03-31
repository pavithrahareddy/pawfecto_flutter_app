import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pawfecto/screens/auth/shelter_login.dart';
import 'package:pawfecto/screens/shelter/addEvent.dart';
import 'package:pawfecto/screens/shelter/addPet.dart';

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
                      backgroundImage: AssetImage('images/profile.png'),
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    Text(
                      'Alexa',
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
                    setState(() {
                      selectedMenuItem = 'profile';
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.userAlt,
                        color: selectedMenuItem == 'profile'
                            ? Colors.white
                            : Colors.white.withOpacity(0.7),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                          color: selectedMenuItem == 'profile'
                              ? Colors.white
                              : Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // setState(() {
                    //   selectedMenuItem = 'addpet';
                    // });
                    Navigator.popAndPushNamed(context, AddPet.id);
                  },
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.paw,
                        color: selectedMenuItem == 'addpet'
                            ? Colors.white
                            : Colors.white.withOpacity(0.7),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        'Add Pet',
                        style: TextStyle(
                          color: selectedMenuItem == 'addpet'
                              ? Colors.white
                              : Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(context, AddEvent.id);
                  },
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.democrat,
                        color: selectedMenuItem == 'addevents'
                            ? Colors.white
                            : Colors.white.withOpacity(0.7),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        'Add Events',
                        style: TextStyle(
                          color: selectedMenuItem == 'addevents'
                              ? Colors.white
                              : Colors.white.withOpacity(0.7),
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
                      selectedMenuItem = 'settings';
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.cog,
                        color: selectedMenuItem == 'profile'
                            ? Colors.white
                            : Colors.white.withOpacity(0.7),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        'Settings',
                        style: TextStyle(
                          color: selectedMenuItem == 'settings'
                              ? Colors.white
                              : Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
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
        ),
      ),
    );
  }
}
