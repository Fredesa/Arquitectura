import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final estiloLetra = new TextStyle(fontSize: 25);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Numero de Clicks',
              style: estiloLetra,
            ),
            Text(
              '0',
              style: estiloLetra,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print('Suma uno');
        },
      ),
    );
  }
}
