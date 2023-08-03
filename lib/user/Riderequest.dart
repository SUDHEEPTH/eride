import 'dart:convert';

import 'package:eride/api/api.dart';
import 'package:eride/user/homepage.dart';
import 'package:eride/user/model/ridemodel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Riderequest extends StatefulWidget {
  final String axi;
  const Riderequest({required this.axi});

  @override
  State<Riderequest> createState() => _RiderequestState();
}

class _RiderequestState extends State<Riderequest> {
  List<ridemodel> products = []; // Store the fetched data here
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchcart();
  }

  Future<void> fetchcart() async {
    String mid = widget.axi.replaceAll('"', '');
    var response =
    await Api().getData('/shareride/shareride5/${widget.axi.replaceAll('"', '')}');
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      products = List<ridemodel>.from(
          items['data'].map((e) => ridemodel.fromJson(e)).toList());
    }
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> approveUser(String shareid) async {
    print("u $shareid");
    var response = await Api().getData('/shareride/rideacc/' + shareid);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      print("approve status $items");
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
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
        padding: EdgeInsets.all(8),
        itemCount: products.length,
        separatorBuilder: (context, index) => SizedBox(height: 8),
        itemBuilder: (BuildContext context, int index) {
          String m = products[index].shareid;
          print("object $m");
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, bottom: 15),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: GestureDetector(
                                // onTap: () {
                                //   Navigator.push(context, MaterialPageRoute(builder: (context)=>_buildProfilePage()));
                                // },
                                child: CircleAvatar(
                                  backgroundImage:
                                  AssetImage("server/public/images/" + products[index].profilepic),
                                  radius: 30.0,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  products[index].first_name,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text('Email:${products[index].email}'),
                      Text('Phone number:${products[index].Phone_no}'),
                      Text('Gender:${products[index].gender}'),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            approveUser(products[index].shareid.replaceAll('"', ''));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                          ),
                          child: Text(
                            'accept',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
