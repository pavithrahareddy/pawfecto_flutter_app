import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pawfecto/screens/user/sidebar.dart';
import 'package:pawfecto/screens/user/profile.dart';

class Pawstagram extends StatefulWidget {
  static const String id = 'pawstagram';
  @override
  _PawstagramState createState() => _PawstagramState();
}

class _PawstagramState extends State<Pawstagram> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffF6F6F6),
              borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
            ),
            child: Column(children: [
              SizedBox(
                height: 10.0,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('pawstagram').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  List<Widget> postCards = [];

                  final posts = snapshot.data.docs;

                  for (var post in posts) {
                    bool isLiked =
                        post["users"].contains(_auth.currentUser.uid);

                    final postCard = Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: const Offset(
                                1.0,
                                1.0,
                              ), //Offset
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.white,
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    leading: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(0, 2),
                                            blurRadius: 6.0,
                                          ),
                                        ],
                                      ),
                                      child: CircleAvatar(
                                        child: ClipOval(
                                          child: Image(
                                            height: 50.0,
                                            width: 50.0,
                                            image: AssetImage(
                                                "images/pawfecto-logo.jpeg"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      "Pawfecto",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    // subtitle: Text("10 mins ago"),
                                    trailing: IconButton(
                                      icon: Icon(FontAwesomeIcons.shareAlt),
                                      iconSize: 20.0,
                                      color: Colors.black,
                                      onPressed: () {},
                                    ),
                                  ),
                                  InkWell(
                                    onDoubleTap: () {},
                                    onTap: () {},
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: 5.0,
                                          bottom: 5.0,
                                          left: 10.0,
                                          right: 10.0),
                                      width: double.infinity,
                                      height: 300.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        image: DecorationImage(
                                          image: NetworkImage(post["imageURL"]),
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 22.0,
                                      right: 22.0,
                                      bottom: 10.0,
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () async {
                                            isLiked
                                                ? (await _firestore
                                                    .collection('pawstagram')
                                                    .doc(post.id)
                                                    .update({
                                                    "likes": post["likes"] - 1,
                                                    "users":
                                                        FieldValue.arrayRemove([
                                                      _auth.currentUser.uid
                                                    ])
                                                  }))
                                                : (await _firestore
                                                    .collection('pawstagram')
                                                    .doc(post.id)
                                                    .update({
                                                    "likes": post["likes"] + 1,
                                                    "users":
                                                        FieldValue.arrayUnion([
                                                      _auth.currentUser.uid
                                                    ])
                                                  }));
                                          },
                                          child: isLiked
                                              ? Icon(
                                                  FontAwesomeIcons.solidHeart,
                                                  color: Colors.red,
                                                  size: 20.0,
                                                )
                                              : Icon(
                                                  FontAwesomeIcons.heart,
                                                  size: 20.0,
                                                ),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Text(
                                          '${post["likes"]}',
                                          style: TextStyle(fontSize: 16.0),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                    postCards.add(postCard);
                  }
                  return Column(children: postCards);
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
