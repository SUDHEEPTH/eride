import 'dart:convert';

import 'package:eride/api/api.dart';
import 'package:eride/driver/Driverhome.dart';
import 'package:eride/user/Payment.dart';
import 'package:eride/user/homepage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Carrent99 extends StatefulWidget {
  final String axi;
  const Carrent99({required this.axi});

  @override
  State<Carrent99> createState() => _Carrent99State();
}

class _Carrent99State extends State<Carrent99> {
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
  String caruser = "";
  String days = "";
  String date = "";
  String user_id55 = "";
  String car_id55 = "";
  late SharedPreferences prefs;
  @override
  void initState() {
    super.initState();

    _viewPr();
  }



  Future approveUser(String userid) async {
    userid = userid;
    print("u ${userid}");
    var response = await Api().getData('/car_renting/approve66/' + userid.replaceAll('"', ''));
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print("approve status${items}");
      Navigator.push(context, MaterialPageRoute(builder: (context) => Homeuser()));

      Fluttertoast.showToast(
        msg: "Approved",
      );
    } else {
      Fluttertoast.showToast(
        msg: "Error",
      );
    }
  }

  Future<void> _viewPr() async {

    print('haloo${widget.axi.replaceAll('"', '')}');
    var res = await Api().getData('/car_renting/carrent5/${widget.axi.replaceAll('"', '')}');
    var body = json.decode(res.body);
    print("response body: $body");

    if (body != null && body['success'] == true) {
      setState(() {
        first_name = body['data'][0]['first_name'];
        last_name = body['data'][0]['last_name'];
        address = body['data'][0]['carAdress'];
        caruser = body['data'][0]['caruser'];
        date = body['data'][0]['date'];
        days = body['data'][0]['days'];
        user_id55 = body['data'][0]['user_id'];
        Phone_no = body['data'][0]['Phone_no'];
        email = body['data'][0]['email'];
        car_id55 = body['data'][0]['car_id'];

      });
    } else {
      Fluttertoast.showToast(
        msg: 'Failed to fetch user data',
        backgroundColor: Colors.grey,
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
          width: 300, // Adjust the width as needed
          height: 275,
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
                '"${first_name}"have requested to rent car',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'caID: ${car_id55}',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),


              SizedBox(height: 8.0),
              Text(
                'Date: ${date}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'number of days: $days',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Phone number: ${Phone_no}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Email: ${email}',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add your functionality for the decline button here
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: Text(
                    'Decline',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      approveUser( car_id55);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    child: Text(
                      'Accept',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )

          ],
          ),
        ),
      ),
    );
  }
}
