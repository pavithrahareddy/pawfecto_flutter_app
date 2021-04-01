import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            GestureDetector(
                              child: Image(
                                image: NetworkImage(pet["imageURL"]),
                                width: 150.0,
                                height: 250.0,
                              ),
                              onTap: () {},
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        pet["name"],
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      Text(
                                        pet["breed"],
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ],
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
