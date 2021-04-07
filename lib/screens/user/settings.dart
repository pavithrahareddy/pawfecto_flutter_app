import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pawfecto/screens/user/sidebar.dart';

class Settings extends StatefulWidget {
  static const String id = 'Settings';
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
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
        title: Text('Settings', style: TextStyle(color: Colors.black),),
      ),
      body: Stack
        (
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 10.0),
                Card(
                  margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.language, color: Color(0xff008891),),
                        title: Text("Change Language"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          //open change password
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Text("Other Settings", style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),),
                SwitchListTile(
                  dense: true,
                  activeColor: Color(0xff008891),
                  contentPadding: const EdgeInsets.all(0),
                  value: true,
                  title: Text("Receive Notifications"),
                  onChanged: (Val) {},
                ),
                SwitchListTile(
                  dense: true,
                  activeColor: Color(0xff008891),
                  contentPadding: const EdgeInsets.all(0),
                  value: true,
                  title: Text("Theme: Dark/Light"),
                  onChanged: (value) {

                  },
                ),


              ],
            ),
          ),
        ],//children
      ),
    );
  }
}