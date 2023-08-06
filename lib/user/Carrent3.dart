import 'dart:convert';

import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:eride/api/api.dart';
import 'package:eride/user/homepage.dart';
import 'package:eride/user/homepageH.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:eride/user/Rentalconditions.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Carrent3 extends StatefulWidget {
  final String cname;
  final String cprice;
  final String cpicture;
  final String clication;
  final String cautomated;
  final String cseats;
  final String cengineType;
  final String crentPrice;
  final String car_image;
  final String carid;

  Carrent3({
    required this.cname,
    required this.cprice,
    required this.cpicture,
    required this.clication,
    required this.cautomated,
    required this.cseats,
    required this.cengineType,
    required this.crentPrice,
    required this.car_image,
    required String clocation,
    required this.carid,
  });

  @override
  State<Carrent3> createState() => _Carrent3State();
}

class _Carrent3State extends State<Carrent3> {
  DateTime currentDate = DateTime.now();
  DateTime currentTime = DateTime.now();
  int numberOfDays = 1;
  DateTime? selectedDate;
  bool termsAccepted = false;
  bool _isLoading = false;
  String? username = "";
  String? login_id = "";

  late SharedPreferences prefs;
  final TextEditingController number = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  late DateTime date;
  void dispose() {
    number.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    number.text = numberOfDays.toString();
  }

  void startRide() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username');
      login_id = prefs.getString('login_id');
    });
    String formattedDate = "${currentDate.year}-${currentDate.month}-${currentDate.day}";
    String formattedTime = "${currentTime.hour}:${currentTime.minute}:${currentTime.second}";
print('vvv$login_id');
print('vnjh$widget.carid');
    setState(() {
      _isLoading = true;
    });

    var data = {
      "date": _dateController.text,
      "days": number.text,
      "car_renting_date": formattedDate,
      "car_renting_time": formattedTime,
      "user_id": login_id?.replaceAll('"', ''),
      "carid": widget.carid.replaceAll('"', ''),
    };

    var res = await Api().authData(data, '/car_renting/car_renting');
    var body = json.decode(res.body);

    if (body['success'] == true) {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(context, MaterialPageRoute(builder: (context) => Homeuser()));
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_left_sharp, color: Colors.green),
          label: const Text(
            'Back',
            style: TextStyle(color: Colors.green),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.cname,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 150,
                        child: Stack(
                          children: [
                            Image.asset(
                              "server/public/images/" + widget.car_image,
                              fit: BoxFit.fill,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 2,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Location:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(widget.clication),
                            SizedBox(height: 8),
                            Text('Automated: ${widget.cautomated}'),
                            Text('Seats: ${widget.cseats}'),
                            Text('Engine Type: ${widget.cengineType}'),
                            SizedBox(height: 8),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Rent Price:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text('Rent price ${widget.crentPrice}'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Rentalconditions()),
                    );
                  },
                  child: Card(
                    elevation: 10,
                    child: ListTile(
                      leading: Icon(Icons.arrow_forward_ios),
                      title: Text(
                        'Terms And Conditions',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(
                      value: termsAccepted,
                      onChanged: (value) {
                        setState(() {
                          termsAccepted = value ?? false;
                        });
                      },
                    ),
                    Text('I accept the terms and conditions'),
                  ],
                ),
                if (termsAccepted) ...[
                  SizedBox(height: 16),
                  TextFormField(
                    controller: number,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        numberOfDays = int.tryParse(value) ?? 1;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Number of Days',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  DateTimeField(
                    controller: _dateController,
                    onChanged: (value) {
                      setState(() {
                        date = value!;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: 'Date',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    format: DateFormat("yyyy-MM-dd"),
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _isLoading ? null : startRide,
                    child: _isLoading
                        ? CircularProgressIndicator()
                        : Text(
                      'Start Ride',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
