import 'package:flutter/material.dart';

class Taxiac extends StatefulWidget {
  const Taxiac({super.key});

  @override
  State<Taxiac> createState() => _TaxiacState();
}

class _TaxiacState extends State<Taxiac> {
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

          )
        ],
      )
    );
  }
}
