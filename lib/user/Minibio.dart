import 'package:flutter/material.dart';

class Minibio extends StatefulWidget {
  const Minibio({Key? key}) : super(key: key);

  @override
  State<Minibio> createState() => _MinibioState();
}

class _MinibioState extends State<Minibio> {
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
        SizedBox(
        height: 50,
      ),
        Align(
          alignment: Alignment.center,
          child: Text(
            'What would you like other members to know about you?',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
          TextField(
              onChanged: (value) {
                print("The value entered is : $value");
              }
          )
          ],
      )

    );
  }
}
