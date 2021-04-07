import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pawfecto/screens/user/adopt_main.dart';
import 'package:pawfecto/screens/user/events/event_details.dart';

class EventRegister extends StatefulWidget {
  EventRegister({@required this.event});

  static const String id = 'event_register';
  final Map event;

  @override
  _EventRegisterState createState() => _EventRegisterState();
}

class _EventRegisterState extends State<EventRegister> {
  final _formKey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  String _name = "";
  String _number = "";
  String _email = "";

  bool isRegistered = false;

  void registerUser() async {
    try {
      final shelter = await _firestore
          .collection('shelters')
          .doc(this.widget.event["uid"])
          .get();

      List events = shelter.data()["events"];
      List regs = events[this.widget.event["id"] - 1]["registrations"];

      Map entry = {
        "uid": _auth.currentUser.uid,
        "name": _name,
        "phone": _number,
        "email": _email,
      };

      regs.add(entry);

      events[this.widget.event["id"] - 1] = {
        'id': this.widget.event["id"],
        'uid': this.widget.event["uid"],
        'name': this.widget.event["name"],
        'location': this.widget.event["location"],
        'time': this.widget.event["time"],
        'date': this.widget.event["date"],
        'description': this.widget.event["description"],
        'imageURL': this.widget.event["imageURL"],
        'registrations': regs
      };

      await _firestore
          .collection('shelters')
          .doc(this.widget.event["uid"])
          .update(
        {
          'events': events,
        },
      );
      setState(() {
        isRegistered = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: isRegistered
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('images/reg_success.jpg'),
                      height: 200.0,
                      width: 200.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Registered Successfully!',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, AdoptMain.id, (route) => false);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xff008891))),
                      child: Text(
                        'HOME',
                      ),
                    )
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0, top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            child: Icon(
                              Icons.close,
                            ),
                            onTap: () {
                              Navigator.popAndPushNamed(
                                  context, EventDetails.id);
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Text(
                        'Event Register',
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Color(0xff008891),
                        ),
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                // filled: true,
                                labelText: 'Name',
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Name is Required';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  _name = value;
                                });
                              },
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                // filled: true,
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email is Required';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  _email = value;
                                });
                              },
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                // filled: true,
                                labelText: 'Mobile Number',
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Mobile Number is Required';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  _number = value;
                                });
                              },
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0xff008891),
                        ),
                      ),
                      child: Text(
                        'REGISTER',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      onPressed: registerUser,
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
