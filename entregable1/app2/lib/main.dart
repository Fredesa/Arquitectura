import 'package:app2/src/pages/calendario_page.dart';
import 'package:app2/src/pages/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:app2/src/pages/inicio_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Aplicacion',
        debugShowCheckedModeBanner: false,
        initialRoute: inicioPage.routeName,
        routes: {
          inicioPage.routeName: (BuildContext context) => inicioPage(),
          menuPage.routeName: (BuildContext context) => menuPage(),
          calendarioPage.routeName: (BuildContext context) => calendarioPage(),
        });
  }
}
