import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pawfecto/screens/user/adopt/adopt_form.dart';

class PetDetails extends StatefulWidget {
  PetDetails({@required this.pet});

  final Map pet;

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
                  image: DecorationImage(
                    image: NetworkImage(this.widget.pet["imageURL"]),
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
                ),
              ),
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
                            this.widget.pet["name"],
                            style: TextStyle(
                                color: Color(0xff008891),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            this.widget.pet["breed"],
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
                            this.widget.pet["gender"] == 'Female'
                                ? FontAwesomeIcons.venus
                                : FontAwesomeIcons.mars,
                            color: Color(0xff008891),
                            size: 30,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            this.widget.pet["age"],
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
                          Text(
                            'Type',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            this.widget.pet["type"],
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Color',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            this.widget.pet["color"],
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Weight',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            this.widget.pet["weight"],
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Certified',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            this.widget.pet["isCertified"]
                                ? Icons.verified_rounded
                                : Icons.clear,
                            color: this.widget.pet["isCertified"]
                                ? Color(0xff008891)
                                : Colors.red,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * .86,
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
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AdoptForm(pet: this.widget.pet),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'Contact Shelter',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
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
