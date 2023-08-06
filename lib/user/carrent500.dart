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

class carrent500 extends StatefulWidget {
  final String axi;
  const carrent500({required this.axi});

  @override
  State<carrent500> createState() => _carrent500State();
}

class _carrent500State extends State<carrent500> {
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
  String ace = "";
  String prize = "";
  String Totalp = "";
  String idx = "";
  String user_id58 = "";
  late SharedPreferences prefs;
  @override
  void initState() {
    super.initState();

    _viewPr();
  }



  // Future approveUser(String userid) async {
  //   userid = userid;
  //   print("u ${userid}");
  //   var response = await Api().getData('/car_renting/approve66/' + userid.replaceAll('"', ''));
  //   if (response.statusCode == 200) {
  //     var items = json.decode(response.body);
  //     print("approve status${items}");
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => Homeuser()));
  //
  //     Fluttertoast.showToast(
  //       msg: "Approved",
  //     );
  //   } else {
  //     Fluttertoast.showToast(
  //       msg: "Error",
  //     );
  //   }
  // }

  Future<void> _viewPr() async {

    print('haloo${widget.axi.replaceAll('"', '')}');
    var res = await Api().getData('/car_renting/carrent255/${widget.axi.replaceAll('"', '')}');
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
        ace = body['data'][0]['ace'];
        prize = body['data'][0]['prize'];
        idx = body['data'][0]['_id'];
        user_id58 = body['data'][0]['user_id58'];
        double priceValue = double.tryParse(prize) ?? 0.0; // Convert price to double (default to 0.0 if invalid)
        int ndaysValue = int.tryParse(days) ?? 0; // Convert ndays to integer (default to 0 if invalid)
        double totalpValue = priceValue * ndaysValue;

        // Save Totalp value
        Totalp = totalpValue.toString();
        print('object$Totalp');

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
    var response = await Api().getData('/car_renting/approve665/' + userid);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print("approve status${items}");

      Fluttertoast.showToast(
        msg: "RIDE completed",

      );
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Homeuser()));

    } else {
      Fluttertoast.showToast(
        msg: "complete",
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
                'car rented by "${first_name}"',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                ' Adress: ${address}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'date : ${date}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'number of days : ${days}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Car ID: ${car_id55}',
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

              Row(
                children: [

                     ElevatedButton(
                      onPressed: () {
                        complete(car_id55);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                      ),
                      child: Text(
                        'Complete',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                        ),
                      ),
                    ),

                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => paymentdriver(
                                price: Totalp,
                                revid: caruser,
                                useid: user_id58,
                                tcid1: idx,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                        ),
                        child: Text(
                          'Pay',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )


            ],
          ),
        ),
      ),
    );
  }
}
