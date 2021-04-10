import 'package:flutter/material.dart';
import 'package:pawfecto/screens/auth/shelter_register.dart';
import 'package:pawfecto/components/rounded_button.dart';
import 'package:pawfecto/constants/constants.dart';
import 'package:pawfecto/screens/shelter/shelter_main_pet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pawfecto/screens/welcome.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShelterLogin extends StatefulWidget {
  static const String id = 'shelter_login';
  @override
  _ShelterLoginState createState() => _ShelterLoginState();
}

class _ShelterLoginState extends State<ShelterLogin> {
  // Firebase instances
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  bool isLoading = false;
  String email;
  String password;
  String errorMessage = '';
  bool isErrorVisible = false;
  QuerySnapshot users;

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  void getUsers() async {
    users = await _firestore.collection('shelters').get();
  }

  bool findUser() {
    for (var user in users.docs) {
      if (user.data().containsValue(email)) {
        return true;
      }
    }
    return false;
  }

  @override
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

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
                        'SHELTER LOGIN',
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
                      height: 10.0,
                    ),
                    RoundedButton(
                      title: 'LOGIN',
                      colour: Color.fromARGB(255, 0, 136, 145),
                      tcolor: Colors.white,
                      onPressed: () async {
                        // set spinner to true
                        setState(() {
                          isLoading = true;
                          isErrorVisible = false;
                        });
                        if (findUser()) {
                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: email, password: password);

                            if (user != null) {
                              Navigator.popAndPushNamed(
                                  context, ShelterMainPet.id);
                            }

                            // set spinner to false
                            setState(() {
                              isLoading = false;
                            });
                          } catch (e) {
                            print(e);
                            setState(() {
                              errorMessage = e.message;
                              isErrorVisible = true;
                              isLoading = false;
                            });
                          }
                        } else {
                          setState(() {
                            isErrorVisible = true;
                            errorMessage = 'User Not Found';
                            isLoading = false;
                          });
                        }
                      },
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      alignment: Alignment.center,
                      child: GestureDetector(
                        child: Text(
                          'FORGOT PASSWORD',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 136, 145),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          resetPassword(email);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Password reset link sent to mail',
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              fontSize: 17,
                              // decoration: TextDecoration.underline,
                              color: Colors.grey,
                            ),
                          ),
                          GestureDetector(
                              child: Text("Register",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 17,
                                      // decoration: TextDecoration.underline,
                                      color: Color.fromARGB(255, 0, 136, 145))),
                              onTap: () {
                                Navigator.pushNamed(context, SRegister.id);
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
