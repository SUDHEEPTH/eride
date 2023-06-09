import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:eride/api/api.dart';
import 'package:eride/user/Carrent.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Addcarrent extends StatefulWidget {
  const Addcarrent({Key? key}) : super(key: key);

  @override
  State<Addcarrent> createState() => _AddcarrentState();
}

class _AddcarrentState extends State<Addcarrent> {
  bool _isLoading = false;
  final TextEditingController _carNameController = TextEditingController();
  final TextEditingController _carPriceController = TextEditingController();
  final TextEditingController _carDescriptionController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  String _automatedValue = 'Manual';
  String _seatsValue = '4';
  String _engineTypeValue = 'Petrol';
  File? _image;
  String _filename = '';
  String username = "";
  String login_id = "";

  late SharedPreferences prefs;

  void startRide() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _isLoading = true;
      username = prefs.getString('username') ?? '';
      login_id = prefs.getString('login_id') ?? '';
    });
    print("username: $username");
    print("login_id: $login_id");


    var data = {
      "user_id": login_id.replaceAll('"', ''),
      "name": _carNameController.text,
      "prize": _carPriceController.text,
      "District": _districtController.text,
      "car_details": _carDescriptionController.text,
      "auto": _automatedValue,
      "seat": _seatsValue,
      "petrol": _engineTypeValue,
    };
    print(data);

    var res = await Api().authData(data, '/car/car');
    var body = json.decode(res.body);
    print(res.body);
    if (body['success'] == true) {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
      addCarImage();
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

  void _selectImage() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
        print(_image);
        _filename = pickedImage.path.split('/').last;
      });
    }
  }

  void addCarImage() async {
    setState(() {
      _isLoading = true;
    });

    final uri = Uri.parse('http://192.168.1.72:3000/images');
    final request = http.MultipartRequest('POST', uri);
    final imageStream = http.ByteStream(_image!.openRead());
    final imageLength = await _image!.length();

    final multipartFile = http.MultipartFile(
      'file',
      imageStream,
      imageLength,
      filename: _filename,
    );
    request.files.add(multipartFile);

    final response = await request.send();
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
        msg: "Image uploaded successfully",
        backgroundColor: Colors.grey,
      );
    } else {
      Fluttertoast.showToast(
        msg: "Failed to upload image",
        backgroundColor: Colors.grey,
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
        child: Padding(
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
                controller: _districtController,

                decoration: InputDecoration(
                  labelText: 'District',
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
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Container(
                  width: 120,
                  child: ElevatedButton(
                    onPressed: _selectImage,
                    child: const Text('Select Image'),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              if (_image != null)
                Image.file(
                  _image!,
                  fit: BoxFit.cover,
                ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  startRide();
                  addCarImage();
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
      ),
    );
  }
}
