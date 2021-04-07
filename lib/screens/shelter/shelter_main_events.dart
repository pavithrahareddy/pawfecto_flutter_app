import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pawfecto/screens/shelter/addEvent.dart';
import 'package:pawfecto/screens/shelter/registeredUsers.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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

                  Widget noEventspage = Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                      Center(
                        child: Image(
                          image: AssetImage(
                            'images/noEvents.jpg',
                          ),
                          height: 280.0,
                          width: 330.0,
                        ),
                      ),
                      Text(
                        'No Events Added!',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  );

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
                      final eventCard = Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisteredUsers(
                                        event: event,
                                      ),
                                    ),
                                  );
                                },
                                child: Column(
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
                                          color: Colors.black,
                                        ),
                                      )),
                                      tileColor:
                                          Color.fromARGB(255, 202, 247, 227),
                                      subtitle: Center(
                                        child: Text(
                                          event["location"] ?? 'Default',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.88,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.4,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(event[
                                                  "imageURL"] ??
                                              'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/322868_1100-800x825.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Container(),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 12.0, bottom: 12.0),
                                                child: Text(
                                                  '${event["description"] ?? 'Default'}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Date : ${event["date"] ?? '6th April 2021'}',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Time : ${event["time"] ?? '5:00 PM'}',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );

                      eventCards.add(eventCard);
                    }
                  }

                  return eventCards.length == 0
                      ? noEventspage
                      : Column(
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
