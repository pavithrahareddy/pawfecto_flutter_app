import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pawfecto/screens/user/sidebar.dart';
import 'package:pawfecto/screens/user/pet_details.dart';

class AdoptMain extends StatefulWidget {
  static const String id = 'adopt_main';
  @override
  _AdoptMainState createState() => _AdoptMainState();
}

class _AdoptMainState extends State<AdoptMain> {
  final _auth = FirebaseAuth.instance;

  // FirebaseUser class was changed to User
  User loggedInUser;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Icon(
                        Icons.menu,
                        color: Color(0xff008891),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, SideBar.id);
                      },
                    ),
                    Column(
                      children: [
                        Text(
                          'Location',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Color(0xff008891),
                            ),
                            Text(
                              'Bangalore',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage: AssetImage('images/profile.png'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                // height: 500.0,
                color: Color(0xffF6F6F6),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(FontAwesomeIcons.dog),
                            iconSize: 30.0,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          IconButton(
                            icon: Icon(FontAwesomeIcons.cat),
                            iconSize: 30.0,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              GestureDetector(
                                child: Image(
                                  image: AssetImage('images/dog1.jpg'),
                                  // width: 150.0,
                                  // height: 250.0,
                                ),
                                onTap: () {
                                  Navigator.pushNamed(context, PetDetails.id);
                                },
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Ellie',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        Text(
                                          'Labrador',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.heart,
                                            color: Colors.redAccent,
                                          ),
                                          SizedBox(
                                            width: 30.0,
                                          ),
                                          Icon(FontAwesomeIcons.phone,
                                              color: Colors.green),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Image(
                                image: AssetImage('images/cat1.jpg'),
                                // width: 150.0,
                                // height: 250.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Elsa',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        Text(
                                          'Some cat',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.heart,
                                            color: Colors.redAccent,
                                          ),
                                          SizedBox(
                                            width: 20.0,
                                          ),
                                          Icon(FontAwesomeIcons.phone,
                                              color: Colors.green),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Image(
                                image: AssetImage('images/dog2.jpg'),
                                // width: 150.0,
                                // height: 250.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Snoopy',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        Text(
                                          'Pug',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.heart,
                                            color: Colors.redAccent,
                                          ),
                                          SizedBox(
                                            width: 20.0,
                                          ),
                                          Icon(FontAwesomeIcons.phone,
                                              color: Colors.green),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Image(
                                image: AssetImage('images/dog3.jpg'),
                                // width: 150.0,
                                // height: 250.0,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Mischief',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        Text(
                                          'Labrador',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.heart,
                                            color: Colors.redAccent,
                                          ),
                                          SizedBox(
                                            width: 20.0,
                                          ),
                                          Icon(FontAwesomeIcons.phone,
                                              color: Colors.green),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
