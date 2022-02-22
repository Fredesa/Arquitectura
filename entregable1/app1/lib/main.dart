// ignore_for_file: prefer_const_constructors

import 'package:app1/src/pages/confirmacion_page.dart';
<<<<<<< Updated upstream
import 'package:app1/src/pages/listarMascota_page.dart';
import 'package:app1/src/pages/menuPrincipal_page.dart';
=======
import 'package:app1/src/pages/ejemplo.dart';
>>>>>>> Stashed changes
import 'package:app1/src/pages/recorrido_page.dart';
import 'package:app1/src/pages/registroCompleto_page.dart';
import 'package:app1/src/pages/registroMascota_page.dart';
import 'package:app1/src/pages/registroPaseador_page.dart';
import 'package:app1/src/pages/ejemplo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:app1/src/pages/inicio_page.dart';
import 'package:app1/src/pages/registroUsuario_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

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
          ejemploPage.routeName: (BuildContext context) => ejemploPage(),
          inicioPage.routeName: (BuildContext context) => inicioPage(),
          listarMascotaPage.routeName: (BuildContext context) =>
              listarMascotaPage(),
          ejemploPage.routeName: (BuildContext context) => ejemploPage(),
          menuPrincipalPage.routeName: (BuildContext context) =>
              menuPrincipalPage(),
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
