import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api.dart';

class Detailtaxi extends StatefulWidget {
  final String userid;

  Detailtaxi({required this.userid});

  @override
  State<Detailtaxi> createState() => _DetailtaxiState();
}

class _DetailtaxiState extends State<Detailtaxi> {
  late String loginid;
  String first_name = "";
  String phone_no = ""; // Updated variable name to camel case
  String last_name = "";
  String address = "";
  String email = "";
  String gender = "";
  String username = "";
  String idcard = "";
  String profilepic = "";

  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _viewPro();
  }

  Future<void> _viewPro() async {
    var res = await Api().getData('/register/viewselect-taxi/${widget.userid}'); // Updated URL formatting
    var body = json.decode(res.body);
    print("body${body}");
    setState(() {
      first_name = body['data'][0]['first_name'];
      phone_no = body['data'][0]['Phone_no'];
      last_name = body['data'][0]['last_name'];
      address = body['data'][0]['address'];
      email = body['data'][0]['email'];
      gender = body['data'][0]['gender'];
      username = body['data'][0]['username'];
      idcard = body['data'][0]['idcard'];
      profilepic = body['data'][0]['profilepic'];
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: CircleAvatar(
                backgroundImage: AssetImage("server/public/images/"+profilepic),
                radius: 65,
              ),
            ),
            SizedBox(height: 1),
            Container(
              padding: const EdgeInsets.only(
                  top: 20.0, left: 2, right: 20, bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              margin: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 18),
                    child: Row(
                      children: [
                        Text(
                          'ID:',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.green[500],
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Text(
                          username,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 18),
                    child: Row(
                      children: [
                        Text(
                          'First Name:',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.green[500],
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Text(
                          first_name,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 18),
                    child: Row(
                      children: [
                        Text(
                          'Last Name:',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.green[500],
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Text(
                          last_name,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 18),
                    child: Row(
                      children: [
                        Text(
                          'Email:',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.green[500],
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Text(
                          email,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 18),
                    child: Row(
                      children: [
                        Text(
                          'Mobile number:',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.green[500],
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Text(
                          phone_no,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 18),
                    child: Row(
                      children: [
                        Text(
                          'Gender:',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.green[500],
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Text(
                          gender,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 18),
                    child: Row(
                      children: [
                        Text(
                          'Id card:',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.green[500],
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Text(
                          idcard,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 18),
                    child: Row(
                      children: [
                        Text(
                          'Address:',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.green[500],
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            address,
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
