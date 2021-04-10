import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pawfecto/screens/user/sidebar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pawfecto/screens/user/adopt/pet_details.dart';

import '../profile.dart';

class Favorites extends StatefulWidget {
  static const String id = 'Favorites';
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

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
              Navigator.popAndPushNamed(context, ProfilePage.id);
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
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // height: 500.0,

              decoration: BoxDecoration(
                color: Color(0xffF6F6F6),
                borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
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

                        List<Widget> petCards = [];
                        final shelters = snapshot.data.docs;

                        for (var shelter in shelters) {
                          if (shelter.data()["pets"].length != 0) {
                            for (var pet in shelter.data()["pets"]) {
                              bool isFav = pet["favourites"]
                                  .contains(_auth.currentUser.uid);
                              if (pet["favourites"]
                                  .contains(_auth.currentUser.uid)) {
                                final petCard = Padding(
                                  padding: EdgeInsets.only(
                                    top: 20.0,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PetDetails(
                                            pet: pet,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Card(
                                      shadowColor: Colors.grey,
                                      elevation: 5,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.70,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.80,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image:
                                                      (pet["imageURL"] == null)
                                                          ? AssetImage(
                                                              'images/dog1.jpg')
                                                          : NetworkImage(
                                                              pet["imageURL"]),
                                                  fit: BoxFit.fill,
                                                ),
                                                shape: BoxShape.rectangle,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.85,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: <Widget>[
                                                          Text(
                                                            pet["name"] == null
                                                                ? "No name"
                                                                : pet["name"],
                                                            style: TextStyle(
                                                              fontSize: 25.0,
                                                              color: Colors
                                                                  .blueGrey,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Icon(
                                                            pet["gender"] ==
                                                                    'Male'
                                                                ? FontAwesomeIcons
                                                                    .mars
                                                                : FontAwesomeIcons
                                                                    .venus,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    136,
                                                                    145),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 3,
                                                      ),
                                                      Text(
                                                        '${pet["breed"] == null ? "No breed" : pet["breed"]}, ${pet["age"] == null ? "No age" : pet["age"]} ',
                                                        style: TextStyle(
                                                          fontSize: 16.0,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () async {
                                                    List favs =
                                                        pet["favourites"];
                                                    isFav
                                                        ? favs.remove(_auth
                                                            .currentUser.uid)
                                                        : favs.add(_auth
                                                            .currentUser.uid);

                                                    final shelter =
                                                        await _firestore
                                                            .collection(
                                                                'shelters')
                                                            .doc(pet["uid"])
                                                            .get();
                                                    List shelterPets =
                                                        shelter.data()["pets"];

                                                    shelterPets[pet["id"] - 1] =
                                                        {
                                                      ...pet,
                                                      "favourites": favs
                                                    };

                                                    await _firestore
                                                        .collection('shelters')
                                                        .doc(pet["uid"])
                                                        .update({
                                                      "pets": shelterPets
                                                    });
                                                  },
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20.0),
                                                      child: Icon(
                                                        isFav
                                                            ? FontAwesomeIcons
                                                                .solidHeart
                                                            : FontAwesomeIcons
                                                                .heart,
                                                        color: isFav
                                                            ? Colors.red
                                                            : Color.fromARGB(
                                                                255,
                                                                0,
                                                                136,
                                                                145),
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                                petCards.add(petCard);
                              }
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
          ],
        ),
      )),
    );
  }
}
