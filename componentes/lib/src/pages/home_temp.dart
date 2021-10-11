import 'package:flutter/material.dart';

class HomePageTempt extends StatelessWidget {
  final lista = ['Opcion 1', 'Opcion 2', 'Opcion 3', 'Opcion 4'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes temporales'),
      ),
      body: ListView(
        children: _crearItems(),
      ),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> list = [];
    for (String opc in lista) {
      final tempWidget = ListTile(
        title: Text(opc),
      );
      list.add(tempWidget);
      list.add(Divider());
    }
    return list;
  }

  List<Widget> _crearItems2() {
    return lista.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('Seleccione'),
            leading: Icon(Icons.account_box),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider(),
        ],
      );
    }).toList();
  }
}
