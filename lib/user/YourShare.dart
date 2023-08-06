import 'dart:convert';

import 'package:eride/api/api.dart';
import 'package:eride/api/api_services.dart';
import 'package:eride/user/model/ridemodel.dart';
import 'package:eride/user/model/take.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeline_tile/timeline_tile.dart';

class YourShare extends StatefulWidget {
  final String kid;
  const YourShare({required this.kid});

  @override
  State<YourShare> createState() => _YourShareState();
}

class _YourShareState extends State<YourShare> {
  List<Map<String, dynamic>> cars = [];
  List<ridemodel> products = [];
  bool _isLoading = true;
  String username = "";
  String login_id = "";
  String log = "";
  String first_name = "";
  String Phone_no = "";
  String last_name = "";
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
  late SharedPreferences prefs;
  ApiService client = ApiService();



  void initState() {
    super.initState();
    _viewPro();

    fetchcart();
  }

  Future<void> _viewPro() async {
    prefs = await SharedPreferences.getInstance();
    username = (prefs.getString('username') ?? '');
    login_id = prefs.getString('login_id') ?? '';
    print("usr${username}");
    print("usr${login_id}");

    print("usssssssssssr${log}");

    print("user selected id is $login_id");
    print("user selected id is $login_id");
    String mid = login_id.replaceAll('"', '');
    print("user selected id is $mid");

    var res = await Api().getData('/shareride/sharerideview2/$mid');
    var body = json.decode(res.body);
    print("response body: $body");

    if (body != null && body['success'] == true) {
      setState(() {
        first_name = body['data'][0]['first_name'];
        last_name = body['data'][0]['last_name'];
        _id = body['data'][0]['_id'];
        starting_place = body['data'][0]['starting_place'];
        ending_place = body['data'][0]['ending_place'];
        starting_time = body['data'][0]['starting_time'];
        price = body['data'][0]['price'];
        starting_placedis = body['data'][0]['starting_placedis'];
        ending_placedis = body['data'][0]['ending_placedis'];
        date = body['data'][0]['date'] ?? 'N/A';
        starting_time = body['data'][0]['starting_time'] ?? 'N/A';


      });
    } else {
      Fluttertoast.showToast(
        msg: 'Failed to fetch user data',
        backgroundColor: Colors.grey,
      );
    }
  }

  Future<void> fetchcart() async {
    print("object${widget.kid}");
    var response = await Api().getData('/shareride/shareride6/${widget.kid.replaceAll('"', '')}');
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      products = List<ridemodel>.from(
        items['data'].map((e) => ridemodel.fromJson(e)).toList(),
      );
    }
    setState(() {
      _isLoading = false;
    });
  }
  final List<String> userPhotoUrl = [
    'images/ava3.png',
    'images/computer.jpg',
    'images/136.png',
  ];

  final List<String> user = [
    'sio',
    'anu',
    'mia',
  ];

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
            child: Row(
              children: [
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  children: [
                    Text(
                      starting_time,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
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
                                color: Colors.blue,
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
                                color: Colors.orange,
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
                  child: const Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                ),
                SizedBox(height: 8),
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
                SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                ),
                SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 2.0,
                            spreadRadius: 1.0,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: ListTile(
                        onTap: () {
                          // Handle the onTap action
                        },
                        leading: CircleAvatar(
                          backgroundImage: AssetImage("server/public/images/" + products[index].profilepic),
                          radius: 25.0,
                        ),
                        title: Text(
                          products[index].first_name,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                    );
                  },
                ),
                SizedBox(height: 4),
                SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.red),
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.cancel),
                            SizedBox(width: 8),
                            Text('Cancel Ride'),
                          ],
                        ),
                      ),

                      Spacer(),

                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.green),
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.approval),
                            SizedBox(width: 8),
                            Text('Ride completed'),
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