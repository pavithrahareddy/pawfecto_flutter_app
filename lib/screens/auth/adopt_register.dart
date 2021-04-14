import 'package:flutter/material.dart';
import 'package:pawfecto/screens/auth/adopt_login.dart';
import 'package:pawfecto/components/rounded_button.dart';
import 'package:pawfecto/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:pawfecto/screens/welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdoptRegister extends StatefulWidget {
  static const String id = 'adopt_register';
  @override
  _AdoptRegisterState createState() => _AdoptRegisterState();
}

class _AdoptRegisterState extends State<AdoptRegister> {
  // private instance auth, which will be used to register
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  bool isLoading = false;
  String name;
  String phone;
  String email;
  String password;

  // handling errors
  String errorMessage = '';
  bool isErrorVisible = false;

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
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, Welcome.id, (route) => false);
                      },
                      child: Container(
                        child: Image.asset('images/pawsfecto.png'),
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Container(
                      child: Text(
                        'REGISTER USER',
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
                        // hintText: 'Enter Name',
                        labelText: 'Name',
                      ),
                      onChanged: (value) {
                        name = value;
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: textinputdecoration.copyWith(
                        // hintText: 'Enter Email',
                        labelText: 'Email',
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
                        // hintText: 'Enter Phone Number',
                        labelText: 'Phone',
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
                        // hintText: 'Enter Password',
                        labelText: 'Password',
                      ),
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Visibility(
                      visible: isErrorVisible,
                      child: Text(
                        errorMessage,
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      replacement: SizedBox.shrink(),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    RoundedButton(
                      title: 'REGISTER',
                      colour: Color.fromARGB(255, 0, 136, 145),
                      tcolor: Colors.white,
                      onPressed: () async {
                        // set the spinner to true
                        setState(() {
                          isErrorVisible = false;
                          isLoading = true;
                        });

                        // to catch errors such as already registered user
                        try {
                          // returns a Future
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);

                          await newUser.user.sendEmailVerification();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Email Verification Link Sent',
                              ),
                            ),
                          );
                          if (newUser != null) {
                            // save data to firestore
                            _firestore
                                .collection('users')
                                .doc(newUser.user.uid)
                                .set({
                              'name': name,
                              'email': email,
                              'phone': phone,
                              'favourites': [],
                              'lostAndFound': [],
                              'events': [],
                              'city': '',
                              'state': '',
                            });
                            Navigator.pushNamed(context, AdoptLogin.id);
                          }

                          // set spinner to false
                          setState(() {
                            isLoading = false;
                          });
                        } catch (e) {
                          setState(() {
                            errorMessage = e.message;
                            isErrorVisible = true;
                            isLoading = false;
                          });
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
                                Navigator.pushNamed(context, AdoptLogin.id);
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
