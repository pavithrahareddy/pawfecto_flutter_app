import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pawfecto/screens/user/adopt_main.dart';
import 'package:pawfecto/screens/user/sidebar.dart';

class ProfilePage extends StatefulWidget {
  static const String id = 'profile_page';
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    getUID();
  }

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  String _name;
  // String _email;
  String _phone;
  String _city;
  String _state;

  String _uid;

  void getUID() {
    setState(() {
      _uid = _auth.currentUser.uid;
    });
  }

  void saveProfile() async {
    try {
      final user = await _firestore.collection('users').doc(_uid).get();
      await _firestore.collection('users').doc(_uid).update(
        {
          "name": _name ?? user.data()["name"],
          "phone": _phone ?? user.data()["phone"],
          "city": _city ?? user.data()["city"],
          "state": _state ?? user.data()["state"],
        },
      );

      setState(() {
        _status = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            child: Icon(
              FontAwesomeIcons.arrowLeft,
              color: Color(0xff008891),
            ),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, AdoptMain.id, (route) => false);
            },
          ),
        ),
        body: new Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Column(
                children: [
                  Container(
                    height: 250.0,
                    color: Colors.white,
                    child: new Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child:
                              new Stack(fit: StackFit.loose, children: <Widget>[
                            new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Container(
                                    width: 140.0,
                                    height: 140.0,
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                        image: new ExactAssetImage(
                                            'images/cat1.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                              ],
                            ),
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 90.0, right: 100.0),
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(255, 0, 136, 145),
                                      radius: 25.0,
                                      child: new Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                )),
                          ]),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Color(0xffFFFFFF),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 25.0),
                      child: StreamBuilder<QuerySnapshot>(
                          stream: _firestore.collection('users').snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            final users = snapshot.data.docs;
                            Map currentUser;

                            for (var user in users) {
                              if (user.id == _uid) {
                                currentUser = user.data();
                                // setState(() {
                                //   _name = currentUser["name"];
                                //   _phone = currentUser["phone"];
                                //   _city = currentUser["city"];
                                //   _state = currentUser["state"];
                                // });
                                break;
                              }
                            }

                            final bioColumn = Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Personal Information',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 0, 136, 145),
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            _status
                                                ? _getEditIcon()
                                                : new Container(),
                                          ],
                                        )
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Name',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 0, 136, 145),
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Flexible(
                                          child: TextField(
                                            style: TextStyle(
                                                color: _status
                                                    ? Colors.grey
                                                    : Colors.black),
                                            decoration: const InputDecoration(
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xff008891),
                                                ),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xff008891),
                                                ),
                                              ),
                                              hintText: "Enter Your Name",
                                            ),
                                            enabled: !_status,
                                            autofocus: !_status,
                                            onChanged: (value) {
                                              _name = value;
                                            },
                                            controller: TextEditingController(
                                                text: currentUser["name"]),
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Email ID',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 0, 136, 145),
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Flexible(
                                          child: TextField(
                                            style:
                                                TextStyle(color: Colors.grey),
                                            decoration: const InputDecoration(
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xff008891),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xff008891),
                                                  ),
                                                ),
                                                hintText: "Enter Email ID"),
                                            enabled: false,
                                            controller: TextEditingController(
                                                text: currentUser["email"]),
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              'Mobile',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 0, 136, 145),
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Flexible(
                                          child: TextField(
                                            style: TextStyle(
                                                color: _status
                                                    ? Colors.grey
                                                    : Colors.black),
                                            decoration: const InputDecoration(
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xff008891),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xff008891),
                                                  ),
                                                ),
                                                hintText:
                                                    "Enter Mobile Number"),
                                            enabled: !_status,
                                            onChanged: (value) {
                                              _phone = value;
                                            },
                                            controller: TextEditingController(
                                                text: currentUser["phone"]),
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            child: Text(
                                              'City',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 0, 136, 145),
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          flex: 2,
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Text(
                                              'State',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 0, 136, 145),
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          flex: 2,
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(right: 10.0),
                                            child: TextField(
                                              style: TextStyle(
                                                  color: _status
                                                      ? Colors.grey
                                                      : Colors.black),
                                              decoration: const InputDecoration(
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xff008891),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0xff008891),
                                                    ),
                                                  ),
                                                  hintText: "Enter City"),
                                              enabled: !_status,
                                              onChanged: (value) {
                                                _city = value;
                                              },
                                              controller: TextEditingController(
                                                  text: currentUser["city"]),
                                            ),
                                          ),
                                          flex: 2,
                                        ),
                                        Flexible(
                                          child: TextField(
                                            style: TextStyle(
                                                color: _status
                                                    ? Colors.grey
                                                    : Colors.black),
                                            decoration: const InputDecoration(
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xff008891),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xff008891),
                                                  ),
                                                ),
                                                hintText: "Enter State"),
                                            enabled: !_status,
                                            onChanged: (value) {
                                              _state = value;
                                            },
                                            controller: TextEditingController(
                                                text: currentUser["state"]),
                                          ),
                                          flex: 2,
                                        ),
                                      ],
                                    )),
                                !_status ? _getActionButtons() : Container(),
                              ],
                            );

                            return bioColumn;
                          }),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: RaisedButton(
                child: new Text("Save"),
                textColor: Colors.white,
                color: Color.fromARGB(255, 0, 136, 145),
                onPressed: saveProfile,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: RaisedButton(
                child: Text("Cancel"),
                textColor: Colors.white,
                color: Color.fromARGB(255, 218, 120, 120),
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: Color.fromARGB(255, 0, 136, 145),
        radius: 14.0,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
