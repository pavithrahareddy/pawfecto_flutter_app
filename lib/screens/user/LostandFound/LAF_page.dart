import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pawfecto/screens/user/LostandFound/lostpet_form.dart';
import 'package:pawfecto/screens/user/LostandFound/straypet_form.dart';
import 'package:pawfecto/screens/user/sidebar.dart';

import '../profile.dart';

class LAFPage extends StatefulWidget {
  static const String id = 'LAF_page';
  @override
  _LAFPageState createState() => _LAFPageState();
}

class _LAFPageState extends State<LAFPage> {
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
              Card(
                shadowColor: Colors.grey,
                elevation: 5,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.50,
                        width: MediaQuery.of(context).size.width * 0.40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/cat1.jpg'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.60,
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10, top: 10, bottom: 10, right: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
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
                                Text("Animal: "),
                                Text("Dog"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Color: "),
                                Text("Brown"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Strength: "),
                                Text("Active"),
                              ],
                            ),
                            Text(
                              "Description: ",
                            ),
                            Flexible(
                              child: Text(
                                "It has a red belt around its neck.",
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
                                  "RAJAJINAGAR,BANGALORE",
                                  style: TextStyle(
                                    fontSize: 12.0,
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
                                  "9535666777",
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
              ),
              Card(
                shadowColor: Colors.grey,
                elevation: 5,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.40,
                        width: MediaQuery.of(context).size.width * 0.40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/dog2.jpg'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.60,
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10, top: 10, bottom: 10, right: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
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
                                Text("Animal: "),
                                Text("Dog"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Color: "),
                                Text("Brown"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Strength: "),
                                Text("Active"),
                              ],
                            ),
                            Text(
                              "Description: ",
                            ),
                            Flexible(
                              child: Text(
                                "It has a red belt around its neck.",
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
                                  "RAJAJINAGAR,BANGALORE",
                                  style: TextStyle(
                                    fontSize: 12.0,
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
                                  "9535666777",
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
              ),
              Card(
                shadowColor: Colors.grey,
                elevation: 5,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.50,
                        width: MediaQuery.of(context).size.width * 0.40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/dog1.jpg'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.60,
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10, top: 10, bottom: 10, right: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
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
                                Text("Animal: "),
                                Text("Dog"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Color: "),
                                Text("Brown"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Strength: "),
                                Text("Active"),
                              ],
                            ),
                            Text(
                              "Description: ",
                            ),
                            Flexible(
                              child: Text(
                                "It has a red belt around its neck.",
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
                                  "RAJAJINAGAR,BANGALORE",
                                  style: TextStyle(
                                    fontSize: 12.0,
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
                                  "9535666777",
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
              ),
              Card(
                shadowColor: Colors.grey,
                elevation: 5,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.50,
                        width: MediaQuery.of(context).size.width * 0.40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/dog1.jpg'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.60,
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10, top: 10, bottom: 10, right: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
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
                                Text("Animal: "),
                                Text("Dog"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Color: "),
                                Text("Brown"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Strength: "),
                                Text("Active"),
                              ],
                            ),
                            Text(
                              "Description: ",
                            ),
                            Flexible(
                              child: Text(
                                "It has a red belt around its neck.",
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
                                  "RAJAJINAGAR,BANGALORE",
                                  style: TextStyle(
                                    fontSize: 12.0,
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
                                  "9535666777",
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
              ),
              Card(
                shadowColor: Colors.grey,
                elevation: 5,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.50,
                        width: MediaQuery.of(context).size.width * 0.40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/dog1.jpg'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.60,
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10, top: 10, bottom: 10, right: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
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
                                Text("Animal: "),
                                Text("Dog"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Color: "),
                                Text("Brown"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Strength: "),
                                Text("Active"),
                              ],
                            ),
                            Text(
                              "Description: ",
                            ),
                            Flexible(
                              child: Text(
                                "It has a red belt around its neck.",
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
                                  "RAJAJINAGAR,BANGALORE",
                                  style: TextStyle(
                                    fontSize: 12.0,
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
                                  "9535666777",
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
              ),
              Card(
                shadowColor: Colors.grey,
                elevation: 5,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.50,
                        width: MediaQuery.of(context).size.width * 0.40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/dog1.jpg'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.60,
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10, top: 10, bottom: 10, right: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
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
                                Text("Animal: "),
                                Text("Dog"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Color: "),
                                Text("Brown"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Strength: "),
                                Text("Active"),
                              ],
                            ),
                            Text(
                              "Description: ",
                            ),
                            Flexible(
                              child: Text(
                                "It has a red belt around its neck.",
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
                                  "RAJAJINAGAR,BANGALORE",
                                  style: TextStyle(
                                    fontSize: 12.0,
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
                                  "9535666777",
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
              ),
              Card(
                shadowColor: Colors.grey,
                elevation: 5,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.50,
                        width: MediaQuery.of(context).size.width * 0.40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/dog1.jpg'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.60,
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10, top: 10, bottom: 10, right: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
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
                                Text("Animal: "),
                                Text("Dog"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Color: "),
                                Text("Brown"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Strength: "),
                                Text("Active"),
                              ],
                            ),
                            Text(
                              "Description: ",
                            ),
                            Flexible(
                              child: Text(
                                "It has a red belt around its neck.",
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
                                  "RAJAJINAGAR,BANGALORE",
                                  style: TextStyle(
                                    fontSize: 12.0,
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
                                  "9535666777",
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
              ),
              Card(
                shadowColor: Colors.grey,
                elevation: 5,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.50,
                        width: MediaQuery.of(context).size.width * 0.40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/cat1.jpg'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width * 0.60,
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 10, top: 10, bottom: 10, right: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
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
                                Text("Animal: "),
                                Text("Dog"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Color: "),
                                Text("Brown"),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Strength: "),
                                Text("Active"),
                              ],
                            ),
                            Text(
                              "Description: ",
                            ),
                            Flexible(
                              child: Text(
                                "It has a red belt around its neck.",
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
                                  "RAJAJINAGAR,BANGALORE",
                                  style: TextStyle(
                                    fontSize: 12.0,
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
                                  "9535666777",
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
                  "Found a lost pet or stray animal? ",style: TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),),
              Text(
                  "Here's how to help them find their way home. "),
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
                      Navigator.popAndPushNamed(context, StrayPetForm.id);
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
                      Navigator.popAndPushNamed(context, LostPetForm.id);
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
