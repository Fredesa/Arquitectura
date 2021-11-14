import 'package:flutter/material.dart';

class start_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
          child: Image(
            image: NetworkImage('https://static.vecteezy.com/system/resources/previews/002/497/268/non_2x/cute-corgi-dog-smiling-over-wall-cartoon-vector.jpg')
          ),
        ),
        ]
         
      ),
  }
}