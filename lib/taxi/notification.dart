import 'dart:convert';

import 'package:eride/api/api.dart';
import 'package:eride/driver/Driverhome.dart';
import 'package:eride/taxi/TaxiH.dart';
import 'package:eride/taxi/Taxihome.dart';
import 'package:eride/user/Payment.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class notification extends StatefulWidget {
  final String axi;
  const notification({required this.axi});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  String first_name = "";
  String Phone_no = "";
  String last_name = "";
  String address = "";
  String email = "";
  String gender = "";
  String username = "";
  String idcard = "";
  String idcardimag = "";
  String id = "";
  String usernamer = "";
  String login_id = "";
  String car_num = "";
  String destination = "";
  String Date = "";
  String time = "";
  String mac = "";
  String total = "";
  String total5 = "";
  String taxi_id = "";
  String user_id = "";
  String tcid = "";
  String ace = "";
  late SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
    _viewPro();
  }

  Future<void> _viewPro() async {
    String se = widget.axi.replaceAll('"', '');
    print("user selected id is $se");
    String mid = widget.axi.replaceAll('"', '');
    var res = await Api().getData('/taxiride/viewtaxi/$se');
    var body = json.decode(res.body);
    print("response body: $body");

    if (body != null && body['success'] == true) {
      setState(() {
        id = body['data'][0]['_id'];

        mac = id;
        print('haloo$mac');
        _viewPr();
      });
    } else {
      Fluttertoast.showToast(
        msg: 'Failed to fetch user data',
        backgroundColor: Colors.grey,
      );
    }
  }

  Future<void> _viewPr() async {
    print('haloo$mac');
    var res = await Api().getData('/taxiride/viewtaxi5/$mac');
    var body = json.decode(res.body);
    print("response body: $body");

    if (body != null && body['success'] == true) {
      setState(() {
        first_name = body['data'][0]['first_name'];
        last_name = body['data'][0]['last_name'];
        address = body['data'][0]['address'];
        car_num = body['data'][0]['car_num'];
        destination = body['data'][0]['destination'];
        total = body['data'][0]['total'];
        Date = body['data'][0]['Date'];
        time = body['data'][0]['time'];
        taxi_id = body['data'][0]['taxi_id'];
        user_id = body['data'][0]['user_id'];
        tcid = body['data'][0]['_id'];
        ace = body['data'][0]['ace'];
        total5 = total;
      });
    } else {
      Fluttertoast.showToast(
        msg: 'Failed to fetch user data',
        backgroundColor: Colors.grey,
      );
    }
  }

  Future complete(String userid) async {
    print("u ${userid}");
    var response = await Api().getData('/taxiride/approve6/' + userid);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print("approve status${items}");

      Fluttertoast.showToast(
        msg: "RIDE completed",

      );
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Taxihome()));

    } else {
      Fluttertoast.showToast(
        msg: "Not paid",
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_left_sharp, color: Colors.green),
          label: const Text('Back', style: TextStyle(color: Colors.green)),
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            elevation: 0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          width: 350, // Adjust the width as needed
          height: 330,
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.2),
                offset: Offset(0, 2),
                blurRadius: 4.0,
              ),
            ],
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'You taxi ride accepted by "${first_name}"will reach on',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Date: ${Date}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Price: ${total}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Time: ${time}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Destination: ${destination}',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Car number: ${car_num}',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),

              SizedBox(height: 8.0),
              Text(
                'Payment: ${ace == "1" ? '"Payment Received"' : '"Not Paid"'}',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ace == "1" ? Colors.green : Colors.red,
                ),
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add your functionality for the "Report user" button here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    child: Text(
                      'Report user',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ), // Remove the comma here

                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                         complete(tcid);
                            },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                        ),
                        child: Text(
                          'COMPLETE',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
