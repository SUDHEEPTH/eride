import 'dart:convert';

import 'package:eride/api/api.dart';
import 'package:eride/api/api_services.dart';
import 'package:eride/user/Carrent.dart';
import 'package:eride/user/Carrent99.dart';
import 'package:eride/user/Driverjob.dart';
import 'package:eride/user/Driverrent.dart';
import 'package:eride/user/Riderequest.dart';
import 'package:eride/user/Share1.dart';
import 'package:eride/user/ShareRideDetasils.dart';
import 'package:eride/user/Taxiac.dart';
import 'package:eride/user/YourShare.dart';
import 'package:eride/user/carrent500.dart';
import 'package:eride/user/taxi.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  late String axi;
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
  String s_id = '';
  String shareID = '';
  String starting_placedis = '';
  String starting_placedis77= '';
  String starting_placedis770= '';
  String ending_placedis77= '';
  String ending_placedis770= '';
  String dat77= '';
  String dat770= '';
  String ending_placedis = '';
  String userid99 = '';

  ApiService client = ApiService();
  String first_name44 = '';
  String last_name44 = '';
  String address44 = '';
  String car_num = '';
  String destination = '';
  String total = '';
  String  Date = '';
  String time = '';
  String  taxi_id = '';
  String user_id = '';
  String  tcid = '';
  String total5 = '';
  String ID10 = '';
  String first_name500 = '';
  String car_id55 = '';

  String profilepic = "";
  String pickup = "";
  late SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchuser();
    _viewPro();
    _viewPro77();
    _viewPro99();
    _viewPro100();
    _viewPr200();
    _viewPr500();
    _viewPr555();
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

    var res = await Api().getData('/shareride/shareride880/$mid');
    var body = json.decode(res.body);
    print("response body: $body");

    if (body != null && body['success'] == true) {
      setState(() {

        s_id = body['data'][0]['shareidt'];

        dat770 = body['data'][0]['date'];
        starting_placedis770 = body['data'][0]['starting_placedis'];
        ending_placedis770 = body['data'][0]['ending_placedis'];


print(' jbfsg$s_id');


      });
    } else {
      Fluttertoast.showToast(
        msg: 'Failed to fetch user data',
        backgroundColor: Colors.grey,
      );
    }
  }

  Future<void> _viewPr200() async {
    prefs = await SharedPreferences.getInstance();
    username = (prefs.getString('username') ?? '');
    login_id = prefs.getString('login_id') ?? '';
    String se =login_id.replaceAll('"', '');
    print('haloo$se');
    var res = await Api().getData('/driver_booking/viewdriverall9/$se');
    var body = json.decode(res.body);
    print("response body: $body");

    if (body != null && body['success'] == true) {
      var data = body['data'];
      if (data != null && data.isNotEmpty) {
        setState(() {

          ID10 = data[0]['_id'] ?? '';



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
  Future<void> _viewPr500() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      username = (prefs.getString('username') ?? '');
      login_id = prefs.getString('login_id') ?? '';
    });

    var res = await Api().getData('/car_renting/carrent5/${login_id.replaceAll('"', '')}');
    var body = json.decode(res.body);
    print("response body: $body");

    if (body != null && body['success'] == true) {
      setState(() {
        first_name500 = body['data'][0]['first_name'];


      });
    } else {
      Fluttertoast.showToast(
        msg: 'Failed to fetch user data',
        backgroundColor: Colors.grey,
      );
    }
  }
  Future<void> _viewPro100() async {
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
        dat77 = body['data'][0]['date'];
        starting_placedis77 = body['data'][0]['starting_placedis'];
        ending_placedis77 = body['data'][0]['ending_placedis'];

      });
    } else {
      Fluttertoast.showToast(
        msg: 'Failed to fetch user data',
        backgroundColor: Colors.grey,
      );
    }
  }
  fetchuser()async{
    prefs = await SharedPreferences.getInstance();
    setState(() {
      username = (prefs.getString('username') ?? '');
      login_id = prefs.getString('login_id') ?? '';
      print("usr${username}");
      print("usr${login_id}");
      print("usssssssssssr${log}");

    }
    );

  }
  Future<void> _viewPro77() async {
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
        shareID = body['data'][0]['shareID'];
        starting_placedis = body['data'][0]['starting_placedis'];
        ending_placedis = body['data'][0]['ending_placedis'];

      });
    } else {
      Fluttertoast.showToast(
        msg: 'Failed to fetch user data',
        backgroundColor: Colors.grey,
      );
    }
  }



  Future<void> _viewPro99() async {
    prefs = await SharedPreferences.getInstance();
    login_id = prefs.getString('login_id') ?? '';
    print("user selected id is $login_id");

    String mid =login_id.replaceAll('"', '');
    var res = await Api().getData('/taxiride/viewuse/$mid');
    var body = json.decode(res.body);
    print("response body: $body");

    if (body != null && body['success'] == true) {
      setState(() {
        userid99 = body['data'][0]['_id'];
        profilepic = body['data'][0]['profilepic'];

        print('haloo$mac');
        _viewPr44();
      });
    } else {
      Fluttertoast.showToast(
        msg: 'Failed to fetch user data',
        backgroundColor: Colors.grey,
      );
    }
  }
  Future<void> _viewPr44() async {
    print('halooffff$userid99');
    var res = await Api().getData('/taxiride/viewtaxi2/$userid99');
    var body = json.decode(res.body);
    print("response body: $body");

    if (body != null && body['success'] == true) {
      setState(() {
        first_name44 = body['data'][0]['first_name'];
        last_name44 = body['data'][0]['last_name'];
        address44 = body['data'][0]['address'];
        car_num = body['data'][0]['car_num'];
       destination = body['data'][0]['destination'];
        total = body['data'][0]['total'];
         Date = body['data'][0]['Date'];
        time = body['data'][0]['time'];
         taxi_id = body['data'][0]['taxi_id'];
        user_id = body['data'][0]['user_id'];
        tcid = body['data'][0]['_id'];
        total5 = total;
      });
    } else {
      Fluttertoast.showToast(
        msg: 'Failed to fetch user data',
        backgroundColor: Colors.grey,
      );
    }
  }

  final String userPhotoUrl = 'https://example.com/user_photo.jpg';
  // Replace with the user's photo URL
  List _loadprooducts = [];

  late int login;
  Future<void> _viewPr555() async {

    prefs = await SharedPreferences.getInstance();
    username = (prefs.getString('username') ?? '');
    login_id = prefs.getString('login_id') ?? '';

    var res = await Api().getData('/car_renting/carrent255/${login_id.replaceAll('"', '')}');
    var body = json.decode(res.body);
    print("response body: $body");

    if (body != null && body['success'] == true) {
      setState(() {

        car_id55 = body['data'][0]['car_id'];


      });
    } else {
      Fluttertoast.showToast(
        msg: 'Failed to fetch user data',
        backgroundColor: Colors.grey,
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    log=login_id;
    print('log $log');
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello,'+username.replaceAll('"', ''),
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Where do you want to go?',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: GestureDetector(
                      // onTap: () {
                      //   Navigator.push(context, MaterialPageRoute(builder: (context)=>_buildProfilePage()));
                      // },
                      child: CircleAvatar(
                        backgroundImage: AssetImage("server/public/images/" + profilepic),
                        radius: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0 ,right: 10),
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('images/banner.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(.6),
                          Colors.black.withOpacity(.6),
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "E-ride",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 15,top: 20,bottom: 8 ),
                child: Row(
                  children: [
                    // Curved Square
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Share1()));
                      },
                      child: Container(
                        width:  MediaQuery.of(context).size.width/3,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.directions_car,
                                size: 50,
                                color: Colors.white,
                              ),
                              Text(
                                'Share Ride',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    // Curved Rectangle
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Driverrent()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/1.9,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black87,
                        ),

                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.people,
                                size: 50,
                                color: Colors.white,
                              ),
                              Text(
                                'Driver Rent',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Carrent()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/1.9,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.car_rental_outlined,
                                size: 50,
                                color: Colors.white,
                              ),
                              Text(
                                'car Rent',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Curved Square

                    SizedBox(width: 10),
                    GestureDetector(

                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Taxi(axi:log)));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/3,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.local_taxi,
                                size: 50,
                                color: Colors.white,
                              ),
                              Text(
                                'taxi',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Curved Rectangle

                  ],
                ),
              ),
              SizedBox(height: 10,),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Notification",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              if (starting_placedis.isNotEmpty)
              Container(
                child: Column(
                  children: [

                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ShareRideDetails(macx:shareID)));
                            },
                            child: ListTile(
                              leading: Icon(Icons.notifications_active),
                              title: Text("Joined Ride Details ${starting_placedis}to ${ending_placedis}"),
                              subtitle: Text("John shared a ride from ${starting_placedis}to ${ending_placedis}"),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          );
                        }


                      },
                    ),
                  ],
                ),
              ),
              if (starting_placedis77.isNotEmpty)
                Container(
                  child: Column(
                    children: [

                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => YourShare(kid:s_id)));
                            },
                            child: ListTile(
                              leading: Icon(Icons.notifications_active),
                              title: Text("Your Shared Ride from $starting_placedis77 to $ending_placedis77"),
                              subtitle: Text("You are sharing Date:$dat77"),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

              if (ID10.isNotEmpty)
                Container(
                  child: Column(
                    children: [

                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Driverjob(axi:login_id)));
                            },
                            child: ListTile(
                              leading: Icon(Icons.notifications_active),
                              title: Text("Driver Request"),
                              subtitle: Text("REQUEST ID:$ID10"),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              if (starting_placedis770.isNotEmpty)
                Container(
                  child: Column(
                    children: [

                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Riderequest(axi:log,)));
                            },
                            child: ListTile(
                              leading: Icon(Icons.notifications_active),
                              title: Text("ride request from $starting_placedis770 to $ending_placedis770"),
                              subtitle: Text("DATE:$dat770"),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

              if (first_name44.isNotEmpty)
                Container(
                  child: Column(
                    children: [

                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Taxiac(axi:log)));
                            },
                            child: ListTile(
                              leading: Icon(Icons.notifications_active),
                              title: Text("Taxi accepted by $first_name44"),
                              subtitle: Text("Your ride will come in Time $time"),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

              if (first_name500.isNotEmpty)
                Container(
                  child: Column(
                    children: [

                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Carrent99(axi:log)));
                            },
                            child: ListTile(
                              leading: Icon(Icons.notifications_active),
                              title: Text("Car rent request "),
                              subtitle: Text("From $first_name500 "),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              if (car_id55.isNotEmpty)
                Container(
                  child: Column(
                    children: [

                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => carrent500(axi:log)));
                            },
                            child: ListTile(
                              leading: Icon(Icons.notifications_active),
                              title: Text("Car rent  "),
                              subtitle: Text("CAR ID $car_id55 "),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),










            ], // Added closing bracket for the Column widget
          ),
        ),
      ),
    );
  }
}