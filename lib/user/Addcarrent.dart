import 'dart:convert';

import 'package:eride/api/api.dart';
import 'package:eride/user/Carrent.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Addcarrent extends StatefulWidget {
  const Addcarrent({Key? key}) : super(key: key);

  @override
  State<Addcarrent> createState() => _AddcarrentState();
}

class _AddcarrentState extends State<Addcarrent> {
  bool _isLoading = false;
  final TextEditingController _carNameController = TextEditingController();
  final TextEditingController _carPriceController = TextEditingController();
  final TextEditingController _carDescriptionController =
  TextEditingController();
  String _automatedValue = 'Manual';
  String _seatsValue = '4';
  String _engineTypeValue = 'Petrol';


  void startRide() async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      "name": _carNameController.text,
      "prize": _carPriceController.text,
      "car_details": _carDescriptionController.text,
      "auto": _automatedValue,
      "seat": _seatsValue,
      "petrol": _engineTypeValue,

    };
    print(data);
    var res = await Api().authData(data,'/car/car');
    var body = json.decode(res.body);
    print(body);
    if (body['success'] == true) {

      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(context, MaterialPageRoute(builder: (context) => Carrent()));
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }

    setState(() {
      _isLoading = false;
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _carNameController,
              decoration: InputDecoration(
                labelText: 'Car Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _carPriceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Car Price',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _carDescriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Car Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: _automatedValue,
              decoration: InputDecoration(
                labelText: 'Automated',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _automatedValue = value!;
                });
              },
              items: <String>[
                'Manual',
                'Automatic',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: _seatsValue,
              decoration: InputDecoration(
                labelText: 'Seats',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _seatsValue = value!;
                });
              },
              items: <String>[
                '2',
                '4',
                '5',
                '7',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: _engineTypeValue,
              decoration: InputDecoration(
                labelText: 'Engine Type',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _engineTypeValue = value!;
                });
              },
              items: <String>[
                'Petrol',
                'Diesel',
                'Electric',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {


                startRide();


                // Show a confirmation dialog or navigate to another screen
                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return AlertDialog(
                //       title: Text('Car Added'),
                //       content: Text(
                //           'The car $carName has been added for rent.'),
                //       actions: [
                //         TextButton(
                //           onPressed: () {
                //             Navigator.pop(context); // Close the dialog
                //             Navigator.pop(context); // Go back to previous screen
                //           },
                //           child: Text('OK'),
                //         ),
                //       ],
                //     );
                //   },
                // );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Add Car',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
