import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pawfecto/screens/shelter/addEvent.dart';
import 'package:pawfecto/screens/shelter/addPet.dart';
import 'package:pawfecto/screens/shelter/sheltersidebar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShelterMainEvents extends StatefulWidget {
  static const String id = 'shelter_main_event';
  @override
  _ShelterMainEventsState createState() => _ShelterMainEventsState();
}

class _ShelterMainEventsState extends State<ShelterMainEvents> {
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
          Navigator.pushNamed(context, AddEvent.id);
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

                  List events = [];
                  List<Widget> eventCards = [];
                  final shelters = snapshot.data.docs;
                  for (var shelter in shelters) {
                    if (shelter.id == _uid) {
                      events = shelter.data()["events"];
                      break;
                    }
                  }
                  if (events != []) {
                    for (var event in events) {
                      final eventCard = Card(
                        child: Column(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ListTile(
                                  title: Center(
                                      child: Text(
                                    event["name"] ?? 'Default',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  )),
                                  tileColor: Color.fromARGB(255, 0, 136, 145),
                                  subtitle: Center(
                                    child: Text(
                                      event["location"] ?? 'Default',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Image.network(
                                      event["imageURL"] ??
                                          'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg',
                                      scale: 0.5,
                                      height: 200,
                                      width: 150,
                                      fit: BoxFit.fitWidth),
                                ),
                                Container(
                                  color: Color.fromARGB(255, 202, 247, 227),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Date : ${event["date"] ?? '6th April 2021'}',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Time : ${event["time"] ?? '5:00 PM'}',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Description : ${event["description"] ?? 'Default'}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          TextButton(
                                            child: Text('Register'),
                                            style: TextButton.styleFrom(
                                              primary: Colors.white,
                                              backgroundColor: Colors.teal,
                                              onSurface: Colors.grey,
                                            ),
                                            onPressed: () {},
                                          ),
                                          const SizedBox(width: 15),
                                          TextButton(
                                            child: Text('Enquire'),
                                            style: TextButton.styleFrom(
                                              primary: Colors.white,
                                              backgroundColor: Colors.teal,
                                              onSurface: Colors.grey,
                                            ),
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                      eventCards.add(eventCard);
                    }
                  }

                  return Column(
                    children: eventCards,
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
