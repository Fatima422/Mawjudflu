
import 'package:flutter/material.dart';

class indoormap extends StatelessWidget {
  final String data;
  
 indoormap({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Another Page'),
      ),
      body: Center(
        child: Text('Received data: $data'),
      ),
    );
  }
}