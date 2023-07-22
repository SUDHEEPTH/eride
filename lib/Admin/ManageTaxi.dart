import 'dart:convert';

import 'package:eride/Admin/Detailtaxi.dart';
import 'package:eride/Admin/model/usermodel.dart';
import 'package:eride/api/api.dart';
import 'package:eride/api/api_services.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';



class ManageTaxi extends StatefulWidget {
  const ManageTaxi({Key? key}) : super(key: key);

  @override
  State<ManageTaxi> createState() => _ManageTaxiState();
}

List _loadprooducts = [];

final List<String> containerImages = [
  'images/ava3.png',
  'images/ava3.png',
  'images/ava3.png',
  'images/ava3.png',
];
final List<String> entries1 = ['mac ', 'rio'];
final List<String> userIds = ['001', '002'];
final List<String> entries = ['vish', 'leo', 'don', 'rajeev'];
final List<String> userIds2 = ['007', '008', '009', '003'];
ApiService client = ApiService();
Future approveUser(String userid) async {
  print("u ${userid}");
  var response = await Api().getData('/register/approve/' + userid);
  if (response.statusCode == 200) {
    var items = json.decode(response.body);
    print("approve status${items}");

    Fluttertoast.showToast(
      msg: "Approved",
    );
  } else {
    Fluttertoast.showToast(
      msg: "Error",
    );
  }
}

Future reject(String userid) async {
  print("u ${userid}");
  var response = await Api().getData('/register/reject/' + userid);
  if (response.statusCode == 200) {
    var items = json.decode(response.body);
    print("approve status${items}");
    Fluttertoast.showToast(
      msg: "Approved",
    );
  } else {
    Fluttertoast.showToast(
      msg: "Error",
    );
  }
}

late String uerid;
late String userid2;

class _ManageTaxiState extends State<ManageTaxi> {
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
            Text(
              'Request',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            FutureBuilder<List<UserModel>>(
              future: client.fetchtaxi(),
              builder: (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      var userid = snapshot.data![index].lid; // Retrieve the user ID for the current index
                      print(userid);
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Detailtaxi(userid: userid)),
                          );
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage("server/public/images/"+snapshot.data![index].profilepic),
                          ),
                          title: Text(
                            '${snapshot.data![index].fname} ${snapshot.data![index].lname}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          subtitle: Text(
                            'ID: ${snapshot.data![index].lid}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.check,
                                  color: Colors.green,
                                ),
                                onPressed: () {
                                  // Handle approve button pressed
                                  approveUser(userid); // Replace with the appropriate function call
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  // Handle decline button pressed
                                  _declineUser(index); // Replace with the appropriate function call
                                },
                              ),
                            ],
                          ),
                          tileColor: Colors.grey.withOpacity(0.4),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => const Divider(),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
            Divider(
              thickness: 2,
              color: Colors.black,
            ),
            Text(
              'All Taxi',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            FutureBuilder<List<UserModel>>(
              future: client.fetchtaxistaus(),
              builder: (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(

                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      var userid2 = snapshot.data![index].lid;

                      if (index < containerImages.length) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Detailtaxi(userid: userid2)),
                            );
                          },
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage("server/public/images/"+snapshot.data![index].profilepic),
                            ),
                            title: Text(
                              snapshot.data![index].fname,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            subtitle: Text(
                              'ID: ${snapshot.data![index].lid}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                // Handle delete button pressed
                                _showDeleteConfirmationDialog(context, index);
                              },
                            ),
                            tileColor: Colors.grey.withOpacity(0.4),
                          ),
                        );
                      } else {
                        return SizedBox(); // Return an empty SizedBox if the index is out of bounds
                      }
                    },
                    separatorBuilder: (BuildContext context, int index) => const Divider(),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete User'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure you want to delete this user?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                // Perform delete operation
                _deleteUser(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteUser(int index) {
    // Perform the actual delete operation here
    // You can remove the user from the 'entries' list or call any delete API
    entries.removeAt(index);
    containerImages.removeAt(index);
  }

  void _declineUser(int index) {
    // Perform the decline operation here
    // For example, delete the user from the database
    print('User ${entries[index]} declined.');
  }
}
