import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/pages/setting_page.dart';
import 'package:preferencias_usuario/src/share_prefs/preferencias_usuario.dart';
import 'package:preferencias_usuario/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario: ${prefs.colorSecundario} '),
          Divider(),
          Text('Genero: ${prefs.genero}'),
          Divider(),
          Text('Nombre usuario: ${prefs.nombre}'),
          Divider(),
        ],
      ),
    );
  }
}
