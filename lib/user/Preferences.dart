import 'package:flutter/material.dart';

class Preferences extends StatefulWidget {
  const Preferences({Key? key}) : super(key: key);

  @override
  State<Preferences> createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 30),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Travel preferences",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 35.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Chattiness",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500],
                        fontSize: 15),
                  ))),
          SizedBox(
            height: 5,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 35.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "I'm chatty when I feel comfortable",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontSize: 20),
                  ))),
          SizedBox(
            height: 40,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 35.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Music",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500],
                        fontSize: 15),
                  ))),
          SizedBox(
            height: 5,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 35.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "I,ll jam depending on the mood ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontSize: 20),
                  ))),
          SizedBox(
            height: 40,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 35.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Smoking",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500],
                        fontSize: 15),
                  ))),
          SizedBox(
            height: 5,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 35.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Cigarette breaks outside the car are ok ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontSize: 20),
                  ))),
          SizedBox(
            height: 40,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 35.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Pets",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500],
                        fontSize: 15),
                  ))),
          SizedBox(
            height: 5,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 35.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "I'll travel with depending on animal ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontSize: 20),
                  ))),
        ],
      ),
    );
  }
}
