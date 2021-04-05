import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pawfecto/screens/user/LostandFound/LAF_page.dart';

class StrayPetForm extends StatefulWidget {
  static const String id = 'straypet_form';
  @override
  _StrayPetFormState createState() => _StrayPetFormState();
}

class _StrayPetFormState extends State<StrayPetForm> {

  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;


  String _type = 'Dog';
  String _strength;
  String _description;
  String _breed;
  String _color;
  int _number;
  String _location;

  bool _isImageUploaded = false;
  PickedFile _image;
  File _imageFile;
  String _uploadedFileURL;
  FirebaseStorage _storage = FirebaseStorage.instance;

  final picker = ImagePicker();

  Future chooseFile() async {
    await picker.getImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
        _imageFile = File(image.path);
        _isImageUploaded = true;
      });
    });
  }

  void uploadFile() {
    setState(() {
      isLoading = true;
    });
    Reference storageReference =
    _storage.ref().child('Pets/${Path.basename(_image.path)}');
    UploadTask uploadTask = storageReference.putFile(_imageFile);
    uploadTask.then((res) {
      res.ref.getDownloadURL().then((fileURL) {
        setState(() {
          _uploadedFileURL = fileURL;
          print(_uploadedFileURL);
          isLoading = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                        Navigator.popAndPushNamed(context, LAFPage.id);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  'Report Homeless Animal Form',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Color(0xff008891),
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [

                      DropdownButton<String>(
                        hint: Text("Animal Type"),
                        isExpanded: true,
                        value: _type,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 16,
                        elevation: 16,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                        underline: Container(
                          height: 2,
                          color: Color(0xff008891),
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            _type = newValue;
                          });
                        },
                        items: <String>['Dog', 'Cat']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          // filled: true,
                          labelText: 'Breed',
                          labelStyle: TextStyle(
                            color: Color(0xff008891),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff008891),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff008891),
                            ),
                          ),
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Breed is Required';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _breed = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          // filled: true,
                          labelText: 'Color',
                          labelStyle: TextStyle(
                            color: Color(0xff008891),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff008891),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff008891),
                            ),
                          ),
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Color is Required';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _color = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          // filled: true,
                          labelText: 'Description',
                          labelStyle: TextStyle(
                            color: Color(0xff008891),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff008891),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff008891),
                            ),
                          ),
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _description = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          // filled: true,
                          labelText: 'Number',
                          labelStyle: TextStyle(
                            color: Color(0xff008891),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff008891),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff008891),
                            ),
                          ),
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _number = int.parse(value);
                          });
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          // filled: true,
                          labelText: 'Location',
                          labelStyle: TextStyle(
                            color: Color(0xff008891),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff008891),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff008891),
                            ),
                          ),
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _location = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      DropdownButton<String>(
                        isExpanded: true,
                        value: _strength,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 16,
                        elevation: 16,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                        underline: Container(
                          height: 2,
                          color: Color(0xff008891),
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            _strength = newValue;
                          });
                        },
                        items: <String>['Very Active', 'Moderately Active','Dull']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        children: [
                          Visibility(
                            visible: _isImageUploaded,
                            child: _imageFile == null
                                ? Image.asset('images/dog1.png')
                                : Image.file(
                              _imageFile,
                              height: 50.0,
                              width: 50.0,
                            ),
                            replacement: SizedBox.shrink(),
                          ),
                          _isImageUploaded
                              ? SizedBox(
                            width: 20.0,
                          )
                              : SizedBox(
                            width: 0.0,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                Color(0xff008891),
                              ),
                            ),
                            onPressed:
                            _isImageUploaded ? uploadFile : chooseFile,
                            child: Text(_isImageUploaded
                                ? 'UPLOAD IMAGE'
                                : 'CHOOSE IMAGE'),
                          ),
                        ],
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
                  'SUBMIT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                onPressed: (){

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
