import 'package:flutter/material.dart';

class Change extends StatefulWidget {
  const Change({super.key});

  @override
  State<Change> createState() => _ChangeState();
}

class _ChangeState extends State<Change> {
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
      body: Column(
        children: [
         Center(

             child: Padding(
               padding: const EdgeInsets.only(top: 20.0),
               child: Text("Change password" ,style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold),),
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
            ),
          ),
Divider(thickness: 1, color: Colors.black,),

          Padding(
            padding: const EdgeInsets.only(
              left: 50.0,
              right: 50,
              top: 10,
              bottom: 10,
            ),
            child: TextFormField(

              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: "Enter New Password",
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

              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: "Comfirm Password",
                labelStyle: TextStyle(color: Colors.green),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
