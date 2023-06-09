import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

final List<String> Fname = ['lis'];
final List<String> Lname = ['gen'];
final List<String> Email = ['lisgen77@gmail.com'];
final List<String> Ph = ['989578005'];
final List<String> Id = ['Driving licence'];
final List<String> Adresss = ['mangalasheri(H)tirur(po) pin 676101 Malappuram kerala'];
final List<String> Gender = ['Female'];
final List<String> Idf = ['001'];

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/SJG.png'),
                radius: 65,
              ),
            ),
            SizedBox(height: 1,),
            Container(
              padding: const EdgeInsets.only(top: 20.0, left: 2, right: 20, bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300], // Set container background color
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              margin: const EdgeInsets.all(16.0),



              // Set container padding
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 18),
                    child: Row(
                      children: [

                        Text(
                          'ID:',
                          style: TextStyle(fontSize: 16, color: Colors.green[500],fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '${Idf[0]}',
                          style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 18),
                    child: Row(
                      children: [

                        Text(
                          'First Name:',
                          style: TextStyle(fontSize: 16, color: Colors.green[500],fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '${Fname[0]}',
                          style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 18),
                    child: Row(
                      children: [
                        Text(
                          'Last Name:',
                          style: TextStyle(fontSize: 16, color: Colors.green[500],fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '${Lname[0]}',
                          style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 18),
                    child: Row(
                      children: [
                        Text(
                          'Email:',
                          style: TextStyle(fontSize: 16, color: Colors.green[500],fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '${Email[0]}',
                          style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 18),
                    child: Row(
                      children: [
                        Text(
                          'Mobile number:',
                          style: TextStyle(fontSize: 16, color: Colors.green[500],fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '${Ph[0]}',
                          style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 18),
                    child: Row(
                      children: [
                        Text(
                          'Gender:',
                          style: TextStyle(fontSize: 16, color: Colors.green[500],fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '${Gender[0]}',
                          style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 18),
                    child: Row(
                      children: [
                        Text(
                          'Id card:',
                          style: TextStyle(fontSize: 16, color: Colors.green[500],fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '${Id[0]}',
                          style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 18),
                    child: Row(
                      children: [
                        Text(
                          'Address:',
                          style: TextStyle(fontSize: 16, color: Colors.green[500],fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            '${Adresss[0]}',
                            style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}