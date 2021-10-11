import 'package:componentes/src/pages/Home_page.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routers/routes.dart';
//import 'package:componentes/src/pages/home_temp.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componenetes App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (setting) {
        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}
