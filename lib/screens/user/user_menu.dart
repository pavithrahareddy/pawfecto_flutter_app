import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pawfecto/screens/auth/adopt_login.dart';

class UserMenu extends StatefulWidget {
  static const String id = 'user_menu';
  final Function(int) menuCallback;

  UserMenu({this.menuCallback});
  @override
  _UserMenuState createState() => _UserMenuState();
}

class _UserMenuState extends State<UserMenu> {
  int selectedMenuIndex = 0;

  List<String> menuItems = [
    'Profile',
    'Adoption',
    'Events',
    'Donation',
    'Favorites',
    'Settings',
  ];

  List<IconData> icons = [
    FontAwesomeIcons.userAlt,
    FontAwesomeIcons.paw,
    FontAwesomeIcons.democrat,
    FontAwesomeIcons.home,
    FontAwesomeIcons.heart,
    FontAwesomeIcons.cog,
  ];

  Widget buildMenuRow(int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedMenuIndex = index;
          widget.menuCallback(index);
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 27.0),
        child: Row(
          children: <Widget>[
            Icon(
              icons[index],
              color: selectedMenuIndex == index
                  ? Colors.white
                  : Colors.white.withOpacity(0.5),
            ),
            SizedBox(
              width: 16.0,
            ),
            Text(
              menuItems[index],
              style: TextStyle(
                color: selectedMenuIndex == index
                    ? Colors.white
                    : Colors.white.withOpacity(0.5),
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 30.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 35.0,
                      backgroundImage: AssetImage('images/pawsfecto.png'),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Alexa',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 22.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: menuItems
                      .asMap()
                      .entries
                      .map((mapEntry) => buildMenuRow(mapEntry.key))
                      .toList(),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 13.0),
                  child: Material(
                    elevation: 5.0,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AdoptLogin.id);
                      },
                      minWidth: 150.0,
                      height: 30.0,
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 136, 145),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.center,
              colors: [
                Color.fromARGB(255, 1, 114, 120),
                Color.fromARGB(255, 0, 99, 109),
              ]),
        ),
      ),
    );
  }
}
