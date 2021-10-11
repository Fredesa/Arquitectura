import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmdquAd5TIGts8kgmRSaY7YlTYJ_U1hGi7NQ&usqp=CAU'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child:
                CircleAvatar(child: Text('JA'), backgroundColor: Colors.white),
          )
        ],
      ),
    );
  }
}
