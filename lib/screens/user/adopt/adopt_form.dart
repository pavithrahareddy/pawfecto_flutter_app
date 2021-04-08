import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:pawfecto/screens/user/adopt/pet_details.dart';
import 'package:date_field/date_field.dart';
import 'package:pawfecto/screens/user/adopt_main.dart';

class AdoptForm extends StatefulWidget {
  AdoptForm({@required this.pet});

  final Map pet;

  static const String id = 'adopt_form';
  @override
  _AdoptFormState createState() => _AdoptFormState();
}

class _AdoptFormState extends State<AdoptForm> {
  final _firestore = FirebaseFirestore.instance;

  final _formKey = GlobalKey<FormState>();
  String _name;
  String _number;
  String _email;
  String _date;
  String _time;

  bool isLoading = false;
  bool isUserRegistered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: SafeArea(
          child: !isUserRegistered
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0, top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              child: Icon(
                                Icons.close,
                              ),
                              onTap: () {
                                Navigator.popAndPushNamed(
                                    context, PetDetails.id);
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Text(
                          'Appointment',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Color(0xff008891),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18.0,
                      ),
                      Text('Note : Available Monday to Saturday, 9am to 7pm',
                          style: TextStyle(color: Colors.grey)),
                      SizedBox(
                        height: 30.0,
                      ),
                      Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                  // filled: true,
                                  labelText: 'Name',
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff008891),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Name is Required';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    _name = value;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  // filled: true,
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Email is Required';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    _email = value;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  // filled: true,
                                  labelText: 'Mobile Number',
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Mobile Number is Required';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    _number = value;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              DateTimeFormField(
                                decoration: InputDecoration(
                                  // filled: true,
                                  labelText: 'Date ',
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  suffixIcon: Icon(Icons.event_note),
                                ),
                                mode: DateTimeFieldPickerMode.date,
                                autovalidateMode: AutovalidateMode.always,
                                validator: (e) => (e?.day ?? 0) == 1
                                    ? 'Cant choose the same day'
                                    : null,
                                onDateSelected: (DateTime value) {
                                  _date = value.toIso8601String().split("T")[0];
                                },
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              DateTimeFormField(
                                initialDatePickerMode: DatePickerMode.day,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.access_time_outlined),
                                  labelText: 'Time',
                                  labelStyle: TextStyle(
                                    color: Color(0xff008891),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                mode: DateTimeFieldPickerMode.time,
                                autovalidateMode: AutovalidateMode.always,
                                validator: (e) => (e?.timeZoneOffset ?? 0) == 1
                                    ? 'Enter valid time'
                                    : null,
                                onDateSelected: (DateTime value) {
                                  _time = value
                                      .toIso8601String()
                                      .split("T")[1]
                                      .split(".")[0];
                                },
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xff008891),
                          ),
                        ),
                        child: Text(
                          'Schedule',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });

                          try {
                            await _firestore
                                .collection('shelters')
                                .doc(this.widget.pet["uid"])
                                .update({
                              "adopters": FieldValue.arrayUnion([
                                {
                                  "name": _name,
                                  "email": _email,
                                  "phone": _number,
                                  "date": _date,
                                  "time": _time,
                                  "pet": this.widget.pet
                                }
                              ])
                            });

                            setState(() {
                              isLoading = false;
                              isUserRegistered = true;
                            });
                          } catch (e) {
                            print(e);
                          }
                        },
                      )
                    ],
                  ),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        width: 200.0,
                        height: 200.0,
                        image: AssetImage('images/reg_success.jpg'),
                      ),
                      Text(
                        'The shelter will contact you soon!',
                        style: TextStyle(
                          fontSize: 17.0,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, AdoptMain.id, (route) => false);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xff008891),
                          ),
                        ),
                        child: Text('HOME'),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
