import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pawfecto/screens/user/sidebar.dart';
import 'package:pawfecto/screens/user/adopt/pet_details.dart';
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
    print(_auth.currentUser.emailVerified);
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
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              leading: GestureDetector(
                child: Icon(
                  Icons.menu,
                  color: Color(0xff008891),
                ),
                onTap: () {
                  Navigator.pushNamed(context, SideBar.id);
                },
              ),
              title: Text(
                'Pets',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              actions: <Widget>[
                Icon(
                  Icons.location_on,
                  color: Color(0xff008891),
                ),
                SizedBox(
                  width: 15,
                ),
                CircleAvatar(
                  radius: 15.0,
                  backgroundImage: AssetImage('images/profile.png'),
                ),
              ],
            ),
            backgroundColor: Colors.white,
            body: SafeArea(
                child: SingleChildScrollView(
              child: Column(
                children: [
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
                                icon: Icon(
                                  FontAwesomeIcons.dog,
                                  color: Color.fromARGB(255, 0, 136, 145),
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
                                  color: Color.fromARGB(255, 0, 136, 145),
                                ),
                                iconSize: 30.0,
                                onPressed: () {
                                  _onItemTapped(1);
                                },
                              ),
                            ],
                          ),
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
                                    padding: const EdgeInsets.all(25.0),
                                    child: Container(
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            child: Image(
                                              image: (pet["imageURL"] == null)
                                                  ? AssetImage(
                                                      'images/dog1.jpg')
                                                  : NetworkImage(
                                                      pet["imageURL"]),
                                              width: 150.0,
                                              height: 250.0,
                                            ),
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, PetDetails.id);
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
                                                      pet["name"] == null
                                                          ? "No name"
                                                          : pet["name"],
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      pet["breed"] == null
                                                          ? "No breed"
                                                          : pet["breed"],
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
                                                      Icon(
                                                          FontAwesomeIcons
                                                              .phone,
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
                                  );
                                  dogCards.add(dogCard);
                                } else {
                                  final catCard = Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child: Container(
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            child: Image(
                                              image: (pet["imageURL"] == null)
                                                  ? AssetImage(
                                                  'images/dog1.jpg')
                                                  : NetworkImage(
                                                  pet["imageURL"]),
                                              width: 150.0,
                                              height: 250.0,
                                            ),
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, PetDetails.id);
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
                                                      pet["name"] == null
                                                          ? "No name"
                                                          : pet["name"],
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      pet["breed"] == null
                                                          ? "No breed"
                                                          : pet["breed"],
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
                                                      Icon(
                                                          FontAwesomeIcons
                                                              .phone,
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
