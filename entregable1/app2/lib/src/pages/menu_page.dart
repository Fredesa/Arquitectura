import 'package:flutter/material.dart';

class menuPage extends StatelessWidget {
  @override
  static final String routeName = 'menu';
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('RecordMed'),
        actions: <Widget>[
          Container(
              padding: EdgeInsets.all(10),
              child: IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () {
                    Navigator.pushNamed(context, 'inicio');
                  }))
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: size.height * 0.05),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ElevatedButton(
                  style: style,
                  child: Text('Recordatorio'),
                  onPressed: () {},
                ),
                SizedBox(height: size.height * 0.05),
                ElevatedButton(
                  style: style,
                  child: Text('Calendario'),
                  onPressed: () {
                    Navigator.pushNamed(context, 'calendario');
                  },
                ),
                SizedBox(height: size.height * 0.05),
                ElevatedButton(
                  style: style,
                  child: Text('Tratamiento'),
                  onPressed: () {},
                ),
                SizedBox(height: size.height * 0.05),
                ElevatedButton(
                  style: style,
                  child: Text('Diccionario de Medicamentos'),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
