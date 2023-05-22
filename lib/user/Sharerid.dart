import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:eride/user/Sharerid.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class StartRidePage extends StatefulWidget {
  const StartRidePage({Key? key}) : super(key: key);

  @override
  State<StartRidePage> createState() => _StartRidePageState();
}

class _StartRidePageState extends State<StartRidePage> {
  final _formKey = GlobalKey<FormState>();
  late String startingPlace;
  late String destination;
  late String time;
  late DateTime date;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, perform submission logic here
      // You can access the input values using startingPlace, destination, and time variables
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
        'Share a ride !',
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      ),
    ),

      Container(
        margin:  EdgeInsets.only(left: 16.0,top: 16.0,right: 16.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.green[300]?.withOpacity(0.7),
          borderRadius: BorderRadius.circular(8.0),
        ),
      child: Form(
      key: _formKey,
      child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
      children: [
      TextFormField(
      decoration: InputDecoration(
      labelText: 'Starting Place',
      ),
      validator: (value) {
      if (value == null || value.isEmpty) {
      return 'Please enter a starting place';
      }
      return null;
      },
      onSaved: (value) {
      startingPlace = value!;
      },
      ),
      SizedBox(height: 16.0),
      TextFormField(
      decoration: InputDecoration(
      labelText: 'Destination',
      ),
      validator: (value) {
      if (value == null || value.isEmpty) {
      return 'Please enter a destination';
      }
      return null;
      },
      onSaved: (value) {
      destination = value!;
      },
      ),
      SizedBox(height: 16.0),
      TextFormField(
      decoration: InputDecoration(
      labelText: 'Time',
      ),
      validator: (value) {
      if (value == null || value.isEmpty) {
      return 'Please enter a time';
      }
      return null;
      },
      onSaved: (value) {
      time = value!;
      },
      ),
        SizedBox(height: 16.0),
        DateTimeField(
          onChanged: (value) {
            setState(() {
              date = value!;
            });
          },
          decoration: InputDecoration(
            labelText: 'Date',
            filled: true,
            fillColor: Colors.white?.withOpacity(0.5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
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
              return DateTimeField.combine(date,
                  TimeOfDay.fromDateTime(
                      currentValue ?? DateTime.now()));
            } else {
              return currentValue;
            }
          },
        ),
      SizedBox(height: 24.0),
      ElevatedButton(
      onPressed: _submitForm,
      style: ElevatedButton.styleFrom(
      primary: Colors.green,
      minimumSize: Size(double.infinity, 60.0),
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.0),
      ),
      ),
      child:
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 20.0, vertical: 10.0),
        child: Text(
          'Submit',
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
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
                // Existing code for "Take a ride" button
                // Existing code for "Start a ride" button
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
                    'images/icons8-carpool-64.png', // Replace with your desired image path
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
