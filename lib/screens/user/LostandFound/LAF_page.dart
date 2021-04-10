import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pawfecto/screens/user/LostandFound/lost_and_found.dart';
import 'package:pawfecto/screens/user/sidebar.dart';

import '../profile.dart';

class LAFPage extends StatefulWidget {
  static const String id = 'LAF_page';
  @override
  _LAFPageState createState() => _LAFPageState();
}

class _LAFPageState extends State<LAFPage> {
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('users').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  List<Widget> petCards = [];
                  final users = snapshot.data.docs;

                  for (var user in users) {
                    if (user.data()["lostAndFound"].length != 0) {
                      for (var pet in user.data()["lostAndFound"]) {
                        final petCard = Card(
                          shadowColor: Colors.grey,
                          elevation: 5,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 10.0, bottom: 10.0, left: 10.0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.40,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(pet["imageURL"]),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: BoxShape.rectangle,
                                  ),
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.width * 0.60,
                                width: MediaQuery.of(context).size.width * 0.50,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, top: 10, bottom: 10, right: 5),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Text(
                                        pet["category"],
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: pet["category"] == 'Missing'
                                              ? Colors.red
                                              : Colors.green,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        "Identifiable Traits",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueGrey,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        children: [
                                          Text("Breed: "),
                                          Text(pet["breed"]),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Color: "),
                                          Text(pet["color"]),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Strength: "),
                                          Text(pet["strength"]),
                                        ],
                                      ),
                                      Text(
                                        "Description: ",
                                      ),
                                      Flexible(
                                        child: Text(
                                          pet["description"],
                                          softWrap: true,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: Color(0xff008891),
                                          ),
                                          Text(
                                            pet["location"],
                                            style: TextStyle(
                                              fontSize: 11.0,
                                              color: Colors.blueGrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.call,
                                            color: Color(0xff008891),
                                          ),
                                          Text(
                                            pet["phone"],
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.blueGrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                        petCards.add(petCard);
                      }
                    }
                  }

                  return Column(
                    children: petCards,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          height: 90,
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Found a lost pet or stray animal? ",
                style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                "Here's how to help them find their way home",
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.grey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text('Report Stray Animal'),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      minimumSize: Size(180, 35),
                      primary: Colors.teal,
                      onPrimary: Colors.white,
                      onSurface: Colors.grey,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LostAndFound(
                            category: 'Stray Pet',
                            title: 'Report Homeless Pet',
                            successMessage:
                                'We assure you that we will find this pet a home!',
                          ),
                        ),
                      );
                    },
                  ),
                  ElevatedButton(
                    child: Text('Report Lost Pet'),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      minimumSize: Size(180, 35),
                      primary: Colors.teal,
                      onPrimary: Colors.white,
                      onSurface: Colors.grey,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LostAndFound(
                            category: 'Missing',
                            title: 'Report Lost Pet',
                            successMessage:
                                'We will get in touch if we find anything',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
