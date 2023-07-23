// Widget _buildHomePage() {
//   void calculateFare(double distanceInKm, double farePerKm, TaxiModel taxi) {
//     // Replace the farePerKm with the actual fare charged by taxi services in your area.
//     setState(() {
//       taxi.fareAmount = distanceInKm * farePerKm;
//     });
//   }
//
//   String userid = '';
//
//   Future approveUser(String userid) async {
//     userid = userid;
//     print("uuk: ${fareAmount}");
//     print("uuk: ${_id}");
//     var response = await Api().getData('/taxiride/accept/$userid/$_id/$fareAmount');
//     if (response.statusCode == 200) {
//       var items = json.decode(response.body);
//       print("approve status${items}");
//       Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context) => Taxihome()));
//
//       Fluttertoast.showToast(
//         msg: "accepted",
//       );
//     } else {
//       Fluttertoast.showToast(
//         msg: "Error",
//       );
//     }
//   }
//
//   return SafeArea(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(height: 24.0),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Padding(
//               padding: EdgeInsets.only(left: 16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Hello,' + username.replaceAll('"', ''),
//                     style: TextStyle(
//                       fontSize: 24.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 16.0),
//                   Text(
//                     'Accept request and make profit !',
//                     style: TextStyle(
//                       fontSize: 16.0,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(right: 16.0),
//               child: CircleAvatar(
//                 backgroundImage: AssetImage("server/public/images/"+profilepic),
//                 radius: 30.0,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 24.0),
//         Padding(
//           padding: const EdgeInsets.only(left: 10.0, right: 10),
//           child: Container(
//             width: double.infinity,
//             height: 150,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               image: DecorationImage(
//                 image: AssetImage('images/banner.png'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 gradient: LinearGradient(
//                   begin: Alignment.bottomRight,
//                   colors: [
//                     Colors.black.withOpacity(.6),
//                     Colors.black.withOpacity(.6),
//                   ],
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: <Widget>[
//                   Text(
//                     "E-ride",
//                     style: TextStyle(
//                       color: Colors.green,
//                       fontSize: 35,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         SizedBox(height: 25.0),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16.0),
//           child: Container(
//             height: 5.0,
//             color: Colors.black87.withOpacity(0.8),
//           ),
//         ),
//         SizedBox(height: 25.0),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16.0),
//           child: Text(
//             "User Request",
//             style: TextStyle(
//               fontSize: 18.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         Expanded(
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 8.0),
//             child: Card(
//               color: Colors.green.withOpacity(0.5),
//               elevation: 0,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 side: BorderSide(
//                   color: Colors.grey.withOpacity(0.8),
//                   width: 1,
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 10.0, left: 5, right: 5, bottom: 10),
//                 child: FutureBuilder<List<TaxiModel>>(
//                   future: client.fetchtaxiride(),
//                   builder: (BuildContext context, AsyncSnapshot<List<TaxiModel>> snapshot) {
//                     if (snapshot.hasData) {
//                       return Flexible(
//                         child: ListView.builder(
//                           itemCount: snapshot.data!.length,
//                           itemBuilder: (context, index) {
//                             userid = snapshot.data![index].id;
//                             return Card(
//                               elevation: 4,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                               child: Column(
//                                 children: [
//                                   ListTile(
//                                     leading: CircleAvatar(
//                                       radius: 30,
//                                       backgroundImage: AssetImage(
//                                         "server/public/images/" + snapshot.data![index].profilepic,
//                                       ),
//                                     ),
//                                     title: Text(
//                                       snapshot.data![index].fname,
//                                       style: TextStyle(
//                                         fontSize: 18.0,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     subtitle: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         SizedBox(height: 4),
//                                         Text(
//                                           'Address: ${snapshot.data![index].address}',
//                                           style: TextStyle(
//                                             fontSize: 14.0,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         SizedBox(height: 5),
//                                         Text(
//                                           'Destination: ${snapshot.data![index].destination}',
//                                           style: TextStyle(
//                                             fontSize: 14.0,
//                                           ),
//                                         ),
//                                         SizedBox(height: 2),
//                                         Row(
//                                           children: [
//                                             Expanded(
//                                               child: Row(
//                                                 children: [
//                                                   Icon(
//                                                     Icons.calendar_today,
//                                                     size: 14,
//                                                     color: Colors.grey.withOpacity(0.8),
//                                                   ),
//                                                   SizedBox(width: 4),
//                                                   Expanded(
//                                                     child: Text(
//                                                       'Date: ${snapshot.data![index].Date}',
//                                                       style: TextStyle(
//                                                         fontSize: 14.0,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   SizedBox(width: 8),
//                                                   Icon(
//                                                     Icons.access_time,
//                                                     size: 14,
//                                                     color: Colors.grey.withOpacity(0.8),
//                                                   ),
//                                                   SizedBox(width: 4),
//                                                   Expanded(
//                                                     child: Text(
//                                                       'Time: ${snapshot.data![index].time}',
//                                                       style: TextStyle(
//                                                         fontSize: 14.0,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         TextFormField(
//                                           controller: _distance,
//                                           style: TextStyle(color: Colors.black, fontSize: 15),
//                                           decoration: InputDecoration(
//                                             border: OutlineInputBorder(
//                                               borderRadius: BorderRadius.circular(5),
//                                             ),
//                                             hintText: 'Distance/km',
//                                           ),
//                                         ),
//                                         SizedBox(height: 8),
//                                         Text(
//                                           'Amount of km: ${snapshot.data![index].pickup}',
//                                           style: TextStyle(fontSize: 16),
//                                         ),
//                                         SizedBox(height: 8),
//                                         Text(
//                                           'Estimated Fare:',
//                                           style: TextStyle(fontSize: 16),
//                                         ),
//                                         Text(
//                                           '\₹${snapshot.data![index].fareAmount}',
//                                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                                         ),
//                                         ElevatedButton(
//                                           onPressed: () {
//                                             // Replace the arguments with the actual distance and fare per km in your area.
//                                             calculateFare(
//                                               double.parse(_distance.text),
//                                               double.parse(snapshot.data![index].pickup.toString()),
//                                               snapshot.data![index], // Pass the current TaxiModel instance.
//                                             );
//                                           },
//                                           style: ElevatedButton.styleFrom(
//                                             primary: Colors.black,
//                                           ),
//                                           child: Text('Calculate Fare'),
//                                         ),
//                                       ],
//                                     ),
//                                     trailing: ElevatedButton(
//                                       onPressed: () {
//                                         approveUser(userid);
//                                       },
//                                       style: ElevatedButton.styleFrom(
//                                         primary: Colors.black,
//                                       ),
//                                       child: Text(
//                                         'Accept',
//                                         style: TextStyle(
//                                           fontSize: 12.0,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ),
//                                     onTap: () {
//                                       approveUser(mac);
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       );
//                     } else if (snapshot.hasError) {
//                       return Text('Error: ${snapshot.error}');
//                     }
//                     return Center(child: CircularProgressIndicator());
//                   },
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
