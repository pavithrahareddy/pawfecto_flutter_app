import 'package:flutter/material.dart';
import 'package:pawfecto/screens/user/events/event_register.dart';
import 'package:pawfecto/screens/user/sidebar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pawfecto/screens/user/profile.dart';

class EventDetails extends StatefulWidget {
  static const String id = 'event_detail';
  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  bool seeDetails = true;
  List seeDetailsIds = [];

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
                    // bool seeDetails = false;

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
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
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
                                      (seeDetails &&
                                              seeDetailsIds
                                                  .contains(event["id"]))
                                          ? Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Color(0xffF6F6F6),
                                              ),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 22.0,
                                                                right: 25.0,
                                                                top: 8.0,
                                                                bottom: 8.0),
                                                        child: Text(
                                                          '${event["description"] == null ? "No description" : event["description"]}',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        'Date : ${event["date"]}',
                                                        style: TextStyle(
                                                          fontSize: 14.0,
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        'Time : ${event["time"] == null ? "No time" : event["time"]}',
                                                        style: TextStyle(
                                                          fontSize: 14.0,
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Container(
                                                            color: Colors.red,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(6.0),
                                                              child: Text(
                                                                'Registered',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      16.0,
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
                                                              child: Text(
                                                                'Register',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      17.0,
                                                                ),
                                                              ),
                                                              style: TextButton
                                                                  .styleFrom(
                                                                primary: Colors
                                                                    .white,
                                                                backgroundColor:
                                                                    Colors.teal,
                                                                onSurface:
                                                                    Colors.grey,
                                                              ),
                                                              onPressed: () {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            EventRegister(
                                                                      event:
                                                                          event,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  GestureDetector(
                                                    child: Icon(
                                                      Icons.keyboard_arrow_up,
                                                      color: Color(0xff008891),
                                                      size: 25.0,
                                                    ),
                                                    onTap: () {
                                                      setState(() {
                                                        seeDetailsIds.remove(
                                                            event["id"]);
                                                      });
                                                    },
                                                  )
                                                ],
                                              ),
                                            )
                                          : Row(
                                              children: [
                                                SizedBox(
                                                  width: 10.0,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      seeDetailsIds
                                                          .add(event["id"]);
                                                    });
                                                  },
                                                  child: Text(
                                                    'More details',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff008891)),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary: Colors.white,
                                                          elevation: 0),
                                                ),
                                              ],
                                            ),
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
