import 'package:flutter/material.dart';
import 'package:pawfecto/screens/user/events/event_register.dart';
import 'package:pawfecto/screens/user/sidebar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventDetails extends StatefulWidget {
  static const String id = 'event_detail';
  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
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
          'Events',
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('shelters').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  List events = [];
                  List allevents = [];
                  List<Widget> eventCards = [];
                  final shelters = snapshot.data.docs;
                  for (var shelter in shelters) {
                    events = shelter.data()["events"];
                    for (var eachevent in events) {
                      allevents.add(eachevent);
                    }
                  }
                  for (var event in allevents) {
                    List eventReg = event["registrations"];
                    bool isRegistered = false;
                    for (var isReg in eventReg) {
                      if (isReg != "") {
                        if (isReg["uid"] == _uid) {
                          isRegistered = true;
                        }
                      }
                    }
                    final eventCard = Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            elevation: 5,
                            borderOnForeground: true,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Column(
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color:
                                              Color.fromARGB(255, 0, 136, 145),
                                        ),
                                        constraints: BoxConstraints(
                                          minHeight: 10,
                                          minWidth: 10,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            children: [
                                              Center(
                                                  child: Text(
                                                event["name"] == null
                                                    ? "No name"
                                                    : event["name"],
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              )),
                                              Text(
                                                event["location"] == null
                                                    ? "No event location"
                                                    : event["location"],
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          child: Image(
                                              image: (event["imageURL"] == null)
                                                  ? AssetImage(
                                                      'images/dog1.jpg')
                                                  : NetworkImage(
                                                      event["imageURL"]),
                                              height: 200,
                                              width: 150,
                                              fit: BoxFit.fitWidth),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Color.fromARGB(
                                              255, 202, 247, 227),
                                        ),
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
                                                  'Time : ${event["time"] == null ? "No time" : event["time"]}',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'Description : ${event["description"] == null ? "No description" : event["description"]}',
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
                                            isRegistered
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      color: Colors.red,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(6.0),
                                                        child: Text(
                                                          'Registered',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      TextButton(
                                                        child: Text('Register'),
                                                        style: TextButton
                                                            .styleFrom(
                                                          primary: Colors.white,
                                                          backgroundColor:
                                                              Colors.teal,
                                                          onSurface:
                                                              Colors.grey,
                                                        ),
                                                        onPressed: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  EventRegister(
                                                                event: event,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                      const SizedBox(width: 15),
                                                      TextButton(
                                                        child: Text('Enquire'),
                                                        style: TextButton
                                                            .styleFrom(
                                                          primary: Colors.white,
                                                          backgroundColor:
                                                              Colors.teal,
                                                          onSurface:
                                                              Colors.grey,
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
                            ),
                          ),
                          const SizedBox(height: 13),
                        ],
                      ),
                    );
                    eventCards.add(eventCard);
                  }
                  return Column(
                    children: eventCards,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
