import 'dart:convert';

import 'package:eride/api/api.dart';
import 'package:eride/user/homepage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Taxi extends StatefulWidget {
  const Taxi({Key? key}) : super(key: key);

  @override
  State<Taxi> createState() => _TaxiState();
}

class _TaxiState extends State<Taxi> {

  DateTime currentDate = DateTime.now();
  DateTime currentTime = DateTime.now();
  late SharedPreferences prefs;
  String username = "";
  String login_id = "";
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController startingPlace = TextEditingController();
  final TextEditingController destination = TextEditingController();
  final TextEditingController time = TextEditingController();
  final TextEditingController date = TextEditingController();

  @override

  void dispose() {
    startingPlace.dispose();
    destination.dispose();
    time.dispose();
    date.dispose();

    super.dispose();
  }

  void taxiRide() async {
    String formattedDate = "${currentDate.year}-${currentDate.month}-${currentDate.day}";
    String formattedTime = "${currentTime.hour}:${currentTime.minute}:${currentTime.second}";
    prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? '';
      login_id = prefs.getString('login_id') ?? '';
    });
    print("username: $username");
    print("login_id: $login_id");
    setState(() {
      _isLoading = true;
    });

    var data = {
      "user_id": login_id.replaceAll('"', ''),
      "address": startingPlace.text,
      "destination": destination.text,
      "Date": date.text,
      "posting_date":formattedDate,
      "posting_tim":formattedTime,

    };
    print(data);
    var res = await Api().authData(data,'/taxiride/taxiride');
    var body = json.decode(res.body);
    print(body);
    if (body['success'] == true) {

      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(context, MaterialPageRoute(builder: (context) => homepage()));
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }

    setState(() {
      _isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_left_sharp, color: Colors.green),
          label: const Text('Back', style: TextStyle(color: Colors.green)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.transparent,
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 24.0,
                bottom: 8.0,
              ),
              child: Text(
                'TAXI !',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.green[300]?.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0, 2),
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: startingPlace,
                        decoration: InputDecoration(
                          labelText: 'Address',
                          filled: true,
                          fillColor: Colors.green[300]?.withOpacity(0.5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the starting place';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: time,
                        decoration: InputDecoration(
                          labelText: 'time',
                          filled: true,
                          fillColor: Colors.green[300]?.withOpacity(0.5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the time';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: destination,
                        decoration: InputDecoration(
                          labelText: 'Destination',
                          filled: true,
                          fillColor: Colors.green[300]?.withOpacity(0.5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the destination';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      DateTimeField(
                        controller: date,
                        decoration: InputDecoration(
                          labelText: 'Date',
                          filled: true,
                          fillColor: Colors.green[300]?.withOpacity(0.5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null) {
                            return 'Please enter a date';
                          }
                          return null;
                        },
                        format: DateFormat('yyyy-MM-dd'),
                        onShowPicker: (context, currentValue) async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: currentValue ?? DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                          if (date != null) {
                            return DateTimeField.combine(date,
                                TimeOfDay.fromDateTime(
                                    currentValue ?? DateTime.now()));
                          } else {
                            return currentValue;
                          }
                        },
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              taxiRide();
                            }
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 24.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 100.0),
                    Text(
                      'Wishing you a happy and unforgettable journey!',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        'images/taxi.png',
                        // Replace with your desired image path
                        width: 50.0,
                        height: 50.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
