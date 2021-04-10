import 'package:flutter/material.dart';
import 'package:pawfecto/screens/user/donation/donate_form.dart';
import 'package:pawfecto/screens/user/sidebar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../profile.dart';

class Donators extends StatefulWidget {
  static const String id = 'donators_list';
  @override
  _DonatorsState createState() => _DonatorsState();
}

class _DonatorsState extends State<Donators> {
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .45,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/donation.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Text(
                'Choose a shelter to donate to',
                style: TextStyle(fontSize: 18.0, color: Colors.grey),
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

                  List donors = [];
                  List<Widget> donorCards = [];
                  final shelters = snapshot.data.docs;

                  // fetch the pets under the current user
                  for (var shelter in shelters) {
                    if (shelter.data()["donation"]["upi"] != '') {
                      donors.add(
                        {
                          'name': shelter.data()["name"],
                          'phone': shelter.data()["phone"],
                          'email': shelter.data()["email"],
                          'upi': shelter.data()["donation"]["upi"],
                          'description': shelter.data()["donation"]
                              ["description"],
                        },
                      );
                    }
                  }

                  for (var donor in donors) {
                    final donorCard = Center(
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
                                width: MediaQuery.of(context).size.width * 0.85,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DonateForm(
                                          donor: donor,
                                        ),
                                      ),
                                    );
                                  },
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
                                              donor["name"],
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
                                                  donor["phone"],
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
                                        Text(donor["description"])
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                    donorCards.add(donorCard);
                  }

                  return Column(
                    children: donorCards,
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
