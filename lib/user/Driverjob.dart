import 'dart:convert';

import 'package:eride/api/api.dart';
import 'package:eride/api/api_services.dart';
import 'package:eride/driver/Driverhome.dart';
import 'package:eride/taxi/TaxiH.dart';
import 'package:eride/taxi/Taxihome.dart';
import 'package:eride/user/Payment.dart';
import 'package:eride/user/homepage.dart';
import 'package:eride/user/paymentdriver.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Driverjob extends StatefulWidget {
  final String axi;
  const Driverjob({required this.axi});

  @override
  State<Driverjob> createState() => _DriverjobState();
}

class _DriverjobState extends State<Driverjob> {
  String first_name = "";
  String Phone_no = "";
  String last_name = "";
  String address = "";
  String job = "";
  String ndays = "";
  String adres = "";
  String driver_booking_date = "";
  String driver_booking_time = "";
  String status = "";
  String mac = '';
  ApiService client = ApiService();
  String username = "";
  String login_id = "";
  String log = "";
  String profilepic = "";
  String usid = "";
  String login_idf = "";
  String first_name2 = "";
  String id = "";
  String price = "";
  String Totalp = "";
  String ace = "";
  String dfirst_name = "";
  String userid2 = "";
  String driverid2 = "";
  String ID10 = "";

  late SharedPreferences prefs;
  @override
  void initState() {
    super.initState();
    _viewPr();
  }

  // Future<void> _viewPro() async {
  //   String se = widget.axi.replaceAll('"', '');
  //   print("user selected id is $se");
  //   String mid = widget.axi.replaceAll('"', '');
  //   var res = await Api().getData('/taxiride/viewtaxi/$se');
  //   var body = json.decode(res.body);
  //   print("response body: $body");
  //
  //   if (body != null && body['success'] == true) {
  //     setState(() {
  //       id = body['data'][0]['_id'];
  //
  //       mac = id;
  //       print('haloo$mac');
  //       _viewPr();
  //     });
  //   } else {
  //     Fluttertoast.showToast(
  //       msg: 'Failed to fetch user data',
  //       backgroundColor: Colors.grey,
  //     );
  //   }
  // }

  Future<void> _viewPr() async {
    String se = widget.axi.replaceAll('"', '');
    print('haloo$se');
    var res = await Api().getData('/driver_booking/viewdriverall9/$se');
    var body = json.decode(res.body);
    print("response body: $body");

    if (body != null && body['success'] == true) {
      var data = body['data'];
      if (data != null && data.isNotEmpty) {
        setState(() {
          first_name = data[0]['first_name'] ?? '';
          ID10 = data[0]['_id'] ?? '';
          Phone_no = data[0]['Phone_no'] ?? '';
          last_name = data[0]['last_name'] ?? '';
          job = data[0]['job'] ?? '';
          ndays = data[0]['ndays'] ?? '';
          adres = data[0]['adres'] ?? '';
          driver_booking_date = data[0]['driver_booking_date'] ?? '';
          driver_booking_time = data[0]['driver_booking_time'] ?? '';
          status = data[0]['status'] ?? '';
          usid = data[0]['_id'] ?? '';
          price = data[0]['price'] ?? '';
          ace = data[0]['ace'] ?? '';
          dfirst_name = data[0]['dfirst_name'] ?? '';
          dfirst_name = data[0]['dfirst_name'] ?? '';
          userid2 = data[0]['userid'] ?? '';
          driverid2 = data[0]['driverid'] ?? '';

          double priceValue = double.tryParse(price) ?? 0.0; // Convert price to double (default to 0.0 if invalid)
          int ndaysValue = int.tryParse(ndays) ?? 0; // Convert ndays to integer (default to 0 if invalid)
          double totalpValue = priceValue * ndaysValue;

          // Save Totalp value
          Totalp = totalpValue.toString();
          print('object$Totalp');


        });
      } else {
        Fluttertoast.showToast(
          msg: 'No data found for the user',
          backgroundColor: Colors.grey,
        );
      }
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
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Homeuser()));

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
          height: 370,
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
                'Your job accepted by"${dfirst_name}"',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'job starting Date: ${driver_booking_date}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'fair of one day : ${price}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Time: ${driver_booking_time}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Adress: ${adres}',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'number of days : ${ndays}',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Contact Number: ${Phone_no}',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Total pice :${Totalp} ',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 8.0),
              Text(
                'Payment: ${ace == "1" ? '"Payment paid"' : '"Not Paid"'}',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ace == "1" ? Colors.green : Colors.red,
                ),
              ),
              SizedBox(height: 8.0),
              // Remove the comma here

              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => paymentdriver(price:Totalp,revid:driverid2,useid:userid2,tcid1:ID10)
                          ),
                        );
                      },

                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    child: Text(
                      'pay',
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
        ),
      ),
    );
  }
}
