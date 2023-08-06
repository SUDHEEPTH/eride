import 'dart:convert';
import 'package:eride/api/api.dart';
import 'package:eride/driver/DriverH.dart';
import 'package:eride/user/Taxiac.dart';
import 'package:eride/user/homepage.dart';
import 'package:eride/user/homepageH.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class paymentdriver extends StatefulWidget {
  final String price;
  final String revid;
  final String useid;
  final String tcid1;
  paymentdriver({required this.price, required this.revid,required this.useid,required this.tcid1});

  @override
  State<paymentdriver> createState() => _paymentdriverState();
}

enum Gender {
  UPI_pay,
  CARD_pay,
}

Gender? _payment = Gender.UPI_pay;
int? payment;

String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

class _paymentdriverState extends State<paymentdriver> {
  String username = "";
  String login_id = "";
  DateTime? _selectDate;
  late SharedPreferences prefs;
  bool isLoading = false;
  late String user_id, order_id;
  late String amount;
  late String resive_id;
  late String what;
  bool _isLoading = false;
  DateTime currentDate = DateTime.now();
  DateTime currentTime = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amount = widget.price..replaceAll('"', '');
    resive_id = widget.revid..replaceAll('"', '');
    user_id= widget.useid..replaceAll('"', '');
    what= widget.tcid1..replaceAll('"', '');
    print("object amount$amount");
    print("object re$resive_id");
    print("object use$user_id");
    print("object whatre$what");

    print(amount);
  }

  void pay() async {
    // Check if an image is selected

    String formattedDate = "${currentDate.year}-${currentDate.month}-${currentDate.day}";
    String formattedTime = "${currentTime.hour}:${currentTime.minute}:${currentTime.second}";

    prefs = await SharedPreferences.getInstance();
    setState(() {
      username = (prefs.getString('username') ?? '');
      login_id = prefs.getString('login_id') ?? '';
      print("fdlh$login_id");
    });

    var data = {
      "user_id": user_id,
      "resive_id": resive_id,
      "amount": amount,
      "date": formattedDate,
      "time": formattedTime,
      "what": what,
      "status": genderToString(_payment!), // Convert the selected Gender value to String
    };

    var res = await Api().authData(data, '/payment/payment500');
    var body = json.decode(res.body);

    if (body['success'] == true) {
      print(body);
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(
        this.context, //add this so it uses the context of the class
        MaterialPageRoute(
          builder: (context) => Homeuser(),
        ), //MaterialpageRoute
      );
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }

  String genderToString(Gender gender) {
    switch (gender) {
      case Gender.UPI_pay:
        return "UPI";
      case Gender.CARD_pay:
        return "CARD";
      default:
        return ""; // Handle other cases if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController datecontroller = TextEditingController();

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
      body: SingleChildScrollView(
        child: Container(
          // ignore: prefer_const_literals_to_create_immutables
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Payment",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10),
                child: Align(
                    alignment: Alignment.centerLeft, child: Text("Suggested for you")),
              ),
              ListTile(
                title: const Text('UPI'),
                leading: Radio<Gender>(
                  value: Gender.UPI_pay,
                  groupValue: _payment,
                  onChanged: (Gender? value) {
                    setState(() {
                      _payment = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('CARD'),
                leading: Radio<Gender>(
                  value: Gender.CARD_pay,
                  groupValue: _payment,
                  onChanged: (Gender? value) {
                    setState(() {
                      _payment = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: amount.toString(),
                  hintText: amount.toString(),
                  hintStyle: TextStyle(color: Colors.green),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 30,
                width: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    // padding: EdgeInsets.all(20)
                  ),
                  onPressed: () {
                    pay();
                  },
                  child: Text("CONTINUE"),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
