import 'package:flutter/material.dart';

class Addcarrent extends StatefulWidget {
  const Addcarrent({Key? key}) : super(key: key);

  @override
  State<Addcarrent> createState() => _AddcarrentState();
}

class _AddcarrentState extends State<Addcarrent> {
  final TextEditingController _carNameController = TextEditingController();
  final TextEditingController _carPriceController = TextEditingController();
  final TextEditingController _carDescriptionController =
  TextEditingController();
  String _automatedValue = 'Manual';
  String _seatsValue = '4';
  String _engineTypeValue = 'Petrol';

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
                // Perform the form submission here
                String carName = _carNameController.text;
                String carPrice = _carPriceController.text;
                String carDescription = _carDescriptionController.text;

                // Perform further processing or data submission
                // e.g., sending data to a backend server

                // Reset the form after submission
                _carNameController.clear();
                _carPriceController.clear();
                _carDescriptionController.clear();

                // Show a confirmation dialog or navigate to another screen
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Car Added'),
                      content: Text(
                          'The car $carName has been added for rent.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Close the dialog
                            Navigator.pop(context); // Go back to previous screen
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
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
