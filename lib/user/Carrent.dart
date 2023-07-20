import 'package:eride/user/Addcarrent.dart';
import 'package:eride/user/Carrent2.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Carrent extends StatefulWidget {
  @override
  State<Carrent> createState() => _CarrentState();
}

class _CarrentState extends State<Carrent> {



  late SharedPreferences prefs;
  String username = "";
  String login_id = "";
  void initState() {
    super.initState();

    fetchuser();
  }
  fetchuser()async{
    prefs = await SharedPreferences.getInstance();
    username = (prefs.getString('username') ?? '');
    login_id = prefs.getString('login_id') ?? '';
    print("usr${username}");
    print("usr${login_id}");



  }
  final TextEditingController _searchController = TextEditingController();
  String searchValue = ''; // Variable to store the search value

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void performSearch() {
    setState(() {
      searchValue = _searchController.text;
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Carrent2(searchValue: searchValue,login_id:login_id)),
    );
  }

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search... location',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () => _searchController.clear(),
                  ),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: performSearch, // Call performSearch() when search button is pressed
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 310,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: performSearch, // Call performSearch() when "search" button is pressed
              child: Text("search"),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: 80,
        height: 80,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Addcarrent()),
            );
          },
          child: Icon(Icons.car_rental),
        ),
      ),
    );
  }
}
