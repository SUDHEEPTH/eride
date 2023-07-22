import 'dart:convert';

import 'package:eride/api/api.dart';
import 'package:eride/api/api_services.dart';
import 'package:eride/taxi/model/taximodel/taximodel.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

class Driver {
  final String name;
  final String photoUrl;
  final double rating;
  final String adress;

  Driver({
    required this.name,
    required this.photoUrl,
    required this.rating,
    required this.adress,
  });
}


class Taxihome extends StatefulWidget {
  @override
  _TaxihomeState createState() => _TaxihomeState();
}

class _TaxihomeState extends State<Taxihome> {
  String first_name = "";
  String Phone_no = "";
  String last_name = "";
  String address = "";
  String email = "";
  String gender = "";
  String usernames = "";
  String idcard = "";
  String idcardimag = "";
  String _id = "";
  String mac = '';
  ApiService client = ApiService();
  String username = "";
  String login_id = "";
  String log = "";
  String profilepic = "";

  late SharedPreferences prefs;
  void initState() {
    super.initState();
    _viewPro();

  }

  Future<void> _viewPro() async {

      prefs = await SharedPreferences.getInstance();
      username = (prefs.getString('username') ?? '');
      login_id = prefs.getString('login_id') ?? '';
      print("usr${username}");
      print("usr${login_id}");

      print("usssssssssssr${log}");

    print("user selected id is $login_id");
    print("user selected id is $login_id");
    String mid = login_id.replaceAll('"', '');
      print("user selected id is $mid");

    var res = await Api().getData('/taxiride/viewtaxi/$mid');
    var body = json.decode(res.body);
    print("response body: $body");

    if (body != null && body['success'] == true) {
      setState(() {
        first_name = body['data'][0]['first_name'];
        Phone_no = body['data'][0]['Phone_no'];
        last_name = body['data'][0]['last_name'];
        address = body['data'][0]['address'];
        email = body['data'][0]['email'];
        gender = body['data'][0]['gender'];
        username = body['data'][0]['username'];
        idcard = body['data'][0]['idcard'];
        _id = body['data'][0]['_id'];
        profilepic = body['data'][0]['profilepic'];
      });
    } else {
      Fluttertoast.showToast(
        msg: 'Failed to fetch user data',
        backgroundColor: Colors.grey,
      );
    }
  }




