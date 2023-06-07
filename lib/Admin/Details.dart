import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

final List<String> Fname = [
  'lis',
];
final List<String> Lname = [
  'gen',
];
final List<String> Email = [
  'lisgen77@gmail.com',
];
final List<String> Ph = [
  '989578005',
];
final List<String> Id = [
  'Driving licence',
];
final List<String> Adresss = [
  ' mangalasheri(H)tirur(po) pin 676101 Malappuram kerala',
];
final List<String> Gender = [
  ' Female',
];
class _DetailsState extends State<Details> {
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
              padding: const EdgeInsets.only(top: 10.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/images.jpg'),
                radius: 65,
              ),
            ),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 18),
                child: Text(
                  'First Name:',
                  style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                ),
              )),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only( left: 65,top: 5),
                child: Text(
                  '${Fname[0]}',
                  style: TextStyle(fontSize: 17, color: Colors.black,fontWeight: FontWeight.bold),
                ),

              )),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 18),
                child: Text(
                  'Last Name:',
                  style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                ),
              )),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only( left: 65,top: 5),
                child: Text(
                  '${Lname[0]}',
                  style: TextStyle(fontSize: 17, color: Colors.black,fontWeight: FontWeight.bold),
                ),

              )),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 18),
                child: Text(
                  'Email:',
                  style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                ),
              )),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only( left: 65,top: 5),
                child: Text(
                  '${Email[0]}',
                  style: TextStyle(fontSize: 17, color: Colors.black,fontWeight: FontWeight.bold),
                ),

              )),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 18),
                child: Text(
                  'Mobile number:',
                  style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                ),
              )),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only( left: 65,top: 5),
                child: Text(
                  '${Ph[0]}',
                  style: TextStyle(fontSize: 17, color: Colors.black,fontWeight: FontWeight.bold),
                ),

              )),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 18),
                child: Text(
                  'Gender:',
                  style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                ),
              )),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only( left: 65,top: 5),
                child: Text(
                  '${Gender[0]}',
                  style: TextStyle(fontSize: 17, color: Colors.black,fontWeight: FontWeight.bold),
                ),

              )),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 18),
                child: Text(
                  'Id card:',
                  style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                ),
              )),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only( left: 65,top: 5),
                child: Text(
                  '${Id[0]}',
                  style: TextStyle(fontSize: 17, color: Colors.black,fontWeight: FontWeight.bold),
                ),

              )),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0, left: 18),
                child: Text(
                  'Adress:',
                  style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                ),
              )),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only( left: 65,top: 5),
                child: Text(
                  '${Adresss[0]}',
                  style: TextStyle(fontSize: 17, color: Colors.black,fontWeight: FontWeight.bold),
                ),

              )),


        ],
      ),
    );
  }
}
