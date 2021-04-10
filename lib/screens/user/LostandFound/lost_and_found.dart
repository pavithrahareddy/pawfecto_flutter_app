import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pawfecto/screens/user/LostandFound/LAF_page.dart';
import 'package:pawfecto/screens/user/adopt_main.dart';

class LostAndFound extends StatefulWidget {
  LostAndFound(
      {@required this.category,
      @required this.title,
      @required this.successMessage});

  final String category;
  final String title;
  final String successMessage;

  static const String id = 'lost_and_found';
  @override
  _LostAndFoundState createState() => _LostAndFoundState();
}

class _LostAndFoundState extends State<LostAndFound> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  String _type = 'Dog';
  String _strength = 'Very Active';
  String _description;
  String _breed;
  String _color;
  String _number;
  String _location;

  bool _isImageUploaded = false;
  bool _isImageChosen = false;
  bool isDataSubmitted = false;

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
        _isImageChosen = true;
      });
    });
  }

  void uploadFile() {
    setState(() {
      isLoading = true;
    });
    Reference storageReference =
        _storage.ref().child('LostAndFound/${Path.basename(_image.path)}');
    UploadTask uploadTask = storageReference.putFile(_imageFile);
    uploadTask.then((res) {
      res.ref.getDownloadURL().then((fileURL) {
        setState(() {
          _uploadedFileURL = fileURL;
          isLoading = false;
        });
      });
    });
    setState(() {
      _isImageUploaded = true;
    });
  }

  void submitData() async {
    setState(() {
      isLoading = true;
    });

    try {
      await _firestore.collection('users').doc(_auth.currentUser.uid).update({
        'lostAndFound': FieldValue.arrayUnion([
          {
            'category': this.widget.category,
            'strength': _strength,
            'type': _type,
            'breed': _breed,
            'color': _color,
            'description': _description,
            'phone': _number,
            'location': _location,
            'imageURL': _uploadedFileURL,
            'uid': _auth.currentUser.uid,
          }
        ])
      });
      setState(() {
        isLoading = false;
        isDataSubmitted = true;
      });
      // Navigator.popAndPushNamed(context, ShelterMainPet.id);

    } catch (e) {
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: SingleChildScrollView(
            child: isDataSubmitted
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 200.0),
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage('images/reg_success.jpg'),
                            width: 200.0,
                            height: 200.0,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Uploaded successfully!',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            this.widget.successMessage,
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, AdoptMain.id, (route) => false);
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xff008891))),
                            child: Text(
                              'HOME',
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : Column(
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
                          this.widget.title,
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
                                  color: Colors.grey,
                                ),
                                onChanged: (newValue) {
                                  setState(() {
                                    _type = newValue;
                                  });
                                },
                                items: <String>[
                                  'Dog',
                                  'Cat'
                                ].map<DropdownMenuItem<String>>((String value) {
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
                                    return 'Required';
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
                              TextFormField(
                                decoration: InputDecoration(
                                  // filled: true,
                                  labelText: 'Location',
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
                                  color: Colors.grey,
                                ),
                                onChanged: (newValue) {
                                  setState(() {
                                    _strength = newValue;
                                  });
                                },
                                items: <String>[
                                  'Very Active',
                                  'Moderately Active',
                                  'Dull'
                                ].map<DropdownMenuItem<String>>((String value) {
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
                                    visible: _isImageChosen,
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
                                      backgroundColor: _isImageUploaded
                                          ? MaterialStateProperty.all<Color>(
                                              Colors.grey)
                                          : MaterialStateProperty.all<Color>(
                                              Color(0xff008891),
                                            ),
                                    ),
                                    onPressed: _isImageChosen
                                        ? (_isImageUploaded ? null : uploadFile)
                                        : chooseFile,
                                    child: Text(_isImageChosen
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
                        onPressed: submitData,
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
