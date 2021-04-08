import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pawfecto/screens/auth/adopt_login.dart';
import 'package:pawfecto/screens/user/LostandFound/LAF_page.dart';
import 'package:pawfecto/screens/user/Pawstagram/pawstagram.dart';
import 'package:pawfecto/screens/user/adopt/favourites.dart';
import 'package:pawfecto/screens/user/adopt_main.dart';
import 'package:pawfecto/screens/user/donation/donate_page.dart';
import 'package:pawfecto/screens/user/events/event_details.dart';
import 'package:pawfecto/screens/user/profile.dart';
import 'package:pawfecto/screens/user/settings.dart';

class SideBar extends StatefulWidget {
  static const String id = 'adopt_sidebar';

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
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
                // GestureDetector(
                //   onTap: () {
                //     setState(() {
                //       Navigator.pushNamed(context, ProfilePage.id);
                //       selectedMenuItem = 'profile';
                //     });
                //   },
                //   child: Row(
                //     children: [
                //       Icon(
                //         FontAwesomeIcons.userAlt,
                //         color: selectedMenuItem == 'profile'
                //             ? Colors.white
                //             : Colors.white.withOpacity(0.7),
                //       ),
                //       SizedBox(
                //         width: 30.0,
                //       ),
                //       Text(
                //         'Profile',
                //         style: TextStyle(
                //           color: selectedMenuItem == 'profile'
                //               ? Colors.white
                //               : Colors.white.withOpacity(0.7),
                //           fontWeight: FontWeight.w600,
                //           fontSize: 20.0,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushNamed(context, AdoptMain.id);
                      selectedMenuItem = 'adoption';
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.paw,
                        color: selectedMenuItem == 'adoption'
                            ? Colors.white
                            : Colors.white.withOpacity(0.7),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        'Adoption',
                        style: TextStyle(
                          color: selectedMenuItem == 'adoption'
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
                      Navigator.pushNamed(context, EventDetails.id);
                      selectedMenuItem = 'events';
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.calendar,
                        color: selectedMenuItem == 'events'
                            ? Colors.white
                            : Colors.white.withOpacity(0.7),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        'Events',
                        style: TextStyle(
                          color: selectedMenuItem == 'events'
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
                      Navigator.pushNamed(context, Pawstagram.id);
                      selectedMenuItem = 'pawstagram';
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.image,
                        color: selectedMenuItem == 'pawstagram'
                            ? Colors.white
                            : Colors.white.withOpacity(0.7),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        'Pawstagram',
                        style: TextStyle(
                          color: selectedMenuItem == 'pawstagram'
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
                      selectedMenuItem = 'lostandfound';
                      Navigator.pushNamed(context, LAFPage.id);
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.phoneAlt,
                        color: selectedMenuItem == 'lostandfound '
                            ? Colors.white
                            : Colors.white.withOpacity(0.7),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        'Lost And Found',
                        style: TextStyle(
                          color: selectedMenuItem == 'lostandfound '
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
                      Navigator.pushNamed(context, Favorites.id);
                      selectedMenuItem = 'favourites';
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.heart,
                        color: selectedMenuItem == 'favourites'
                            ? Colors.white
                            : Colors.white.withOpacity(0.7),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        'Favourites',
                        style: TextStyle(
                          color: selectedMenuItem == 'favourites'
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
                      selectedMenuItem = 'donation';
                      Navigator.pushNamed(context, DonatePage.id);
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.home,
                        color: selectedMenuItem == 'donation'
                            ? Colors.white
                            : Colors.white.withOpacity(0.7),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Text(
                        'Donation',
                        style: TextStyle(
                          color: selectedMenuItem == 'donation'
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
                      Navigator.pushNamed(context, Settings.id);
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
