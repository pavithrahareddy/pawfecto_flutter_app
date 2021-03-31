import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pawfecto/screens/shelter/sheltersidebar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShelterMain extends StatefulWidget {
  static const String id = 'shelter_main';
  @override
  _ShelterMainState createState() => _ShelterMainState();
}

class _ShelterMainState extends State<ShelterMain> {
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

  //Selecting navigator option
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              _selectedIndex == 0
                  ? StreamBuilder<QuerySnapshot>(
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
                  : StreamBuilder<QuerySnapshot>(
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
                                        event["name"],
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      )),
                                      tileColor:
                                          Color.fromARGB(255, 0, 136, 145),
                                      subtitle: Center(
                                        child: Text(
                                          event["location"],
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Image.network(event["imageURL"],
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
                                                'Date : ${event["date"]}',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Time : ${event["time"]}',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Description : ${event["description"]}',
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

                        return Column(
                          children: eventCards,
                        );
                      },
                    )
            ],
          ),
        ),
      ),

      //bottom navigation
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        iconSize: 30,
        selectedFontSize: 18,
        unselectedFontSize: 16,
        backgroundColor: Color.fromARGB(255, 0, 136, 145),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.dog,
              size: 20.0,
            ),
            label: 'Pets',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.calendar,
              size: 20.0,
            ),
            label: 'Events',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Color.fromARGB(255, 202, 247, 227),
        onTap: _onItemTapped,
      ),
    );
  }
}
