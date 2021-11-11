// ignore_for_file: prefer_const_constructors

import 'package:app1/src/pages/confirmacion_page.dart';
import 'package:app1/src/pages/recorrido_page.dart';
import 'package:app1/src/pages/registroCompleto_page.dart';
import 'package:app1/src/pages/registroMascota_page.dart';
import 'package:app1/src/pages/registroPaseador_page.dart';
import 'package:flutter/material.dart';
import 'package:app1/src/pages/inicio_page.dart';
import 'package:app1/src/pages/registroUsuario_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Aplicacion',
        initialRoute: inicioPage.routeName,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.orange,
            titleTextStyle: TextStyle(color: Colors.black),
          ),
        ),
        routes: {
          inicioPage.routeName: (BuildContext context) => inicioPage(),
          registroUsuarioPage.routeName: (BuildContext context) =>
              registroUsuarioPage(),
          registroPaseadorPage.routeName: (BuildContext context) =>
              registroPaseadorPage(),
          registroMascotaPage.routeName: (BuildContext context) =>
              registroMascotaPage(),
          registroCompletoPage.routeName: (BuildContext context) =>
              registroCompletoPage(),
          confirmacionPage.routeName: (BuildContext context) =>
              confirmacionPage(),
          recorridoPage.routeName: (BuildContext context) => recorridoPage(),
        });
  }
}
