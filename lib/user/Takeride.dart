import 'package:eride/user/Profileuser.dart';
import 'package:eride/user/Sharerid.dart';
import 'package:eride/user/Takeride2.dart';
import 'package:flutter/material.dart';

import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class Takeride extends StatefulWidget {
  const Takeride({Key? key}) : super(key: key);

  @override
  State<Takeride> createState() => _TakerideState();
}

class _TakerideState extends State<Takeride> {
  final _formKey = GlobalKey<FormState>();
  late String startingPlace;
  late String destination;
  late String time;
  late DateTime date;

  List<String> searchResults = []; // List to store search results

  void _submitForm() {
    if (_formKey.currentState!.validate()){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Takeride2()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.transparent,
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 24.0,
                bottom: 8.0,
              ),
              child: Text(
                'Join a ride !',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0, 2),
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child: Form(
                key: _formKey,

                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            startingPlace = value;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Starting Place',
                          filled: true,
                          fillColor: Colors.green[300]?.withOpacity(0.5),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green[300]!),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          prefixIcon: Icon(Icons.location_on),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the starting place';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            destination = value;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Destination',
                          filled: true,
                          fillColor: Colors.green[300]?.withOpacity(0.5),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green[300]!),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          prefixIcon: Icon(Icons.location_on),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the destination';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {

                                });
                              },
                              decoration: InputDecoration(
                                labelText: 'Number of Persons',
                                filled: true,
                                fillColor: Colors.green[300]?.withOpacity(0.5),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green[300]!),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                prefixIcon: Icon(Icons.person),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the number of persons';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Expanded(
                            flex: 1,
                            child: DateTimeField(
                              onChanged: (value) {
                                setState(() {
                                  date = value!;
                                });
                              },
                              decoration: InputDecoration(
                                labelText: 'Date',
                                filled: true,
                                fillColor: Colors.green[300]?.withOpacity(0.5),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green[300]!),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                prefixIcon: Icon(Icons.calendar_today),
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please enter a date';
                                }
                                return null;
                              },
                              format: DateFormat('yyyy-MM-dd'),
                              onShowPicker: (context, currentValue) async {
                                final date = await showDatePicker(
                                  context: context,
                                  initialDate: currentValue ?? DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                );
                                if (date != null) {
                                  return DateTimeField.combine(
                                      date,
                                      TimeOfDay.fromDateTime(
                                          currentValue ?? DateTime.now()));
                                } else {
                                  return currentValue;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _submitForm,
                          child: Text(
                            'Search',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 12.0,
                              horizontal: 24.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      if (searchResults.isNotEmpty)
                        Column(
                          children: [
                            Text(
                              'Search Results:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: searchResults.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(searchResults[index]),
                                );
                              },
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 100.0),
                    Text(
                      'Wishing you a happy and unforgettable journey!',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        'images/icons8-carpool-64.png',
                        // Replace with your desired image path
                        width: 50.0,
                        height: 50.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}