import 'package:flutter/material.dart';
import 'package:pawfecto/screens/user/donation/donators.dart';
import 'package:pawfecto/screens/user/sidebar.dart';

class DonatePage extends StatefulWidget {
  static const String id = 'donate_page';
  @override
  _DonatePageState createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          child: Icon(
            Icons.menu,
            color: Color(0xff008891),
          ),
          onTap: () {
            Navigator.pushNamed(context, SideBar.id);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey[50],
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: 0,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(30.0),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .65,
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Care for the Homeless Pets",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff008891),
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Text(
                            "Thousands of abandoned, unwanted and injured pets turn to us for help every year.\n",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff000000),
                              fontSize: 15,
                              height: 1.5,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Text(
                            "We, at Pawfecto, believe in finding each one a home that can give them all the love they deserve. You can play a very important role in changing these animals’ lives forever. Your support can help us in our mission to provide the best care for neglected animals. Every donation, no matter how small, can go a long way in putting an end to animal abuse.\n",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              height: 1.5,
                              color: Color(0xff000000),
                              fontSize: 15,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * .48,
                  left: 5,
                  right: 5,
                  child: Container(
                    child: Image(
                      image: AssetImage('images/animals.jpg'),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * .73,
                  left: 15,
                  right: 15,
                  child: Row(
                    children: [
                      Expanded(
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          elevation: 4.0,
                          color: Color.fromARGB(255, 0, 136, 145),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.pushNamed(context, );
                            },
                            child: GestureDetector(
                              onTap: () {
                                Navigator.popAndPushNamed(context, Donators.id);
                              },
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  'Donate',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
