import 'package:eride/user/Carrent3.dart';
import 'package:eride/user/Takeride3.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Takeride2 extends StatefulWidget {
  const Takeride2({Key? key}) : super(key: key);

  @override
  State<Takeride2> createState() => _Takeride2State();
}

class _Takeride2State extends State<Takeride2> {
  final String userPhotoUrl = 'https://example.com/user_photo.jpg'; // Replace with the user's photo URL

  final List<String> Destination1 =
    [
       'Bangalore','Bangalore',

    ];
  final List<String> Destination2 =
  [
    'Cochin','Cochin',];
  List<String> rate1=
  [
    '600','700',
  ];
  List<String> des1=
  [
    'near postoffice','falooda nation ',
  ];
  List<String> des2=
  [
    'near lulu mall','wall nation ',
  ];
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
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: Destination1.length,

        itemBuilder: (BuildContext context, int index) {







          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    GestureDetector(
                      onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>Takeride3()));

                      },
                      child: Container(

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: TimelineTile(

                                alignment: TimelineAlign.manual,
                                lineXY: 0,
                                isFirst: true,
                                endChild: Container(
                                  height: 100,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0,top: 8,right: 8),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                '₹ ${rate1[index]}  ' ,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text( Destination2[index] ??'',
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
                                          des2[index] ??'',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                                beforeLineStyle: LineStyle(
                                  color: Colors.black,
                                  thickness: 6,
                                ),
                                indicatorStyle: IndicatorStyle(
                                  width: 40,
                                  height: 40,
                                  indicator: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black,
                                      border: Border.all(
                                        color: Colors.black,
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
                            ),


                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: TimelineTile(
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
                                          Destination1[index] ?? '',
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
                                          des1[index] ??'',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                beforeLineStyle: LineStyle(
                                  color: Colors.black,
                                  thickness: 6,
                                ),
                                indicatorStyle: IndicatorStyle(
                                  width: 40,
                                  height: 40,
                                  indicator: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black,
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
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 16.0,bottom: 15),
                              child: Row(

                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 8),
                                    child: GestureDetector(
                                      // onTap: () {
                                      //   Navigator.push(context, MaterialPageRoute(builder: (context)=>_buildProfilePage()));
                                      // },
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(userPhotoUrl),
                                        radius: 20.0,
                                      ),

                                    ),

                                  ),

                                    Column(
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'User',
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        Text(
                                          'Rating:5.0/5',
                                          style: TextStyle(
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ],
                                    ),




                                ],
                              ),
                            ),



                            ]
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

