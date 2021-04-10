import 'package:flutter/material.dart';
import 'package:pawfecto/screens/user/donation/donate_page.dart';
import 'package:upi_india/upi_india.dart';

class DonateForm extends StatefulWidget {
  DonateForm({@required this.donor});
  static const String id = 'donate_form';

  final Map donor;

  @override
  _DonateFormState createState() => _DonateFormState();
}

class _DonateFormState extends State<DonateForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _phone = "";
  String _email = "";
  String _feedback = "";
  double _amount = 0.00;

  Future<UpiResponse> _transaction;
  UpiIndia _upiIndia = UpiIndia();
  List<UpiApp> apps;

  TextStyle header = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 0, 136, 145),
  );

  TextStyle value = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  TextStyle error = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: Color.fromARGB(255, 222, 93, 93),
  );

  @override
  void initState() {
    _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
      });
    }).catchError((e) {
      apps = [];
    });
    super.initState();
  }

  Future<UpiResponse> initiateTransaction(UpiApp app) async {
    return _upiIndia.startTransaction(
      app: app,
      receiverUpiId: "zomato@hdfcbank",
      receiverName: "Zomato",
      // receiverUpiId: this.widget.donor["upi"],
      // receiverName: this.widget.donor["name"],
      transactionRefId: 'PetDonationID',
      transactionNote: 'Pet Donation',
      amount: _amount,
    );
  }

  Widget displayUpiApps() {
    if (apps == null)
      return Center(child: CircularProgressIndicator());
    else if (apps.length == 0)
      return Center(
        child: Text(
          "No apps found to handle transaction.",
          style: header,
        ),
      );
    else
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: apps.map<Widget>((UpiApp app) {
          return GestureDetector(
            onTap: () {
              _transaction = initiateTransaction(app);
              setState(() {});
            },
            child: Container(
              height: 100,
              child: Row(
                children: <Widget>[
                  Image.memory(
                    app.icon,
                    height: 50,
                    width: 50,
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      );
  }

  String _upiErrorHandler(error) {
    switch (error) {
      case UpiIndiaAppNotInstalledException:
        return 'Requested app not installed on device';
      case UpiIndiaUserCancelledException:
        return 'You cancelled the transaction';
      case UpiIndiaNullResponseException:
        return 'Requested app didn\'t return any response';
      case UpiIndiaInvalidParametersException:
        return 'Requested app cannot handle the transaction';
      default:
        return 'An Unknown error has occurred';
    }
  }

  void _checkTxnStatus(String status) {
    switch (status) {
      case UpiPaymentStatus.SUCCESS:
        print('Transaction Successful');
        break;
      case UpiPaymentStatus.SUBMITTED:
        print('Transaction Submitted');
        break;
      case UpiPaymentStatus.FAILURE:
        print('Transaction Failed');
        break;
      default:
        print('Received an Unknown transaction status');
    }
  }

  Widget displayTransactionData(title, body) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title: ", style: header),
          Flexible(
              child: Text(
            body,
            style: value,
          )),
        ],
      ),
    );
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
                        Navigator.popAndPushNamed(context, DonatePage.id);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  'Donation Form',
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
                          labelText: 'Name',
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
                            _phone = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          // filled: true,
                          labelText: 'Anything you would like to say to us?',
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
                            return 'empty';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _feedback = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          // filled: true,
                          labelText: 'Amount',
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
                            return 'Amount is required';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _amount = double.parse(value);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      'Donating to: ${this.widget.donor["name"]}',
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      'UPI ID: ${this.widget.donor["upi"]}',
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xff008891),
                  ),
                ),
                child: Text(
                  'Choose your payment gateway below',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                onPressed: () {},
              ),
              Container(
                width: double.infinity,
                height: 100,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Expanded(
                    child: displayUpiApps(),
                  ),
                ),
              ),
              Container(
                child: FutureBuilder(
                  future: _transaction,
                  builder: (BuildContext context,
                      AsyncSnapshot<UpiResponse> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            _upiErrorHandler(snapshot.error.runtimeType),
                            style: error,
                          ), // Print's text message on screen
                        );
                      }

                      // If we have data then definitely we will have UpiResponse.
                      // It cannot be null
                      UpiResponse _upiResponse = snapshot.data;

                      // Data in UpiResponse can be null. Check before printing
                      // String txnId = _upiResponse.transactionId ?? 'N/A';
                      // String resCode = _upiResponse.responseCode ?? 'N/A';
                      // String txnRef = _upiResponse.transactionRefId ?? 'N/A';
                      String status = _upiResponse.status ?? 'N/A';
                      // String approvalRef = _upiResponse.approvalRefNo ?? 'N/A';
                      _checkTxnStatus(status);

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Donation Successfull",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 136, 145),
                              ),
                            ),
                            // displayTransactionData('Transaction Id', txnId),
                            // displayTransactionData('Response Code', resCode),
                            // displayTransactionData('Reference Id', txnRef),
                            // displayTransactionData(
                            //     'Status', status.toUpperCase()),
                            // displayTransactionData('Approval No', approvalRef),
                          ],
                        ),
                      );
                    } else
                      return Center(
                        child: Text(''),
                      );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
