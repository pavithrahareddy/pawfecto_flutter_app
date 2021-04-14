import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pawfecto/screens/auth/shelter_login.dart';
import 'package:pawfecto/screens/shelter/addPet.dart';
import 'package:pawfecto/screens/shelter/shelter_profile.dart';
import 'package:pawfecto/screens/shelter/sheltersidebar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShelterMainPet extends StatefulWidget {
  static const String id = 'shelter_main_pet';
  @override
  _ShelterMainPetState createState() => _ShelterMainPetState();
}

class _ShelterMainPetState extends State<ShelterMainPet> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  String _uid;
  bool isEmailSent = false;

  @override
  void initState() {
    super.initState();
    _uid = _auth.currentUser.uid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Navigator.pushNamed(context, ShelterSideBar.id);
              },
            ),
          ],
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ShelterProfile.id);
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
      floatingActionButton: _auth.currentUser.emailVerified
          ? FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, AddPet.id);
              },
              backgroundColor: Color.fromARGB(255, 0, 136, 145),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          : SizedBox.shrink(),
      //body area scrollable all events and pets
      body: SafeArea(
        child: SingleChildScrollView(
          child: _auth.currentUser.emailVerified
              ? Center(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffF6F6F6),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(50.0)),
                    ),
                    child: Column(
                      children: [
                        // main screen
                        StreamBuilder<QuerySnapshot>(
                          stream: _firestore.collection('shelters').snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            Widget noPetspage = Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                ),
                                Center(
                                  child: Image(
                                    image: AssetImage(
                                      'images/noPetsFound.jpg',
                                    ),
                                    height: 300.0,
                                    width: 320.0,
                                  ),
                                ),
                                Text(
                                  'No Pets Added!',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ],
                            );

                            List pets = [];
                            List<Widget> petCards = [];
                            final shelters = snapshot.data.docs;

                            // fetch the pets under the current user
                            for (var shelter in shelters) {
                              if (shelter.id == _uid) {
                                pets = shelter.data()["pets"];
                                break;
                              }
                            }

                            for (var pet in pets) {
                              final petCard = Padding(
                                padding: EdgeInsets.only(
                                  top: 20.0,
                                ),
                                child: Card(
                                  shadowColor: Colors.grey,
                                  elevation: 5,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
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
                                              image:
                                                  NetworkImage(pet["imageURL"]),
                                              fit: BoxFit.fill,
                                            ),
                                            shape: BoxShape.rectangle,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.85,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    pet["name"],
                                                    style: TextStyle(
                                                      fontSize: 25.0,
                                                      color: Colors.blueGrey,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${pet["breed"]}, ${pet["age"]}',
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
                                                  const EdgeInsets.all(20.0),
                                              child: GestureDetector(
                                                onTap: () {},
                                                child: Icon(
                                                  pet["gender"] == 'Male'
                                                      ? FontAwesomeIcons.mars
                                                      : FontAwesomeIcons.venus,
                                                  color: Color.fromARGB(
                                                      255, 0, 136, 145),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                              petCards.add(petCard);
                            }

                            print(petCards.length);

                            return petCards.length == 0
                                ? noPetspage
                                : Column(children: petCards);
                          },
                        )
                      ],
                    ),
                  ),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.35,
                      ),
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
                          backgroundColor: isEmailSent
                              ? MaterialStateProperty.all<Color>(Colors.grey)
                              : MaterialStateProperty.all<Color>(
                                  Color(0xff008891),
                                ),
                        ),
                        onPressed: !isEmailSent
                            ? () {
                                _auth.currentUser.sendEmailVerification();
                                setState(() {
                                  isEmailSent = true;
                                });
                              }
                            : null,
                        child: Text('RESEND VERIFICATION EMAIL'),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xff008891),
                          ),
                        ),
                        onPressed: () {
                          _auth.signOut();
                          Navigator.popAndPushNamed(context, ShelterLogin.id);
                        },
                        child: Text('BACK'),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
