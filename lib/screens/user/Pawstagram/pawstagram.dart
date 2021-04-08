import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pawfecto/screens/user/sidebar.dart';

class Pawstagram extends StatefulWidget {
  static const String id = 'pawstagram';
  @override
  _PawstagramState createState() => _PawstagramState();
}

class _PawstagramState extends State<Pawstagram> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFEDF0F6),
        leading: GestureDetector(
          child: Icon(
            Icons.menu,
            color: Color(0xff008891),
          ),
          onTap: () {
            Navigator.popAndPushNamed(context, SideBar.id);
          },
        ),
        title: Text(
          "Pawstagram",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Color(0xFFEDF0F6),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          physics: AlwaysScrollableScrollPhysics(),
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Container(
                width: double.infinity,
                height: 460.0,
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
                                    image:
                                        AssetImage("images/pawfecto-logo.jpeg"),
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
                              margin: EdgeInsets.all(10.0),
                              width: double.infinity,
                              height: 300.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                image: DecorationImage(
                                  image: AssetImage("images/paws_1.jpg"),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                            FontAwesomeIcons.grinTears,
                                          ),
                                          iconSize: 20.0,
                                          onPressed: () => {},
                                        ),
                                        Text(
                                          '5',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 20.0),
                                    Row(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                            FontAwesomeIcons.grinHearts,
                                          ),
                                          iconSize: 20.0,
                                          onPressed: () => {},
                                        ),
                                        Text(
                                          '10',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 20.0),
                                    Row(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                            FontAwesomeIcons.sadTear,
                                          ),
                                          iconSize: 20.0,
                                          onPressed: () => {},
                                        ),
                                        Text(
                                          '15',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 20.0),
                                    Row(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                            FontAwesomeIcons.angry,
                                          ),
                                          iconSize: 20.0,
                                          onPressed: () => {},
                                        ),
                                        Text(
                                          '25',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Container(
                width: double.infinity,
                height: 460.0,
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
                                    image:
                                        AssetImage("images/pawfecto-logo.jpeg"),
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
                              margin: EdgeInsets.all(10.0),
                              width: double.infinity,
                              height: 300.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                image: DecorationImage(
                                  image: AssetImage("images/paws_2.jpg"),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                            FontAwesomeIcons.grinTears,
                                          ),
                                          iconSize: 20.0,
                                          onPressed: () => {},
                                        ),
                                        Text(
                                          '5',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 20.0),
                                    Row(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                            FontAwesomeIcons.grinHearts,
                                          ),
                                          iconSize: 20.0,
                                          onPressed: () => {},
                                        ),
                                        Text(
                                          '10',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 20.0),
                                    Row(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                            FontAwesomeIcons.sadTear,
                                          ),
                                          iconSize: 20.0,
                                          onPressed: () => {},
                                        ),
                                        Text(
                                          '15',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 20.0),
                                    Row(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                            FontAwesomeIcons.angry,
                                          ),
                                          iconSize: 20.0,
                                          onPressed: () => {},
                                        ),
                                        Text(
                                          '25',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Container(
                width: double.infinity,
                height: 460.0,
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
                                    image:
                                        AssetImage("images/pawfecto-logo.jpeg"),
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
                              margin: EdgeInsets.all(10.0),
                              width: double.infinity,
                              height: 300.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                image: DecorationImage(
                                  image: AssetImage("images/paws_3.jpg"),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                            FontAwesomeIcons.grinTears,
                                          ),
                                          iconSize: 20.0,
                                          onPressed: () => {},
                                        ),
                                        Text(
                                          '5',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 20.0),
                                    Row(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                            FontAwesomeIcons.grinHearts,
                                          ),
                                          iconSize: 20.0,
                                          onPressed: () => {},
                                        ),
                                        Text(
                                          '10',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 20.0),
                                    Row(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                            FontAwesomeIcons.sadTear,
                                          ),
                                          iconSize: 20.0,
                                          onPressed: () => {},
                                        ),
                                        Text(
                                          '15',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 20.0),
                                    Row(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                            FontAwesomeIcons.angry,
                                          ),
                                          iconSize: 20.0,
                                          onPressed: () => {},
                                        ),
                                        Text(
                                          '25',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
