import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pawfecto/screens/shelter/sheltersidebar.dart';

class ShelterMain extends StatefulWidget {
  static const String id = 'shelter_main';
  @override
  _ShelterMainState createState() => _ShelterMainState();
}

class _ShelterMainState extends State<ShelterMain> {

  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[

    // First Container is for all Pets
    Container(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                GestureDetector(
                  child: Image(
                    image: AssetImage('images/dog1.jpg'),
                    // width: 150.0,
                    // height: 250.0,
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Ellie',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            'Labrador',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                GestureDetector(
                  child: Image(
                    image: AssetImage('images/dog1.jpg'),
                    // width: 150.0,
                    // height: 250.0,
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Ellie',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            'Labrador',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                GestureDetector(
                  child: Image(
                    image: AssetImage('images/dog1.jpg'),
                    // width: 150.0,
                    // height: 250.0,
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Ellie',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ),
                          ),
                          Text(
                            'Labrador',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),),

    //Second Container is for all events
    Container(
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
  ];

  //Selecting navigator option
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //appbar for menu and profile button
      appBar: AppBar(
        elevation: 5,
        backgroundColor:Color.fromARGB(255, 0, 136, 145) ,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.pushNamed(context, ShelterSideBar.id);
                },
              ),
              SizedBox(
                width: 345,
              ),
              CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage('images/profile.png'),
              ),
            ],
          ),
        ],
      ),

      //body area scrollable all events and pets
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: _widgetOptions.elementAt(_selectedIndex),
                )
              ],
            ),
          )),

      //bottom navigation between all pets and all events
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        iconSize: 30,
        selectedFontSize: 18,
        unselectedFontSize: 16,
        backgroundColor: Color.fromARGB(255, 0, 136, 145),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.dog),
            label: 'Pets',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.democrat),
            label: '   Events',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Color.fromARGB(255, 202, 247, 227),
        onTap: _onItemTapped,
      ),
    );
  }
}
