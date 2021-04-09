import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pawfecto/screens/user/adopt/pet_details.dart';
import 'package:pawfecto/screens/user/profile.dart';
import 'package:pawfecto/screens/user/sidebar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pawfecto/screens/auth/adopt_login.dart';

class AdoptMain extends StatefulWidget {
  static const String id = 'adopt_main';
  @override
  _AdoptMainState createState() => _AdoptMainState();
}

class _AdoptMainState extends State<AdoptMain> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  String _uid;

  @override
  void initState() {
    super.initState();
    _uid = _auth.currentUser.uid;
  }

  int _selectedtype = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedtype = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _auth.currentUser.emailVerified
        ? Scaffold(
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              leading: Row(
                children: [
                  SizedBox(
                    width: 30.0,
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.menu,
                      color: Color(0xff008891),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, SideBar.id);
                    },
                  ),
                ],
              ),
              actions: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, ProfilePage.id);
                  },
                  child: CircleAvatar(
                    radius: 18.0,
                    backgroundImage: AssetImage('images/cat1.jpg'),
                  ),
                ),
                SizedBox(
                  width: 30.0,
                ),
              ],
            ),
            backgroundColor: Colors.white,
            body: SafeArea(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.dog,
                          color: _selectedtype == 0
                              ? Color.fromARGB(255, 0, 136, 145)
                              : Colors.grey,
                        ),
                        iconSize: 30.0,
                        onPressed: () {
                          _onItemTapped(0);
                        },
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.cat,
                          color: _selectedtype == 1
                              ? Color.fromARGB(255, 0, 136, 145)
                              : Colors.grey,
                        ),
                        iconSize: 30.0,
                        onPressed: () {
                          _onItemTapped(1);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    // height: 500.0,

                    decoration: BoxDecoration(
                      color: Color(0xffF6F6F6),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(50.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          StreamBuilder<QuerySnapshot>(
                            stream:
                                _firestore.collection('shelters').snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              List pets = [];
                              List allpets = [];
                              List<Widget> dogCards = [];
                              List<Widget> catCards = [];

                              final shelters = snapshot.data.docs;

                              for (var shelter in shelters) {
                                pets = shelter.data()["pets"];
                                for (var eachpet in pets) {
                                  allpets.add(eachpet);
                                }
                              }

                              for (var pet in allpets) {
                                if (pet["type"] == "Dog") {
                                  final dogCard = Padding(
                                    padding: EdgeInsets.only(
                                      top: 20.0,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => PetDetails(
                                              pet: pet,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Card(
                                        shadowColor: Colors.grey,
                                        elevation: 5,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.70,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.80,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: (pet["imageURL"] ==
                                                            null)
                                                        ? AssetImage(
                                                            'images/dog1.jpg')
                                                        : NetworkImage(
                                                            pet["imageURL"]),
                                                    fit: BoxFit.fill,
                                                  ),
                                                  shape: BoxShape.rectangle,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.85,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: <Widget>[
                                                            Text(
                                                              pet["name"] ==
                                                                      null
                                                                  ? "No name"
                                                                  : pet["name"],
                                                              style: TextStyle(
                                                                fontSize: 25.0,
                                                                color: Colors
                                                                    .blueGrey,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Icon(
                                                              pet["gender"] == 'Male'
                                                                  ? FontAwesomeIcons
                                                                      .mars
                                                                  : FontAwesomeIcons
                                                                      .venus,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      0,
                                                                      136,
                                                                      145),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 3,
                                                        ),
                                                        Text(
                                                          '${pet["breed"] == null ? "No breed" : pet["breed"]}, ${pet["age"] == null ? "No age" : pet["age"]} years',
                                                          style: TextStyle(
                                                            fontSize: 16.0,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20.0),
                                                      child: Icon(
                                                        FontAwesomeIcons.heart,
                                                        color: Color.fromARGB(
                                                            255, 0, 136, 145),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                  dogCards.add(dogCard);
                                } else {
                                  final catCard = Padding(
                                    padding: EdgeInsets.only(
                                      top: 20.0,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => PetDetails(
                                              pet: pet,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Card(
                                        shadowColor: Colors.grey,
                                        elevation: 5,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.70,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.80,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: (pet["imageURL"] ==
                                                            null)
                                                        ? AssetImage(
                                                            'images/dog1.jpg')
                                                        : NetworkImage(
                                                            pet["imageURL"]),
                                                    fit: BoxFit.fill,
                                                  ),
                                                  shape: BoxShape.rectangle,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.85,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: <Widget>[
                                                            Text(
                                                              pet["name"] ==
                                                                      null
                                                                  ? "No name"
                                                                  : pet["name"],
                                                              style: TextStyle(
                                                                fontSize: 25.0,
                                                                color: Colors
                                                                    .blueGrey,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Icon(
                                                              pet["gender"] == 'Male'
                                                                  ? FontAwesomeIcons
                                                                      .mars
                                                                  : FontAwesomeIcons
                                                                      .venus,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      0,
                                                                      136,
                                                                      145),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 3,
                                                        ),
                                                        Text(
                                                          '${pet["breed"] == null ? "No breed" : pet["breed"]}, ${pet["age"] == null ? "No age" : pet["age"]} years',
                                                          style: TextStyle(
                                                            fontSize: 16.0,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20.0),
                                                      child: Icon(
                                                        FontAwesomeIcons.heart,
                                                        color: Color.fromARGB(
                                                            255, 0, 136, 145),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                  catCards.add(catCard);
                                }
                              }
                              return Column(
                                children:
                                    _selectedtype == 0 ? dogCards : catCards,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
          )
        : Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/email_verification.jpg',
                    height: 150.0,
                    width: 150.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Please Verify your email to continue',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xff008891),
                      ),
                    ),
                    onPressed: () {
                      _auth.signOut();
                      Navigator.popAndPushNamed(context, AdoptLogin.id);
                    },
                    child: Text('BACK'),
                  ),
                ],
              ),
            ),
          );
  }
}
