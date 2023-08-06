import 'dart:convert';

import 'package:eride/api/api.dart';
import 'package:eride/api/api_services.dart';
import 'package:eride/user/Takeuser.dart';
import 'package:eride/user/model/ridemodel.dart';
import 'package:eride/user/paymentride.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ShareRideDetails extends StatefulWidget {
  final String macx;
  const ShareRideDetails({required this.macx});

  @override
  State<ShareRideDetails> createState() => _ShareRideDetailsState();
}

class _ShareRideDetailsState extends State<ShareRideDetails> {
  List<Map<String, dynamic>> cars = [];
  List<ridemodel> products = [];
  bool _isLoading = true;
  String username = "";
  String login_id = "";
  String log = "";
  String first_name = "";
  String first_name22 = "";
  String Phone_no = "";
  String last_name = "";
  String last_name33 = "";
  String address = "";
  String email = "";
  String gender = "";
  String usernames = "";
  String idcard = "";
  String idcardimag = "";
  String _id = "";
  String mac = '';
  String starting_place = '';
  String ending_place = '';
  String starting_time = '';
  String price = '';
  String starting_placedis = '';
  String ending_placedis = '';
  String date = '';
  String profilepic = "";
  String pickup = "";
  String user_id2 = "";
  String user_id = "";
  String Phone_no33 = "";
  String email33 = "";
  String pay = "";
  String shareID = "";
  late SharedPreferences prefs;
  ApiService client = ApiService();
  void initState() {
    super.initState();
    _viewPro();
    _viewPro2();
  }

  Future<void> _viewPro() async {
    prefs = await SharedPreferences.getInstance();
    login_id = prefs.getString('login_id') ?? '';
    print("user selected id is $login_id");

    if (login_id.isEmpty) {
      // Handle the case where login_id is null or empty (e.g., show an error message or navigate to login)
      Fluttertoast.showToast(
        msg: 'User not logged in.',
        backgroundColor: Colors.grey,
      );
      return;
    }

    String mid = login_id.replaceAll('"', '');
    print("user selected id is $mid");

    var res = await Api().getData('/shareride/shareride77/$mid');
    var body = json.decode(res.body);
    print("response body: $body");

    if (body != null && body['success'] == true) {
      setState(() {
        // Update state with fetched data
        first_name = body['data'][0]['first_name'];
        pay = body['data'][0]['pay'];
        last_name = body['data'][0]['last_name'];
        shareID = body['data'][0]['shareID'];
        _id = body['data'][0]['_id'];
        starting_place = body['data'][0]['starting_place'];
        ending_place = body['data'][0]['ending_place'];
        starting_time = body['data'][0]['starting_time'];
        price = body['data'][0]['price'];
        starting_placedis = body['data'][0]['starting_placedis'];
        ending_placedis = body['data'][0]['ending_placedis'];
        user_id2 = body['data'][0]['user_id2'];
        user_id = body['data'][0]['user_id'];
        date = body['data'][0]['date'] ?? 'N/A';
        starting_time = body['data'][0]['starting_time'] ?? 'N/A';
        profilepic = body['data'][0]['profilepic'] ?? '';
      });
    } else {
      Fluttertoast.showToast(
        msg: 'Failed to fetch user data',
        backgroundColor: Colors.grey,
      );
    }
  }

  Future<void> _viewPro2() async {

    String mid = widget.macx.replaceAll('"', '');
    print("dfnmjlkiis $mid");

    var res = await Api().getData('/shareride/sharerideview22/${widget.macx.replaceAll('"', '')}');
    var body = json.decode(res.body);
    print("response body: $body");

    if (body != null && body['success'] == true) {
      setState(() {
        first_name22 = body['data'][0]['first_name'];
        last_name33= body['data'][0]['pic'];
        Phone_no33= body['data'][0]['Phone_no'];
        email33= body['data'][0]['email'];



      });
    } else {
      Fluttertoast.showToast(
        msg: 'Failed to fetch user data',
        backgroundColor: Colors.grey,
      );
    }
  }

  final String userPhotoUrl =
      'https://example.com/user_photo.jpg'; // Replace with the user's photo URL

  @override
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
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            alignment: Alignment.centerLeft,
            child: Text(
              date, // Replace with your desired date
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0,
                    isFirst: true,
                    endChild: Container(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              starting_placedis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              starting_place,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    beforeLineStyle: LineStyle(
                      color: Colors.blue,
                      thickness: 6,
                    ),
                    indicatorStyle: IndicatorStyle(
                      width: 40,
                      height: 40,
                      indicator: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0,
                    isLast: true,
                    endChild: Container(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              ending_placedis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              ending_place,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    beforeLineStyle: LineStyle(
                      color: Colors.orange,
                      thickness: 6,
                    ),
                    indicatorStyle: IndicatorStyle(
                      width: 40,
                      height: 40,
                      indicator: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: Divider(
                      color: Colors.grey[300],
                      thickness: 9,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Price for 1 Passenger',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                         price,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: Divider(
                      color: Colors.grey[300],
                      thickness: 9,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Takeuser()));
                        },
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                first_name22,
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 16.0),
                              Text(
                                'Rating: 5.0/5',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 145),
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Takeuser()));
                        },
                        child: CircleAvatar(
                          backgroundImage: AssetImage("server/public/images/"+last_name33),
                          radius: 30.0,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Icon(Icons.keyboard_arrow_right),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: EdgeInsets.only(left: 18, right: 18),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        first_name22,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ElevatedButton(
                      //   onPressed: () {},
                      //   style: ButtonStyle(
                      //     backgroundColor:
                      //         MaterialStateProperty.all<Color>(Colors.green),
                      //     foregroundColor:
                      //         MaterialStateProperty.all<Color>(Colors.white),
                      //   ),
                      //   child: Row(
                      //     mainAxisSize: MainAxisSize.min,
                      //     children: [
                      //       Icon(Icons.message, size: 18),
                      //       SizedBox(width: 4),
                      //       Text('Message', style: TextStyle(fontSize: 14)),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(height: 8),
                      Text(
                        'Phone ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        Phone_no33,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'E-mail ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        email33,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Payment: ${pay == "1" ? '"Payment paid"' : '"Not Paid"'}',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: pay == "1" ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: EdgeInsets.only(left: 18, right: 18),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (pay == "1") {
                            // Show a toast or dialog indicating payment is already paid
                            Fluttertoast.showToast(
                              msg: 'Already Paid',
                              backgroundColor: Colors.grey,
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => paymentride(price: price, revid: user_id2, useid: user_id, tcid1: _id),
                              ),
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.payment),
                            SizedBox(width: 8),
                            Text(pay == "1" ? 'Already Paid' : 'Pay Now'),
                          ],
                        ),
                      ),

                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.cancel),
                            SizedBox(width: 8),
                            Text('cancel ride'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
