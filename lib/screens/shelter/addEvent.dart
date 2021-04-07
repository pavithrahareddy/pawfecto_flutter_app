import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:pawfecto/screens/shelter/shelter_main_events.dart';

class AddEvent extends StatefulWidget {
  static const String id = 'addEvent';

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  String _uid;
  void getUID() {
    setState(() {
      _uid = _auth.currentUser.uid;
    });
  }

  void initState() {
    super.initState();
    getUID();
  }

  String _name;
  String _location;
  String _time;
  String _date;
  String _description;

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
        _storage.ref().child('Events/${Path.basename(_image.path)}');
    UploadTask uploadTask = storageReference.putFile(_imageFile);
    uploadTask.then((res) {
      res.ref.getDownloadURL().then((fileURL) {
        setState(() {
          _uploadedFileURL = fileURL;
          isLoading = false;
        });
      });
    });
  }

  void submitData() async {
    setState(() {
      isLoading = true;
    });

    try {
      final shelter = await _firestore.collection('shelters').doc(_uid).get();
      await _firestore.collection('shelters').doc(_uid).update({
        'events': FieldValue.arrayUnion([
          {
            'id': shelter.data()["events"].length + 1,
            'uid': _uid,
            'name': _name,
            'location': _location,
            'time': _time,
            'date': _date,
            'description': _description,
            'imageURL': _uploadedFileURL,
            'registrations': [],
          }
        ])
      });
      setState(() {
        isLoading = false;
      });
      Navigator.popAndPushNamed(context, ShelterMainEvents.id);
    } catch (e) {
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: SafeArea(
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
                          Navigator.popAndPushNamed(
                              context, ShelterMainEvents.id);
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Text(
                    'Event Details',
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
                        TextFormField(
                          decoration: InputDecoration(
                            // filled: true,
                            labelText: 'Event Name',
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
                            labelText: 'Date',
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
                              return 'Date is Required';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _date = value;
                            });
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            // filled: true,
                            labelText: 'Time',
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
                              return 'Time is Required';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _time = value;
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
                              return 'Location is Required';
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
                        TextFormField(
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
                              return 'Description is Required';
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
                                  ? 'UPLOAD POSTER'
                                  : 'CHOOSE POSTER'),
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
                    'ADD EVENT',
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
