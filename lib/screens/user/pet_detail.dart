import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';


class PetDetail extends StatefulWidget {
  static const String id = 'pet_detail';
  @override
  _PetDetailState createState() => _PetDetailState();
}

class _PetDetailState extends State<PetDetail> {
  final List<String> images = [
    'https://www.cdc.gov/healthypets/images/pets/cute-dog-headshot.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZFZEDHBuZ8xlhsQrz7Ppwf770cXBnJg0OWquiXcOC4EsSh1L2SkC2xT7RB6-Sf8DTJZ0&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQn-dwqhtAIz6_9WvvNkQOOzWEzmaop-jYVIZ5OEbSNR0MCPO6kfGxlRubK8PeG05otpJY&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZC1wxJkfbk7p1d-Yda81XFD6vQ3leh4fGc15PvHCZeoNwhZ98Pf53WXJbTsn4GB0QLsY&usqp=CAU',
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      images.forEach((imageUrl) {
        precacheImage(NetworkImage(imageUrl), context);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {final screenHeight = MediaQuery.of(context).size.height;

  return Scaffold(
    body: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  height: screenHeight * 0.5,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 60.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                FontAwesomeIcons.arrowLeft,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: screenHeight * 0.35,
                  child: Hero(
                    tag: 'Happy',
                    child: CarouselSlider.builder(
                      itemCount: images.length,
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                      ),
                      itemBuilder: (context, index, realIdx) {
                        return Container(
                          child: Center(
                              child: Image.network(images[index], fit: BoxFit.cover, width: 1000)
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 22.0,
                      vertical: 30.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 22.0,
                              backgroundImage: AssetImage('images/profile.png'),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Cupcake',
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 0, 136, 145),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'May 25, 2019',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    'Owner',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'My job requires moving to another country. I don\'t have the opportunity to take the cat with me. I am looking for good people who will shelter Sola.',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  color: Colors.white,
                ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.circular(20.0),
                      elevation: 4.0,
                      color: Color.fromARGB(255, 0, 136, 145),
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Icon(
                          FontAwesomeIcons.heart,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 24.0,
                    ),
                    Expanded(
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        elevation: 4.0,
                        color: Color.fromARGB(255, 0, 136, 145),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'Adoption',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              height: 100,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 202, 247, 227),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.0),
          child: Material(
            borderRadius: BorderRadius.circular(20.0),
            elevation: 6.0,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        'Ghost',
                        style: TextStyle(
                          fontSize: 26.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Icon(
                      //   animal.isFemale
                      //       ? FontAwesomeIcons.venus
                      //       : FontAwesomeIcons.mars,
                      //   color: Colors.grey,
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Scientific Name',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '2 years old',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.mapMarkerAlt,
                        color: Colors.white,
                        size: 16.0,
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        'Address',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 136, 145),
                borderRadius: BorderRadius.circular(20.0),
              ),
              height: 140.0,
            ),
          ),
        )
      ],
    ),
  );
  }
}
