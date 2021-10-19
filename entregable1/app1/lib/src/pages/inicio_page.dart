import 'package:flutter/material.dart';

class inicioPage extends StatelessWidget {
  static final String routeName = 'inicio';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: size.height * 0.05),
        Image(
          image: NetworkImage('https://i.ibb.co/d4mt0Lg/logo.png'),
          width: 250,
          height: 250,
        ),
        SizedBox(height: size.height * 0.05),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          child: Text(
            'Button',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () {},
        )
      ],
    ));
  }
}
