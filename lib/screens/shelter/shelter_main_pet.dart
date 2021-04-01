import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pawfecto/screens/shelter/addPet.dart';
import 'package:pawfecto/screens/shelter/sheltersidebar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShelterMainPet extends StatefulWidget {
  static const String id = 'shelter_main_pet';
  @override
  _ShelterMainPetState createState() => _ShelterMainPetState();
}

class _ShelterMainPetState extends State<ShelterMainPet> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  String _uid;
  void getUID() {
    setState(() {
      _uid = _auth.currentUser.uid;
    });
  }

  @override
  void initState() {
    super.initState();
    getUID();
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddPet.id);
        },
        backgroundColor: Color.fromARGB(255, 0, 136, 145),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      //body area scrollable all events and pets
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // appBar
              Container(
                color: Color.fromARGB(255, 0, 136, 145),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      GestureDetector(
                        child: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, ShelterSideBar.id);
                        },
                      ),
                      CircleAvatar(
                        radius: 20.0,
                        backgroundImage: AssetImage('images/profile.png'),
                      ),
                    ],
                  ),
                ),
              ),

              // main screen
              StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('shelters').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

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
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.width * 0.70,
                                width: MediaQuery.of(context).size.width * 0.80,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(pet["imageURL"]),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
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
                                    padding: const EdgeInsets.all(20.0),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                        pet["gender"] == 'Male'
                                            ? FontAwesomeIcons.mars
                                            : FontAwesomeIcons.venus,
                                        color: Color.fromARGB(255, 0, 136, 145),
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

                  return Column(
                    children: petCards,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
