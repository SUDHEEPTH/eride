import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Takeride3 extends StatefulWidget {
  const Takeride3({Key? key}) : super(key: key);

  @override
  State<Takeride3> createState() => _Takeride3State();
}

class _Takeride3State extends State<Takeride3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back, color: Colors.green),
          label: const Text('Back', style: TextStyle(color: Colors.green)),
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            elevation: 0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            alignment: Alignment.centerLeft,
            child: Text(
              'May 21, 2023', // Replace with your desired date
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0,
                  isFirst: true,
                  endChild: Container(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Destination 1',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Address of Destination 1',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  beforeLineStyle: LineStyle(
                    color: Colors.blue,
                    thickness: 6,
                  ),
                  indicatorStyle: IndicatorStyle(
                    width: 40,
                    height: 40,
                    indicator: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineXY: 0,
                  isLast: true,
                  endChild: Container(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Destination 2',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Address of Destination 2',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  beforeLineStyle: LineStyle(
                    color: Colors.orange,
                    thickness: 6,
                  ),
                  indicatorStyle: IndicatorStyle(
                    width: 40,
                    height: 40,
                    indicator: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 5,
                    ),
                  ),
                ),

                SizedBox(height: 8,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Price for 1 Passenger',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Rs 700',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 8,),

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 5,
                    ),
                  ),
                ),

                SizedBox(height: 8,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'John Doe', // Replace with the desired contact name
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'John Doe', // Replace with the desired contact name
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'car', // Replace with the desired contact name
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'car', // Replace with the desired contact name
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: EdgeInsets.zero,
                          child: Divider(
                            color: Colors.grey,
                            thickness: 5,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Report ride', // Replace with the desired contact name
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () {
                // Add your logic here for the continue button
              },
              child: Text('Continue'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
                minimumSize: Size(double.infinity, 50), // Set the width and height of the button
              ),
            ),
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
