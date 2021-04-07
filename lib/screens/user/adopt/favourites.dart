import 'package:flutter/material.dart';
import 'package:pawfecto/screens/user/sidebar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Favorites extends StatefulWidget {
  static const String id = 'Favorites';
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
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
            'Favorites',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(
              Icons.search,),
              color: Color(0xff008891),),
          ]
      ),

      backgroundColor: Colors.white,
      body:
      Padding(
        padding: EdgeInsets.only(
          top: 20.0,
        ),
        child: Center(
          child: Column(
            children: [
              Card(
                shadowColor: Colors.grey,
                elevation: 5,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        height:
                        MediaQuery.of(context).size.width *
                            0.70,
                        width: MediaQuery.of(context).size.width *
                            0.80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                            AssetImage(
                                'images/dog1.jpg'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width *
                          0.85,
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children:<Widget> [
                                    Text(
                                      "name",
                                      style: TextStyle(
                                        fontSize: 25.0,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      FontAwesomeIcons.venus,
                                      color: Color.fromARGB(
                                          255, 0, 136, 145),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Icon(
                                FontAwesomeIcons.heart,
                                color: Color.fromARGB(255, 0, 136, 145),
                              )
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
    );
  }
}