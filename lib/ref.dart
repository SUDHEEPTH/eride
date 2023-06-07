import 'package:flutter/material.dart';

class Manageuser extends StatelessWidget {
  final List<String> containerImages = [
    'images/rest.png',
    'images/rest.png',
    'images/rest.png',
    'images/rest.png',
  ];
  final List<String> entries = ['vishnu', 'lis', 'Gen', 'raj'];
  final List<String> userIds = ['001', '002', '003', '004'];

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
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(containerImages[index]),
                  ),
                  title: Text(
                    entries[index],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  subtitle: Text(
                    'ID: ${userIds[index]}',
                    style: TextStyle(
                      color: Colors.grey,
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
                          _approveUser(index);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          // Handle decline button pressed
                          _declineUser(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Divider(
            thickness: 2,
            color: Colors.black,
          ),
          // Your existing ListView.separated code goes here
        ],
      ),
    );
  }

  void _approveUser(int index) {
    // Perform the approve operation here
    // For example, update the user status in the database
    print('User ${entries[index]} approved.');
  }

  void _declineUser(int index) {
    // Perform the decline operation here
    // For example, delete the user from the database
    print('User ${entries[index]} declined.');
  }
}