  final String userPhotoUrl = 'https://example.com/user_photo.jpg';
  final List<Driver> drivers = [
    Driver(
      name: 'joe',
      photoUrl: 'images/images.jpg',
      rating: 4.5,
      adress: 'lulu mall near post office',
    ),
    Driver(
      name: 'max',
      photoUrl: 'images/images (1).jpg',
      rating: 4.2,
      adress: 'ariyallur near post office',
    ),
  ];

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
    String userid='';
    print("uuk: ${_id}");
    Future approveUser(String userid) async {
      userid = userid;
      print("uuk: ${_id}");
      var response = await Api().getData('/taxiride/accept/$userid/$_id');
      if (response.statusCode == 200) {
        var items = json.decode(response.body);
        print("approve status${items}");
        Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context)=> Taxihome()));

        Fluttertoast.showToast(
          msg: "accepted",
        );
      } else {
        Fluttertoast.showToast(
          msg: "Error",
        );
      }
    }
    return SafeArea(
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
                      'Hello,' + username.replaceAll('"', ''),
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Accept request and make profit !',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage("server/public/images/"+profilepic),
                  radius: 30.0,
                ),
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
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 5.0,
              color: Colors.black87.withOpacity(0.8),
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "User Request",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Card(
                color: Colors.grey.withOpacity(0.5),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Colors.grey.withOpacity(0.8),
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, left: 5, right: 5, bottom: 10),
                  child: FutureBuilder<List<TaxiModel>>(
                    future: client.fetchtaxiride(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<TaxiModel>> snapshot) {
                      if (snapshot.hasData) {
                        return Flexible(
                          child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              userid = snapshot.data![index].id;
                              print('hi $userid');
                              return Column(
                                children: [
                                  ListTile(
                                    leading: CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          AssetImage("server/public/images/"),
                                    ),
                                    title: Text(
                                      snapshot.data![index].fname,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 4),
                                        Text(
                                          'Address: ${snapshot.data![index].address}',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          'Destination: ${snapshot.data![index].destination}',
                                          style: TextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.calendar_today,
                                                    size: 14,
                                                    color: Colors.grey
                                                        .withOpacity(0.8),
                                                  ),
                                                  SizedBox(width: 4),
                                                  Expanded(
                                                    child: Text(
                                                      'Date: ${snapshot.data![index].Date}',
                                                      style: TextStyle(
                                                        fontSize: 14.0,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 8),
                                                  Icon(
                                                    Icons.access_time,
                                                    size: 14,
                                                    color: Colors.grey
                                                        .withOpacity(0.8),
                                                  ),
                                                  SizedBox(width: 4),
                                                  Expanded(
                                                    child: Text(
                                                      'Time: ${snapshot.data![index].time}',
                                                      style: TextStyle(
                                                        fontSize: 14.0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    trailing: ElevatedButton(
                                      onPressed: () {
                                        approveUser(userid);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.black,
                                      ),
                                      child: Text(
                                        'Accept',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      approveUser(mac);
                                    },
                                  ),
                                  SizedBox(height: 5),
                                  Divider(
                                    color: Colors.grey.withOpacity(0.8),
                                    thickness: 1,
                                    height: 1,
                                  ),
                                  SizedBox(height: 5),
                                ],
                              );
                            },
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),
            ),
          ),

          // Existing code for the home page
        ],
      ),
    );
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
              backgroundImage: AssetImage('images/user_photo.jpg'),
              radius: 30.0,
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

class ProfileUser extends StatefulWidget {
  const ProfileUser({Key? key}) : super(key: key);

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser>
    with SingleTickerProviderStateMixin {
  final _formKey3 = GlobalKey<FormState>();
  String confirmPassword = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String first_name = "";
  String Phone_no = "";
  String last_name = "";
  String address = "";
  String email = "";
  String gender = "";
  String usernames = "";
  String idcard = "";
  String idcardimag = "";
  String _id = "";
  String mac = '';
  ApiService client = ApiService();
  String username = "";
  String login_id = "";
  String log = "";
  String profilepic = "";

  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _viewPro();
  }

  Future<void> _viewPro() async {
    prefs = await SharedPreferences.getInstance();
    username = (prefs.getString('username') ?? '');
    login_id = prefs.getString('login_id') ?? '';
    print("usr${username}");
    print("usr${login_id}");

    print("usssssssssssr${log}");

    print("user selected id is $login_id");
    print("user selected id is $login_id");
    String mid = login_id.replaceAll('"', '');
    print("user selected id is $mid");

    var res = await Api().getData('/taxiride/viewtaxi/$mid');
    var body = json.decode(res.body);
    print("response body: $body");

    if (body != null && body['success'] == true) {
      setState(() {
        first_name = body['data'][0]['first_name'];
        Phone_no = body['data'][0]['Phone_no'];
        last_name = body['data'][0]['last_name'];
        address = body['data'][0]['address'];
        email = body['data'][0]['email'];
        gender = body['data'][0]['gender'];
        username = body['data'][0]['username'];
        idcard = body['data'][0]['idcard'];
        _id = body['data'][0]['_id'];
        profilepic = body['data'][0]['profilepic'];
        idcardimag = body['data'][0]['idcardimag'];
      });
    } else {
      Fluttertoast.showToast(
        msg: 'Failed to fetch user data',
        backgroundColor: Colors.grey,
      );
    }
  }
  // _update() async {
  //   setState(() {
  //     var _isLoading = true;
  //   });
  //   String se = widget.id;
  //   var data = {
  //     "password": passwordController.text,
  //     "email": passwordController.text,
  //     "phone": phoneController.text,
  //
  //   };
  //   print(data);
  //   var res = await Api().authData(data, '/product/update-single-product/' + se);
  //   var body = json.decode(res.body);
  //
  //   if (body['success'] == true) {
  //     print(body);
  //
  //     Fluttertoast.showToast(
  //       msg: body['message'].toString(),
  //       backgroundColor: Colors.grey,
  //     );
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => Prdt(
  //         ),
  //       ),
  //     );
  //   } else {
  //     Fluttertoast.showToast(
  //       msg: body['message'].toString(),
  //       backgroundColor: Colors.grey,
  //     );
  //   }
  // }


  late TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.green,
          tabs: const [
            Tab(text: 'Only Me'),
            Tab(text: 'Account'),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200], // Set your preferred background color or image
      body: TabBarView(
        controller: _tabController,
        children: [
          // Only Me content
          SingleChildScrollView(
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundImage: AssetImage(
                            "server/public/images/" +
                                profilepic, // Replace with your profile picture
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name: $username',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'UID: $_id',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Divider(
                      color: Colors.green,
                      thickness: 2,
                    ),
                    const SizedBox(height: 16),
                    buildInfoRow("First Name", first_name),
                    buildInfoRow("Last Name", last_name),
                    buildInfoRow("Email", email),
                    buildInfoRow("Phone", Phone_no),
                    buildInfoRow("Address", address),
                    buildInfoRow("ID Card", idcard),
                    const SizedBox(height: 20),
                    Divider(
                      color: Colors.green,
                      thickness: 2,
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        // Action for "Log Out" button
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'LOG OUT',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'User Name:',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                first_name,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              // Action for "Edit profile picture" button
                            },
                            child: CircleAvatar(
                              radius: 45,
                              backgroundImage: AssetImage(
                                "server/public/images/" +
                                    profilepic, // Replace with your profile picture
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Form(
                          key: _formKey3, // Associate the form with the form key
                          child: Column(
                            children: [
                              Divider(
                                color: Colors.green,
                                thickness: 2,
                              ),
                              Text(
                                'Contacts',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                controller: emailController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter Email';
                                  }

                                  // Regular expression for basic email format validation
                                  String emailPattern = r'^[a-zA-Z0-9._%+-]+@gmail\.com$';
                                  RegExp regExp = RegExp(emailPattern);
                                  if (!regExp.hasMatch(value)) {
                                    return 'Please enter a valid Gmail address';
                                  }

                                  return null;
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  labelText: "Enter Email",
                                  labelStyle: TextStyle(color: Colors.green),
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                maxLength: 10,
                                controller: phoneController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter Phone Number';
                                  }

                                  // Remove any non-digit characters and check the length
                                  String cleanedNumber = value.replaceAll(RegExp(r'\D'), '');
                                  if (cleanedNumber.length != 10) {
                                    return 'Phone Number should be exactly 10 digits';
                                  }

                                  return null;
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  labelText: "Enter Phone Number",
                                  labelStyle: TextStyle(color: Colors.green),
                                  counterText: '',
                                ),
                              ),
                              const SizedBox(height: 10),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: ElevatedButton(

                                  onPressed: () {
                                    // Validate the form
                                    if (_formKey3.currentState!.validate()) {
                                      // Perform the action when the form is valid (i.e., not null)
                                      // For example, you can save the email and phone number values
                                      // to the database or perform any other action here.
                                    }
                                  },
                                  child: Text('Save'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 0),

                      Divider(
                        color: Colors.green,
                        thickness: 2,
                      ),
                      Column(
                        children: [
                          Text(
                            'Change password',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: passwordController,
                            onChanged: (value) {
                              // Handle the password change if needed
                            },
                            decoration: InputDecoration(
                              labelText: 'New Password',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            onChanged: (value) {
                              setState(() {
                                confirmPassword = value;
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Confirm New Password',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton.icon(
                            onPressed: () {
                              if (passwordController.text.isNotEmpty && confirmPassword.isNotEmpty) {
                                if (passwordController.text == confirmPassword) {
                                  // Password and Confirm Password match, handle saving the profile changes here
                                  // You can implement the saving logic here
                                  // For now, let's display a snackbar to indicate successful saving.
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Profile changes saved successfully.'),
                                    ),
                                  );
                                } else {
                                  // Password and Confirm Password do not match, show an error message
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Error'),
                                        content: Text('Passwords do not match. Please re-enter and try again.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              } else {
                                // Show an error message if passwords are empty
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Please enter both new password and confirm password.'),
                                  ),
                                );
                              }
                            },
                            icon: Icon(
                              Icons.save,
                              color: Colors.white,
                            ),
                            label: Text(
                              ' Change password',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 10.0,
                              ),
                            ),
                          ),
                        ],
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to create the info row with label and value
  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Wrap(
              children: [
                Text(
                  value,
                  style: TextStyle(fontSize: 16), // You can adjust the font size as needed
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}