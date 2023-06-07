import 'package:eride/Admin/Manageuser.dart';
import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  String dropdownValue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  final String userPhotoUrl = 'https://example.com/user_photo.jpg';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome, Admin',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16.0),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 1.0),
                    child: GestureDetector(
                      // onTap: () {
                      //   Navigator.push(context, MaterialPageRoute(builder: (context)=>_buildProfilePage()));
                      // },
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(userPhotoUrl),
                        radius: 30.0,
                      ),
                    ),
                  ),
                  DropdownButton<String>(
                    // Initial Value
                    value: dropdownValue,

                    // Down Arrow Icon
                    icon: const Icon(Icons.list),

                    // Array list of items
                    items: items.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }
                    ).toList(),
                    // After selecting the desired option, it will
                    // change the button value to the selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('images/banner.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(.6),
                          Colors.black.withOpacity(.6),
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "ADMIN",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 20.0, right: 15, top: 20, bottom: 8),
                child: GestureDetector(
                  onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Manageuser()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.manage_accounts,
                            size: 50,
                            color: Colors.white,
                          ),
                          Text(
                            'Manage users',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              // Curved Rectangle
              Padding(
                padding:
                const EdgeInsets.only(left: 20.0, right: 15, top: 20, bottom: 8),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>Driverrent()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black87,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.manage_accounts_sharp,
                            size: 50,
                            color: Colors.white,
                          ),
                          Text(
                            'Manage Drivers',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              // Curved Rectangle
              Padding(
                padding:
                const EdgeInsets.only(left: 20.0, right: 15, top: 20, bottom: 8),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>Driverrent()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black87,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.manage_accounts_sharp,
                            size: 50,
                            color: Colors.white,
                          ),
                          Text(
                            'Manage Taxis',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
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
