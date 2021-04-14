import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pawfecto/screens/user/adopt/pet_details.dart';
import 'package:pawfecto/screens/user/profile.dart';
import 'package:pawfecto/screens/user/sidebar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pawfecto/screens/auth/adopt_login.dart';

class AdoptMain extends StatefulWidget {
  static const String id = 'adopt_main';
  @override
  _AdoptMainState createState() => _AdoptMainState();
}

class _AdoptMainState extends State<AdoptMain> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  String _uid;

  @override
  void initState() {
    super.initState();
    _uid = _auth.currentUser.uid;
  }

  bool isEmailSent = false;
  int _selectedtype = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedtype = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _auth.currentUser.emailVerified
        ? Scaffold(
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
            backgroundColor: Colors.white,
            body: SafeArea(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          _onItemTapped(0);
                        },
                        child: Material(
                          color: _selectedtype == 0
                              ? Color.fromARGB(255, 0, 136, 145)
                              : Colors.white,
                          elevation: 8.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              FontAwesomeIcons.dog,
                              color: _selectedtype == 0
                                  ? Colors.white
                                  : Color.fromARGB(255, 0, 136, 145),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      InkWell(
                        onTap: () {
                          _onItemTapped(1);
                        },
                        child: Material(
                          color: _selectedtype == 1
                              ? Color.fromARGB(255, 0, 136, 145)
                              : Colors.white,
                          elevation: 8.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              FontAwesomeIcons.cat,
                              color: _selectedtype == 1
                                  ? Colors.white
                                  : Color.fromARGB(255, 0, 136, 145),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      InkWell(
                        onTap: () {
                          _onItemTapped(2);
                        },
                        child: Material(
                          color: _selectedtype == 2
                              ? Color.fromARGB(255, 0, 136, 145)
                              : Colors.white,
                          elevation: 8.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              FontAwesomeIcons.dove,
                              color: _selectedtype == 2
                                  ? Colors.white
                                  : Color.fromARGB(255, 0, 136, 145),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      InkWell(
                        onTap: () {
                          _onItemTapped(3);
                        },
                        child: Material(
                          color: _selectedtype == 3
                              ? Color.fromARGB(255, 0, 136, 145)
                              : Colors.white,
                          elevation: 8.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              FontAwesomeIcons.horse,
                              color: _selectedtype == 3
                                  ? Colors.white
                                  : Color.fromARGB(255, 0, 136, 145),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      InkWell(
                        onTap: () {
                          _onItemTapped(4);
                        },
                        child: Material(
                          color: _selectedtype == 4
                              ? Color.fromARGB(255, 0, 136, 145)
                              : Colors.white,
                          elevation: 8.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              FontAwesomeIcons.fish,
                              color: _selectedtype == 4
                                  ? Colors.white
                                  : Color.fromARGB(255, 0, 136, 145),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    // height: 500.0,

                    decoration: BoxDecoration(
                      color: Color(0xffF6F6F6),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(50.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          StreamBuilder<QuerySnapshot>(
                            stream:
                                _firestore.collection('shelters').snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              List pets = [];
                              List allpets = [];
                              List<Widget> dogCards = [];
                              List<Widget> catCards = [];
                              List<Widget> birdCards = [];
                              List<Widget> horseCards = [];
                              List<Widget> fishCards = [];
                              // List<Widget> hamsterCards = [];

                              final shelters = snapshot.data.docs;

                              for (var shelter in shelters) {
                                pets = shelter.data()["pets"];
                                for (var eachpet in pets) {
                                  allpets.add(eachpet);
                                }
                              }

                              for (var pet in allpets) {
                                bool isFav = pet["favourites"].contains(_uid);

                                if (pet["type"] == "Dog") {
                                  final dogCard = Padding(
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
                                                    image: (pet["imageURL"] ==
                                                            null)
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
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: <Widget>[
                                                            Text(
                                                              pet["name"] ==
                                                                      null
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
                                                              pet["gender"] == 'Male'
                                                                  ? FontAwesomeIcons
                                                                      .mars
                                                                  : FontAwesomeIcons
                                                                      .venus,
                                                              color: Color
                                                                  .fromARGB(
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
                                                          ? favs.remove(_uid)
                                                          : favs.add(_uid);

                                                      final shelter =
                                                          await _firestore
                                                              .collection(
                                                                  'shelters')
                                                              .doc(pet["uid"])
                                                              .get();
                                                      List shelterPets = shelter
                                                          .data()["pets"];

                                                      shelterPets[
                                                          pet["id"] - 1] = {
                                                        ...pet,
                                                        "favourites": favs
                                                      };

                                                      await _firestore
                                                          .collection(
                                                              'shelters')
                                                          .doc(pet["uid"])
                                                          .update({
                                                        "pets": shelterPets
                                                      });
                                                    },
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(20.0),
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
                                  dogCards.add(dogCard);
                                } else if (pet["type"] == "Cat") {
                                  final catCard = Padding(
                                    padding: EdgeInsets.only(
                                      top: 20.0,
                                    ),
                                    child: Card(
                                      shadowColor: Colors.grey,
                                      elevation: 5,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        PetDetails(
                                                      pet: pet,
                                                    ),
                                                  ),
                                                );
                                              },
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
                                                    image: (pet["imageURL"] ==
                                                            null)
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
                                                        '${pet["breed"] == null ? "No breed" : pet["breed"]}, ${pet["age"] == null ? "No age" : pet["age"]}',
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
                                                        ? favs.remove(_uid)
                                                        : favs.add(_uid);

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
                                  );
                                  catCards.add(catCard);
                                } else if (pet["type"] == "Bird") {
                                  final birdCard = Padding(
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
                                                    image: (pet["imageURL"] ==
                                                            null)
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
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: <Widget>[
                                                            Text(
                                                              pet["name"] ==
                                                                      null
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
                                                              pet["gender"] == 'Male'
                                                                  ? FontAwesomeIcons
                                                                      .mars
                                                                  : FontAwesomeIcons
                                                                      .venus,
                                                              color: Color
                                                                  .fromARGB(
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
                                                          '${pet["breed"] == null ? "No breed" : pet["breed"]}, ${pet["age"] == null ? "No age" : pet["age"]}',
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
                                                          ? favs.remove(_uid)
                                                          : favs.add(_uid);

                                                      final shelter =
                                                          await _firestore
                                                              .collection(
                                                                  'shelters')
                                                              .doc(pet["uid"])
                                                              .get();
                                                      List shelterPets = shelter
                                                          .data()["pets"];

                                                      shelterPets[
                                                          pet["id"] - 1] = {
                                                        ...pet,
                                                        "favourites": favs
                                                      };

                                                      await _firestore
                                                          .collection(
                                                              'shelters')
                                                          .doc(pet["uid"])
                                                          .update({
                                                        "pets": shelterPets
                                                      });
                                                    },
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(20.0),
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
                                  birdCards.add(birdCard);
                                } else if (pet["type"] == "Horse") {
                                  final horseCard = Padding(
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
                                                    image: (pet["imageURL"] ==
                                                            null)
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
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: <Widget>[
                                                            Text(
                                                              pet["name"] ==
                                                                      null
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
                                                              pet["gender"] == 'Male'
                                                                  ? FontAwesomeIcons
                                                                      .mars
                                                                  : FontAwesomeIcons
                                                                      .venus,
                                                              color: Color
                                                                  .fromARGB(
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
                                                          '${pet["breed"] == null ? "No breed" : pet["breed"]}, ${pet["age"] == null ? "No age" : pet["age"]}',
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
                                                          ? favs.remove(_uid)
                                                          : favs.add(_uid);

                                                      final shelter =
                                                          await _firestore
                                                              .collection(
                                                                  'shelters')
                                                              .doc(pet["uid"])
                                                              .get();
                                                      List shelterPets = shelter
                                                          .data()["pets"];

                                                      shelterPets[
                                                          pet["id"] - 1] = {
                                                        ...pet,
                                                        "favourites": favs
                                                      };

                                                      await _firestore
                                                          .collection(
                                                              'shelters')
                                                          .doc(pet["uid"])
                                                          .update({
                                                        "pets": shelterPets
                                                      });
                                                    },
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(20.0),
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
                                  horseCards.add(horseCard);
                                } else if (pet["type"] == "Fish") {
                                  final fishCard = Padding(
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
                                                    image: (pet["imageURL"] ==
                                                            null)
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
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: <Widget>[
                                                            Text(
                                                              pet["name"] ==
                                                                      null
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
                                                              pet["gender"] == 'Male'
                                                                  ? FontAwesomeIcons
                                                                      .mars
                                                                  : FontAwesomeIcons
                                                                      .venus,
                                                              color: Color
                                                                  .fromARGB(
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
                                                          '${pet["breed"] == null ? "No breed" : pet["breed"]}, ${pet["age"] == null ? "No age" : pet["age"]}',
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
                                                          ? favs.remove(_uid)
                                                          : favs.add(_uid);

                                                      final shelter =
                                                          await _firestore
                                                              .collection(
                                                                  'shelters')
                                                              .doc(pet["uid"])
                                                              .get();
                                                      List shelterPets = shelter
                                                          .data()["pets"];

                                                      shelterPets[
                                                          pet["id"] - 1] = {
                                                        ...pet,
                                                        "favourites": favs
                                                      };

                                                      await _firestore
                                                          .collection(
                                                              'shelters')
                                                          .doc(pet["uid"])
                                                          .update({
                                                        "pets": shelterPets
                                                      });
                                                    },
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(20.0),
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
                                  fishCards.add(fishCard);
                                }
                              }
                              return Column(
                                children: _selectedtype == 0
                                    ? dogCards
                                    : (_selectedtype == 1
                                        ? catCards
                                        : (_selectedtype == 2
                                            ? birdCards
                                            : (_selectedtype == 3
                                                ? horseCards
                                                : fishCards))),
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
          )
        : Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/email_verification.jpg',
                    height: 150.0,
                    width: 150.0,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Please Verify your email to continue',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: isEmailSent
                          ? MaterialStateProperty.all<Color>(Colors.grey)
                          : MaterialStateProperty.all<Color>(
                              Color(0xff008891),
                            ),
                    ),
                    onPressed: !isEmailSent
                        ? () {
                            _auth.currentUser.sendEmailVerification();
                            setState(() {
                              isEmailSent = true;
                            });
                          }
                        : null,
                    child: Text('RESEND VERIFICATION EMAIL'),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0xff008891),
                      ),
                    ),
                    onPressed: () {
                      _auth.signOut();
                      Navigator.popAndPushNamed(context, AdoptLogin.id);
                    },
                    child: Text('LOGOUT'),
                  ),
                ],
              ),
            ),
          );
  }
}
