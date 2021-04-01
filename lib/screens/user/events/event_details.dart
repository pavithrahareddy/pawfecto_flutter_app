import 'package:flutter/material.dart';
import 'package:pawfecto/screens/user/events/event_register.dart';
import 'package:pawfecto/screens/user/sidebar.dart';


class EventDetails extends StatefulWidget {
  static const String id = 'event_detail';
  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
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
        title: Text(
          'Events',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          Icon(
            Icons.location_on,
            color: Color(0xff008891),
          ),
          SizedBox(
            width: 15,
          ),
          CircleAvatar(
            radius: 15.0,
            backgroundImage: AssetImage('images/profile.png'),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Card(
                  child: Column(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ListTile(
                            title: Center(
                                child: Text(
                                  'Willie Pet Paradise',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )),
                            tileColor: Color.fromARGB(255, 0, 136, 145),
                            subtitle: Center(
                              child: Text(
                                'Sarjapur Road,Bangalore',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Image.asset('images/event.jpeg',
                                scale: 0.5,
                                height: 200,
                                width: 150,
                                fit: BoxFit.fitWidth),
                          ),
                          Container(
                            color: Color.fromARGB(255, 202, 247, 227),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Date : 5th April,2021',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Time : 9:00 am',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Description : Celebrate holi this year with your furries with exciting events and food',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    TextButton(
                                      child: Text('Register'),
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor: Colors.teal,
                                        onSurface: Colors.grey,
                                      ),
                                      onPressed: () {
                                        Navigator.pushNamed(context, EventRegister.id);
                                      },
                                    ),
                                    const SizedBox(width: 15),
                                    TextButton(
                                      child: Text('Enquire'),
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor: Colors.teal,
                                        onSurface: Colors.grey,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 13),
                Card(
                  child: Column(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ListTile(
                            title: Center(
                                child: Text(
                                  'Willie Pet Paradise',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )),
                            tileColor: Color.fromARGB(255, 0, 136, 145),
                            subtitle: Center(
                              child: Text(
                                'Sarjapur Road,Bangalore',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Image.asset('images/event.jpeg',
                                scale: 0.5,
                                height: 200,
                                width: 150,
                                fit: BoxFit.fitWidth),
                          ),
                          Container(
                            color: Color.fromARGB(255, 202, 247, 227),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Date : 5th April,2021',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Time : 9:00 am',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Description : Celebrate holi this year with your furries with exciting events and food',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    TextButton(
                                      child: Text('Register'),
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor: Colors.teal,
                                        onSurface: Colors.grey,
                                      ),
                                      onPressed: () {},
                                    ),
                                    const SizedBox(width: 15),
                                    TextButton(
                                      child: Text('Enquire'),
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor: Colors.teal,
                                        onSurface: Colors.grey,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 13),
                Card(
                  child: Column(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ListTile(
                            title: Center(
                                child: Text(
                                  'Willie Pet Paradise',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )),
                            tileColor: Color.fromARGB(255, 0, 136, 145),
                            subtitle: Center(
                              child: Text(
                                'Sarjapur Road,Bangalore',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Image.asset('images/event.jpeg',
                                scale: 0.5,
                                height: 200,
                                width: 150,
                                fit: BoxFit.fitWidth),
                          ),
                          Container(
                            color: Color.fromARGB(255, 202, 247, 227),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Date : 5th April,2021',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Time : 9:00 am',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Description : Celebrate holi this year with your furries with exciting events and food',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    TextButton(
                                      child: Text('Register'),
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor: Colors.teal,
                                        onSurface: Colors.grey,
                                      ),
                                      onPressed: () {},
                                    ),
                                    const SizedBox(width: 15),
                                    TextButton(
                                      child: Text('Enquire'),
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor: Colors.teal,
                                        onSurface: Colors.grey,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 13),
                Card(
                  child: Column(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ListTile(
                            title: Center(
                                child: Text(
                                  'Willie Pet Paradise',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )),
                            tileColor: Color.fromARGB(255, 0, 136, 145),
                            subtitle: Center(
                              child: Text(
                                'Sarjapur Road,Bangalore',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Image.asset('images/event.jpeg',
                                scale: 0.5,
                                height: 200,
                                width: 150,
                                fit: BoxFit.fitWidth),
                          ),
                          Container(
                            color: Color.fromARGB(255, 202, 247, 227),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Date : 5th April,2021',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Time : 9:00 am',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Description : Celebrate holi this year with your furries with exciting events and food',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    TextButton(
                                      child: Text('Register'),
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor: Colors.teal,
                                        onSurface: Colors.grey,
                                      ),
                                      onPressed: () {},
                                    ),
                                    const SizedBox(width: 15),
                                    TextButton(
                                      child: Text('Enquire'),
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor: Colors.teal,
                                        onSurface: Colors.grey,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 13),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
