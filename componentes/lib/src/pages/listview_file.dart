import 'package:flutter/material.dart';
class ListaPage extends StatefulWidget {
  
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  List<int> listaNumeros = [1,2,3,4,5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),    
      ),
      body: _crearlista(),
    )
  }

  Widget _crearlista() {

  }
}