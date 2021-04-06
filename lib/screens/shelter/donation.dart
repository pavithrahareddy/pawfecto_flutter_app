import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonationDetails extends StatefulWidget {
  static const String id = 'shelter_donation';
  @override
  _DonationDetailsState createState() => _DonationDetailsState();
}

class _DonationDetailsState extends State<DonationDetails> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  String _uid;
  String _upi = '';
  String _description = '';
  bool _isFilled = false;

  void getDetails() {
    Future<DocumentSnapshot> shelter =
        _firestore.collection('shelters').doc(_auth.currentUser.uid).get();

    shelter.then((value) => {
          setState(() {
            _upi = value.data()["donation"]["upi"];
            _description = value.data()["donation"]["description"];
          }),
        });
  }

  void checkIfFilled() {
    if (_upi != '' && _description != '') {
      setState(() {
        _isFilled = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getDetails();
  }

  void saveDetails() async {
    try {
      print('UID: ${_auth.currentUser.uid}');
      await _firestore
          .collection('shelters')
          .doc(_auth.currentUser.uid)
          .update({
        'donation': {
          'upi': _upi,
          'description': _description,
        }
      });

      checkIfFilled();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .45,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/donation.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0.0,
                        top: 0.0,
                        child: GestureDetector(
                          child: Icon(
                            FontAwesomeIcons.arrowLeft,
                            color: Colors.black,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * .39,
              left: 15,
              right: 15,
              child: Card(
                elevation: 8,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  width: MediaQuery.of(context).size.height * .90,
                  height: 80,
                  child: Center(
                    child: Text(
                      'Help us find the right donors for you!',
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Color(0xff008891),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height * .50,
                left: 15,
                right: 15,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Container(
                    child: Column(
                      children: [
                        StreamBuilder<QuerySnapshot>(
                          stream: _firestore.collection('shelters').snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            Map donationDetails = {};
                            final shelters = snapshot.data.docs;

                            // fetch the pets under the current user
                            for (var shelter in shelters) {
                              if (shelter.id == _uid) {
                                donationDetails = shelter.data()["donation"];
                                break;
                              }
                            }

                            final textFields = Column(
                              children: [
                                TextFormField(
                                  // initialValue: ,
                                  controller: TextEditingController(text: _upi),
                                  readOnly: _isFilled,
                                  decoration: InputDecoration(
                                    // filled: true,
                                    labelText: 'UPI ID',
                                    labelStyle: TextStyle(
                                      color: Color(0xff818380),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xff818380),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xff818380),
                                      ),
                                    ),
                                  ),
                                  style: TextStyle(
                                      color: _isFilled
                                          ? Colors.grey
                                          : Colors.black),
                                  // The validator receives the text that the user has entered.
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Required';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      _upi = value;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  controller:
                                      TextEditingController(text: _description),
                                  readOnly: _isFilled,
                                  decoration: InputDecoration(
                                    // filled: true,
                                    labelText: 'Description',
                                    labelStyle: TextStyle(
                                      color: Color(0xff818380),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xff818380),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xff818380),
                                      ),
                                    ),
                                  ),
                                  style: TextStyle(
                                      color: _isFilled
                                          ? Colors.grey
                                          : Colors.black),
                                  // The validator receives the text that the user has entered.
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Required';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      _description = value;
                                    });
                                  },
                                ),
                              ],
                            );

                            return textFields;
                          },
                        ),
                        SizedBox(
                          height: 60.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Color(0xff008891),
                                  ),
                                ),
                                onPressed: saveDetails,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    'SAVE',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: _isFilled
                                      ? MaterialStateProperty.all<Color>(
                                          Color.fromARGB(255, 218, 120, 120))
                                      : MaterialStateProperty.all<Color>(
                                          Colors.grey),
                                ),
                                onPressed: () {
                                  if (_isFilled) {
                                    setState(() {
                                      _isFilled = !_isFilled;
                                    });
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    'EDIT DETAILS',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
