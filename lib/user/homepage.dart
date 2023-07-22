
import 'package:eride/user/Carrent.dart';
import 'package:eride/user/Driverrent.dart';
import 'package:eride/user/Profileuser.dart';
import 'package:eride/user/Riderequest.dart';
import 'package:eride/user/Share1.dart';
import 'package:eride/user/ShareRideDetasils.dart';
import 'package:eride/user/Taxiac.dart';
import 'package:eride/user/YourShare.dart';
import 'package:eride/user/taxi.dart';

import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Message {
  final String sender;
  final String content;
  final bool isMe;

  Message({
    required this.sender,
    required this.content,
    required this.isMe,
  });
}

class Payment {
  final String description;
  final DateTime date;
  final double amount;
  final bool isDebited;

  Payment({
    required this.description,
    required this.date,
    required this.amount,
    required this.isDebited,
  });
}

class Homeuser extends StatefulWidget {
  @override
  _HomeuserState createState() => _HomeuserState();
}


class _HomeuserState extends State<Homeuser> {
  final String userPhotoUrl = 'https://example.com/user_photo.jpg';


  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentPage;
    switch (_currentIndex) {
      case 0:
        currentPage = _buildHomePage();
        break;
      case 1:
        currentPage = _buildMessagePage();
        break;
      case 2:
        currentPage = _buildPaymentPage();
        break;
      case 3:
        currentPage = _buildProfilePage();
        break;
      default:
        currentPage = _buildHomePage();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: currentPage,
      bottomNavigationBar: FloatingNavbar(
        backgroundColor: Colors.green,
        onTap: _onTap,
        currentIndex: _currentIndex,
        items: [
          FloatingNavbarItem(icon: Icons.home, title: 'Home'),
          FloatingNavbarItem(icon: Icons.chat_bubble_outline, title: 'Message'),
          FloatingNavbarItem(icon: Icons.payment_outlined, title: 'Payment'),
          FloatingNavbarItem(icon: Icons.person, title: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildHomePage() {
    return homepage();
  }

  Widget _buildMessagePage() {
    List<Chat> chats = [
      Chat(name: 'John Doe', message: 'Hello!', timestamp: '10:00 AM'),
      Chat(
          name: 'Jane Smith',
          message: 'Hi, how are you?',
          timestamp: '11:30 AM'),
      Chat(
          name: 'David Johnson',
          message: 'Good morning!',
          timestamp: 'Yesterday'),
    ];

    return SafeArea(
      child: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage:
              NetworkImage('https://example.com/${chat.name}_photo.jpg'),
            ),
            title: Text(chat.name),
            subtitle: Text(chat.message),
            trailing: Text(chat.timestamp),
            onTap: () {
              // Navigate to the chat section
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatSection(chat: chat),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildPaymentPage() {
    final List<Payment> paymentHistory = [
      Payment(
        description: 'Payment 1',
        date: DateTime.now(),
        amount: 20.0,
        isDebited: true,
      ),
      Payment(
        description: 'Payment 2',
        date: DateTime.now(),
        amount: 15.0,
        isDebited: false,
      ),
      Payment(
        description: 'Payment 3',
        date: DateTime.now(),
        amount: 30.0,
        isDebited: true,
      ),
    ];

    List<Payment> filteredPayments =
        paymentHistory; // Initialize with all payments
    bool? isDebitedFilter; // Selected filter option

    // Filter logic
    void filterPayments(bool? isDebited) {
      setState(() {
        isDebitedFilter = isDebited;
        filteredPayments = isDebited == null
            ? paymentHistory
            : paymentHistory
            .where((payment) => payment.isDebited == isDebited)
            .toList();
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Wallet',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.account_balance_wallet),
          title: Text('Balance: \$100'),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Payment History',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButton<bool?>(
                value: isDebitedFilter,
                hint: Text('Filter'),
                items: [
                  DropdownMenuItem<bool?>(
                    value: null,
                    child: Text('All'),
                  ),
                  DropdownMenuItem<bool?>(
                    value: true,
                    child: Text('Debited'),
                  ),
                  DropdownMenuItem<bool?>(
                    value: false,
                    child: Text('Credited'),
                  ),
                ],
                onChanged: (value) {
                  filterPayments(value);
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredPayments.length,
            itemBuilder: (context, index) {
              final payment = filteredPayments[index];
              final paymentType = payment.isDebited ? 'Debited' : 'Credited';
              final paymentAmount = payment.isDebited
                  ? '-\$${payment.amount}'
                  : '+\$${payment.amount}';
              final paymentColor =
              payment.isDebited ? Colors.red : Colors.green;
              return ListTile(
                title: Text(payment.description),
                subtitle: Text('Date: ${payment.date.toString()}'),
                trailing: Text(
                  '$paymentType: $paymentAmount',
                  style: TextStyle(
                    color: paymentColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }


  Widget _buildProfilePage() {
    return ProfileUser();
  }
}
class Chat {
  final String name;
  final String message;
  final String timestamp;

  Chat({required this.name, required this.message, required this.timestamp});
}

List<Message> messages = [
  Message(
    sender: 'User',
    content: 'Hello!',
    isMe: true,
  ),
  Message(
    sender: 'Driver',
    content: 'Hi there!',
    isMe: false,
  ),
  Message(
    sender: 'User',
    content: 'How are you?',
    isMe: true,
  ),
  Message(
    sender: 'Driver',
    content: 'I\'m good. Thanks for asking!',
    isMe: false,
  ),
];

class ChatSection extends StatelessWidget {
  final Chat chat;

  ChatSection({required this.chat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.green),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(chat.name, style: TextStyle(color: Colors.green)),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: message.isMe
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: message.isMe ? Colors.blue : Colors.grey[200],
                        ),
                        child: Text(
                          message.content,
                          style: TextStyle(
                            color: message.isMe ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Add your logic for sending the message here
                  },
                  child: Text('Send'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  late String axi;
  String username = "";
  String login_id = "";
String log = "";

  late SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchuser();
  }

 fetchuser()async{
    prefs = await SharedPreferences.getInstance();
    setState(() {
      username = (prefs.getString('username') ?? '');
      login_id = prefs.getString('login_id') ?? '';
      print("usr${username}");
      print("usr${login_id}");


      print("usssssssssssr${log}");

    });

  }


  final String userPhotoUrl = 'https://example.com/user_photo.jpg';
 // Replace with the user's photo URL
  List _loadprooducts = [];

  late int login;


  @override
  Widget build(BuildContext context) {
    log=login_id;
    print('log $log');
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
                          'Hello,'+username.replaceAll('"', ''),
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Where do you want to go?',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16.0),
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
                ],
              ),
              SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0 ,right: 10),
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
                          "E-ride",
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
                padding: const EdgeInsets.only(left: 20.0,right: 15,top: 20,bottom: 8 ),
                child: Row(
                  children: [
                    // Curved Square
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Share1()));
                      },
                      child: Container(
                        width:  MediaQuery.of(context).size.width/3,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.directions_car,
                                size: 50,
                                color: Colors.white,
                              ),
                              Text(
                                'Share Ride',
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
                    SizedBox(width: 10),
                    // Curved Rectangle
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Driverrent()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/1.9,
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
                                Icons.people,
                                size: 50,
                                color: Colors.white,
                              ),
                              Text(
                                'Driver Rent',
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Carrent()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/1.9,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.car_rental_outlined,
                                size: 50,
                                color: Colors.white,
                              ),
                              Text(
                                'car Rent',
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
                    // Curved Square

                    SizedBox(width: 10),
                    GestureDetector(

                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Taxi(axi:log)));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/3,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.local_taxi,
                                size: 50,
                                color: Colors.white,
                              ),
                              Text(
                                'taxi',
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
                    // Curved Rectangle

                  ],
                ),
              ),

              SizedBox(height: 25.0),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "Notification",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ShareRideDetails()));
                            },
                            child: ListTile(
                              leading: Icon(Icons.notifications_active),
                              title: Text("Joined Ride Details"),
                              subtitle: Text("John shared a ride from XYZ to ABC"),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          );
                        }  if (index == 2) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Taxiac(axi:log)));
                            },
                            child: ListTile(
                              leading: Icon(Icons.notifications_active),
                              title: Text("taxi"),
                              subtitle: Text("Your ride will come in Time XY"),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          );
                        }if (index == 3) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Riderequest(axi:log)));
                            },
                            child: ListTile(
                              leading: Icon(Icons.notifications_active),
                              title: Text("ride request"),
                              subtitle: Text(""),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          );
                        }
                        else {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => YourShare()));
                            },
                            child: ListTile(
                              leading: Icon(Icons.notifications_active),
                              title: Text("Your Shared Ride"),
                              subtitle: Text("You are sharing a ride from DEF to GHI"),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),





            ], // Added closing bracket for the Column widget
          ),
        ),
      ),
    );
  }
}