import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisteredUsers extends StatefulWidget {
  RegisteredUsers({@required this.event});

  final Map event;

  static const String id = 'registered_users';

  @override
  _RegisteredUsersState createState() => _RegisteredUsersState();
}

class _RegisteredUsersState extends State<RegisteredUsers> {
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/reg_users.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Text(
                'Registered Users',
                style: TextStyle(fontSize: 24.0, color: Colors.grey),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'Event name: ${this.widget.event["name"]}',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('shelters').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  Map e = {};
                  List<Widget> userCards = [];
                  Widget userCard = Container();
                  final shelters = snapshot.data.docs;

                  // fetch the pets under the current user
                  for (var shelter in shelters) {
                    if (shelter.id == _uid) {
                      e = shelter.data()["events"][this.widget.event["id"] - 1];
                      break;
                    }
                  }

                  for (var user in e["registrations"]) {
                    if (user != "") {
                      userCard = Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 15.0,
                          ),
                          child: Card(
                            shadowColor: Colors.grey,
                            elevation: 5,
                            child: Column(
                              children: [
                                Container(
                                  // height: MediaQuery.of(context).size.height * 0.11,
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20.0,
                                      top: 15.0,
                                      right: 20.0,
                                      bottom: 15.0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              user["name"],
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Color(0xff008891)),
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.phone,
                                                  color: Colors.blueGrey,
                                                  size: 15.0,
                                                ),
                                                SizedBox(
                                                  width: 5.0,
                                                ),
                                                Text(
                                                  user["phone"],
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 13.0,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15.0,
                                        ),
                                        Text(user["email"])
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    userCards.add(userCard);
                  }

                  return Column(
                    children: userCards,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
