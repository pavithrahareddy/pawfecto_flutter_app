import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PetDetails extends StatefulWidget {
  static const String id = 'pet_detail';

  @override
  _PetDetailsState createState() => _PetDetailsState();
}

class _PetDetailsState extends State<PetDetails> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .40,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    image: DecorationImage(
                      image: AssetImage('images/dog1.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0.0,
                          top: 0.0,
                          child: GestureDetector(
                            child: Icon(
                              FontAwesomeIcons.arrowLeft,
                              color: Colors.black,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Positioned(
                          right: 0.0,
                          top: 0.0,
                          child: GestureDetector(
                            child: Icon(
                              FontAwesomeIcons.share,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * .37,
              left: 15,
              right: 15,
              child: Card(
                elevation: 8,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  width: MediaQuery.of(context).size.height * .90,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Ellie",
                            style: TextStyle(
                                color: Color(0xff008891),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "Golden Retriever",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 17.0,
                              // fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.venus,
                            color: Color(0xff008891),
                            size: 30,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "3 years old",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 17.0,
                              // fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * .53,
              left: 15,
              right: 15,
              child: Card(
                elevation: 8,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  width: MediaQuery.of(context).size.height * .90,
                  height: 230,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 20.0,
                            backgroundImage: AssetImage('images/profile.png'),
                          ),
                          Column(
                            children: [
                              Text(
                                "Ananya",
                                style: TextStyle(
                                    color: Color(0xff008891),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Owner",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13.0,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "25 March, 2021",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                              // fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 30.0),
                        child: Text(
                          " et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi.",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                            // fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * .84,
              left: 15,
              right: 15,
              child: Row(
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(20.0),
                    elevation: 4.0,
                    color: Color.fromARGB(255, 0, 136, 145),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isFavourite = !isFavourite;
                          });
                        },
                        child: Icon(
                          isFavourite
                              ? FontAwesomeIcons.solidHeart
                              : FontAwesomeIcons.heart,
                          color: Colors.white,
                        ),
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
                          'Adopt',
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
          ],
        ),
      ),
    );
  }
}
