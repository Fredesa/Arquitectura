import 'package:flutter/material.dart';

class menuPrincipalPage extends StatelessWidget {
  static final String routeName = 'menuPrincipal';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Principal'),
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  onPrimary: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  side: BorderSide(color: Colors.black),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Text(
                'Registrar Mascota',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () => Navigator.pushNamed(context, 'registroMascota'),
            ),
            SizedBox(height: size.height * 0.02),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  onPrimary: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  side: BorderSide(color: Colors.black),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Text(
                'Completar Registro Paseador',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () => Navigator.pushNamed(context, 'registroCompleto'),
            ),
            SizedBox(height: size.height * 0.02),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  onPrimary: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  side: BorderSide(color: Colors.black),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Text(
                'Mostrar Mapa',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () => Navigator.pushNamed(context, 'ejemplo'),
            ),
            SizedBox(height: size.height * 0.02),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  onPrimary: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  side: BorderSide(color: Colors.black),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Text(
                'Solicitar Recorrido',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () => Navigator.pushNamed(context, 'recorrido'),
            )
          ]),
    );
  }
}
