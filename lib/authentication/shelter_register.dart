import 'package:flutter/material.dart';
import 'package:pawfecto/authentication/shelter_login.dart';
import 'package:pawfecto/authentication/shelter_main.dart';
import 'package:pawfecto/components/rounded_button.dart';
import 'package:pawfecto/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SRegister extends StatefulWidget {
  static const String id = 's_register';
  @override
  _SRegisterState createState() => _SRegisterState();
}

class _SRegisterState extends State<SRegister> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  bool isLoading = false;
  String email;
  String shelterName;
  String phone;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: SafeArea(
          top: true,
          bottom: true,
          right: true,
          left: true,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: Image.asset('images/pawsfecto.png'),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Container(
                      child: Text(
                        'REGISTER SHELTER',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 136, 145),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 38.0,
                    ),
                    TextFormField(
                      decoration: textinputdecoration.copyWith(
                        hintText: 'Enter Shelter Name',
                        labelText: 'SHELTER NAME',
                      ),
                      onChanged: (value) {
                        shelterName = value;
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      decoration: textinputdecoration.copyWith(
                        hintText: 'Enter Email',
                        labelText: 'EMAIL',
                      ),
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      decoration: textinputdecoration.copyWith(
                        hintText: 'Enter Phone Number',
                        labelText: 'PHONE',
                      ),
                      onChanged: (value) {
                        phone = value;
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: textinputdecoration.copyWith(
                        hintText: 'Enter Password',
                        labelText: 'PASSWORD',
                      ),
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RoundedButton(
                      title: 'REGISTER',
                      colour: Color.fromARGB(255, 0, 136, 145),
                      tcolor: Colors.white,
                      onPressed: () async {
                        // set spinner to true
                        setState(() {
                          isLoading = true;
                        });

                        try {
                          // must register to firebase
                          final user =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);

                          if (user != null) {
                            Navigator.pushNamed(context, ShelterMain.id);
                          }

                          print(user);

                          // save data to cloud firestore
                          _firestore.collection('shelters').add({
                            'name': shelterName,
                            'email': email,
                            'phone': phone,
                            'pets': [],
                          });

                          // set spinner to false
                          setState(() {
                            isLoading = false;
                          });
                        } catch (e) {
                          print(e);
                        }
                      },
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already a user? ',
                            style: TextStyle(
                              fontSize: 17,
                              // decoration: TextDecoration.underline,
                              color: Colors.grey,
                            ),
                          ),
                          GestureDetector(
                              child: Text("Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 17,
                                      // decoration: TextDecoration.underline,
                                      color: Color.fromARGB(255, 0, 136, 145))),
                              onTap: () {
                                Navigator.pushNamed(context, ShelterLogin.id);
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
