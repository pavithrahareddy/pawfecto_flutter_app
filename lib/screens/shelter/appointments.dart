import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Appointments extends StatefulWidget {
  static const String id = 'appointments';

  @override
  _AppointmentsState createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  void sendEmailNotification({Map user}) async {
    String username = env['EMAIL'];
    String password = env['PASSWORD'];

    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, 'Pawfecto')
      ..recipients.add(user["email"])
      ..subject = 'Confirmation: Appointment Scheduled on ${user["date"]}'
      ..text =
          'Hi ${user["name"]},.\n\nThis is to notify you that your appointment has been confirmed on ${user["date"]} at ${user["time"]}\nHope you find your Pawfect match!\n\nTeam Pawfecto';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      print(e);
    }
  }

  String _uid;
  void getUID() {
    setState(() {
      _uid = _auth.currentUser.uid;
    });
  }

  @override
  void initState() {
    super.initState();
    getUID();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.arrowLeft,
            color: Color(0xff008891),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .45,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/appointment.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'Please accept the following scheduled appointments',
                style: TextStyle(fontSize: 17.0, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5.0,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('shelters').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  List appointments = [];
                  List<Widget> userCards = [];
                  Widget userCard = Container();

                  final shelters = snapshot.data.docs;

                  // fetch the pets under the current user
                  for (var shelter in shelters) {
                    if (shelter.id == _uid) {
                      if (shelter.data()["adopters"] != []) {
                        appointments = shelter.data()["adopters"];
                        break;
                      }
                    }
                  }

                  for (var user in appointments) {
                    bool isAccepted = user["isAccepted"];
                    userCard = Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 15.0,
                        ),
                        child: Card(
                          shadowColor: Colors.grey,
                          elevation: 5,
                          child: Column(
                            children: [
                              Container(
                                // height: MediaQuery.of(context).size.height * 0.11,
                                width: MediaQuery.of(context).size.width * 0.85,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20.0,
                                    top: 15.0,
                                    right: 20.0,
                                    bottom: 15.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            user["name"] ?? 'Fallback',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                color: Color(0xff008891)),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.email,
                                                color: Colors.grey,
                                                size: 14.0,
                                              ),
                                              SizedBox(
                                                width: 5.0,
                                              ),
                                              Text(
                                                user["email"] ?? 'Fallback',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image(
                                            image: NetworkImage(
                                              user["pet"]["imageURL"],
                                            ),
                                            width: 70.0,
                                            height: 70.0,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.phone,
                                                    color: Colors.blueGrey,
                                                    size: 15.0,
                                                  ),
                                                  SizedBox(
                                                    width: 5.0,
                                                  ),
                                                  Text(
                                                    user["phone"] ?? 'Fallback',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 13.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                'Pet: ${user["pet"]["name"]}' ??
                                                    'Fallback',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                user["date"] ?? 'Fallback',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                user["time"] ?? 'Fallback',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              ElevatedButton(
                                                onPressed: isAccepted
                                                    ? null
                                                    : () async {
                                                        try {
                                                          List appoint =
                                                              appointments;
                                                          appoint[user["id"] -
                                                              1] = {
                                                            "name": appointments[
                                                                user["id"] -
                                                                    1]["name"],
                                                            "email": appointments[
                                                                user["id"] -
                                                                    1]["email"],
                                                            "phone": appointments[
                                                                user["id"] -
                                                                    1]["phone"],
                                                            "date": appointments[
                                                                user["id"] -
                                                                    1]["date"],
                                                            "time": appointments[
                                                                user["id"] -
                                                                    1]["time"],
                                                            "pet": appointments[
                                                                user["id"] -
                                                                    1]["pet"],
                                                            'id': appointments[
                                                                user["id"] -
                                                                    1]["id"],
                                                            'isAccepted': true,
                                                          };

                                                          await _firestore
                                                              .collection(
                                                                  'shelters')
                                                              .doc(_uid)
                                                              .update({
                                                            "adopters": appoint,
                                                          });

                                                          sendEmailNotification(
                                                              user: user);
                                                        } catch (e) {
                                                          print(e);
                                                        }
                                                      },
                                                child: Text(
                                                  'Accept',
                                                ),
                                                style: ButtonStyle(
                                                  backgroundColor: isAccepted
                                                      ? MaterialStateProperty
                                                          .all<Color>(
                                                              Colors.grey)
                                                      : MaterialStateProperty
                                                          .all<Color>(
                                                          Color(0xff008891),
                                                        ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                isAccepted
                                                    ? 'Accepted'
                                                    : 'Pending',
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.0,
                                              ),
                                              isAccepted
                                                  ? Icon(Icons.verified_rounded,
                                                      color: Color(0xff008891))
                                                  : Icon(Icons.warning,
                                                      color: Colors.red),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                    userCards.add(userCard);
                  }

                  return Column(
                    children: userCards,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
