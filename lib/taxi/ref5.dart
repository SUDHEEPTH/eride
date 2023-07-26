// import 'package:efoodtrain/Restaurant/assignorder.dart';
// import 'package:efoodtrain/Restaurant/manageboys.dart';
// import 'package:efoodtrain/Restaurant/restitem.dart';
// import 'package:efoodtrain/Restaurant/restnot.dart';
// import 'package:efoodtrain/Restaurant/restorder.dart';
// import 'package:efoodtrain/Restaurant/status.dart';
// import 'package:efoodtrain/deliveryboy/paymentstatus.dart';
// import 'package:efoodtrain/login.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class Resthome extends StatefulWidget {
//   const Resthome({Key? key}) : super(key: key);
//
//   @override
//   State<Resthome> createState() => _ResthomeState();
// }
//
// class _ResthomeState extends State<Resthome> {
//   @override
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Center(
//             child: Text(
//               "E-food train",
//               style: TextStyle(
//                   color: Colors.blueAccent,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//           actions: [
//             IconButton(
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => Restaurantnotifiaction()));
//               },
//               icon: Icon(Icons.notifications),
//               color: Colors.blueAccent,
//             ),
//             IconButton(
//               onPressed: ()async {
//
//                 SharedPreferences prefs = await SharedPreferences.getInstance();
//                 bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false; // Get isLoggedIn value, default to false if not found
//
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => Login()));
//               },
//               icon: Icon(Icons.logout),
//               color: Colors.blueAccent,
//             )
//           ],
//           backgroundColor: Colors.white,
//         ),
//         body: Column(
//           children: [
//             Container(
//                 width: double.infinity,
//                 height: 150,
//                 color: Colors.grey.withOpacity(0.5),
//                 child: Center(
//                   child: Text(
//                     "RITZY RESTAURANT",
//                     style: TextStyle(
//                       fontStyle: FontStyle.italic,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 24,
//                       color: Colors.black,
//                     ),
//                   ),
//                 )),
//             Padding(
//               padding: const EdgeInsets.all(30),
//               child: Container(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // Curved Square
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => Manageitem()));
//                       },
//                       child: Container(
//                         width: MediaQuery.of(context).size.width / 3.5,
//                         height: 100,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.rectangle,
//                           borderRadius: BorderRadius.circular(20),
//                           color: Colors.blueGrey[800],
//                         ),
//                         child: Center(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.food_bank_rounded,
//                                 size: 50,
//                                 color: Colors.white,
//                               ),
//                               Text(
//                                 'Manage items',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     // Curved Rectangle
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => ManageOrders()));
//                       },
//                       child: Container(
//                         width: MediaQuery.of(context).size.width / 1.9,
//                         height: 100,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.rectangle,
//                           borderRadius: BorderRadius.circular(20),
//                           color: Colors.blueGrey,
//                         ),
//                         child: Center(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.reorder,
//                                 size: 50,
//                                 color: Colors.white,
//                               ),
//                               Text(
//                                 'Manage order',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Curved Square
//                   SizedBox(width: 10),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => manageboys()));
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: Container(
//                         width: MediaQuery.of(context).size.width / 1.2,
//                         height: 100,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.rectangle,
//                           borderRadius: BorderRadius.circular(20),
//                           color: Colors.blueGrey[800],
//                         ),
//                         child: Center(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.boy_sharp,
//                                 size: 50,
//                                 color: Colors.white,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 10),
//                                 child: Text(
//                                   'Manage delivery boy',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   // Curved Rectangle
//                 ],
//               ),
//             ),
//             Container(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Curved Square
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => Deliverystatus()));
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: Container(
//                         width: MediaQuery.of(context).size.width / 3.5,
//                         height: 100,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.rectangle,
//                           borderRadius: BorderRadius.circular(20),
//                           color: Colors.blueGrey[800],
//                         ),
//                         child: Center(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.delivery_dining_outlined,
//                                 size: 50,
//                                 color: Colors.white,
//                               ),
//                               Text(
//                                 'Delivery status',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   // Curved Rectangle
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => Payments()));
//                     },
//                     child: Container(
//                       width: MediaQuery.of(context).size.width / 2.4,
//                       height: 100,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.rectangle,
//                         borderRadius: BorderRadius.circular(20),
//                         color: Colors.blueGrey,
//                       ),
//                       child: Center(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.payment_rounded,
//                               size: 50,
//                               color: Colors.white,
//                             ),
//                             Text(
//                               'Payment status',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ));
//   }
// }