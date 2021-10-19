import 'package:flutter/material.dart';
import 'package:app2/src/pages/inicio_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Aplicacion',
        initialRoute: inicioPage.routeName,
        routes: {
          inicioPage.routeName: (BuildContext context) => inicioPage(),
        });
  }
}
