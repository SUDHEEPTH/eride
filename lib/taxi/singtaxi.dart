import 'dart:convert';
import 'dart:io';

import 'package:eride/api/api.dart';
import 'package:eride/login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';



class singtaxi extends StatefulWidget {
  const singtaxi({Key? key}) : super(key: key);

  @override
  _singtaxiState createState() => _singtaxiState();
}

class _singtaxiState extends State<singtaxi> {

  bool  _isLoading = false;


  final _formKey = GlobalKey<FormState>();
  String? _idCardType;
  String? _selectedGender;
  final _idCardTypeList = [
    'Aadhar Card',
    'Voter ID Card',
    'Passport',
    'Driver License'
  ];
  final List<String> _genderOptions = [
    'Male',
    'Female',
    'Other',
  ];
  final TextEditingController _carnoController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();
  final TextEditingController _userNameController =
  TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  File? _selectedImage;


  @override
  void dispose() {
    _carnoController.dispose();
    _userNameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _confirmPasswordController.dispose();
    _dobController.dispose();
    super.dispose();


  }
  Future<void> _selectImage() async {
    final pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        _selectedImage = File(pickedImage.path);
      }
    });
  }

  void registerUser() async {
    // Check if an image is selected
    if (_selectedImage == null) {
      Fluttertoast.showToast(
        msg: 'Please select an image',
        backgroundColor: Colors.grey,
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    var data = {
      "car_num": _carnoController.text,
      "dob": _dobController.text,
      "username": _userNameController.text,
      "firstName": _firstNameController.text,
      "lastName": _firstNameController.text,
      "password": _passwordController.text,
      "gender": _selectedGender,
      "idcard":_idCardType,
      "address": _addressController.text,
      "phoneNumber": _phoneNumberController.text,
      "email": _emailController.text,


    };
    var res = await Api().authData(data,'/register/taxi-register');
    var body = json.decode(res.body);

    if(body['success']==true)
    {
      print(body);
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));

    }
    else
    {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
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
          icon: const Icon(
            Icons.arrow_left_sharp,
            color: Colors.green,
          ),
          label: const Text('Back', style: TextStyle(color: Colors.green)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Form(
            key: _formKey, // Add the form key
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 70.0),
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Register as Taxi",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50,
                    top: 10,
                    bottom: 10,
                  ),
                  child: TextFormField(
                    controller: _userNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter User Name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: "Enter User Name",
                      labelStyle: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50,
                    top: 10,
                    bottom: 10,
                  ),
                  child: TextFormField(
                    controller: _firstNameController,
                    validator: (value) {

                      if (value!.isEmpty) {
                        return 'Please enter First Name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: "Enter First Name",
                      labelStyle: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50,
                    top: 10,
                    bottom: 10,
                  ),
                  child: TextFormField(
                    controller: _lastNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Last Name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: "Enter Last Name",
                      labelStyle: TextStyle(color: Colors.green),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50,
                    top: 10,
                    bottom: 10,
                  ),
                  child: TextFormField(
                    controller: _dobController,
                    validator: (value) {

                      if (value!.isEmpty) {
                        return 'Please enter Date of birth';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: "Enter Date of birth",
                      labelStyle: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50,
                    top: 10,
                    bottom: 10,
                  ),
                  child: TextFormField(
                    controller: _phoneNumberController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Phone Number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: "Enter Phone Number",
                      labelStyle: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50,
                    top: 10,
                    bottom: 10,
                  ),
                  child: TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: "Enter Email",
                      labelStyle: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only( left: 50.0,
                      right: 23,
                      top: 10,
                      bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField(
                          value: _idCardType,
                          validator: (value) {
                            if (value == null) {
                              return 'Please select ID Card Type';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _idCardType = value.toString();
                            });
                          },
                          items: _idCardTypeList.map((idCardType) {
                            return DropdownMenuItem(
                              child: Text(idCardType),
                              value: idCardType,
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: "Select ID Card Type",
                            labelStyle: TextStyle(color: Colors.green),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Expanded(
                          child: ElevatedButton(
                            onPressed: _selectImage,
                            child: const Text('Select Image'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20.0), // Add spacing between the two elements

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50,
                    top: 10,
                    bottom: 10,
                  ),
                  child: TextFormField(
                    controller: _carnoController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Car number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: "Enter Car number",
                      labelStyle: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50,
                    top: 10,
                    bottom: 10,
                  ),
                  child: TextFormField(
                    controller: _addressController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Address';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: "Enter Address",
                      labelStyle: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50,
                    top: 10,
                    bottom: 10,
                  ),
                  child: DropdownButtonFormField(
                    value: _selectedGender,
                    validator: (value) {
                      if (value == null) {
                        return 'Please select your gender';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value.toString();
                      });
                    },
                    items: _genderOptions.map((gender) {
                      return DropdownMenuItem(
                        child: Text(gender),
                        value: gender,
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: "Select Gender",
                      labelStyle: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50,
                    top: 10,
                    bottom: 10,
                  ),
                  child: TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: "Enter Password",
                      labelStyle: TextStyle(color: Colors.green),
                    ),
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                    right: 50,
                    top: 10,
                    bottom: 10,
                  ),
                  child: TextFormField(
                    controller: _confirmPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Confirm Password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: "Confirm Password",
                      labelStyle: TextStyle(color: Colors.green),
                    ),
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        registerUser();
                      }
                    },
                    child: Text('Sign Up'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


