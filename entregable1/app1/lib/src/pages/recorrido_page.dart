// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_final_fields, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';

class recorridoPage extends StatefulWidget {
  @override
  _recorridoPageState createState() => _recorridoPageState();
  static final String routeName = 'recorrido';
}

class _recorridoPageState extends State<recorridoPage> {
  String _nombrePaseador = "Daniel Perez";
  String _razasManejadas = "Criolla, Corgi, Husly ";
  String _horarioManejo = "Desde 09:00 hasta 18:00";
  String _actividades = "Pasear, Escuela de Trucos, Natacion";
  List<String> _mascotas = ["Firulais", "Pelusa"];
  String _hora = "";
  String _mascota = "Pelusa";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soliitar Paseo'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Solicitar Paseo'),
          onPressed: () => _mostrarConfirmacion(context),
          style: ElevatedButton.styleFrom(
              primary: Colors.orange, shape: StadiumBorder()),
        ),
      ),
    );
  }

  _mostrarConfirmacion(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text('Confirmacion'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://i.ibb.co/T0t8Zbr/hombre.jpg'),
                  radius: 50,
                ),
                SizedBox(height: size.height * 0.05),
                Text('A continuacion observara los datos del paseador :'),
                Text('Nombre del Paseador : $_nombrePaseador'),
                Text('Razas que maneja: $_razasManejadas'),
                Text('Horario : $_horarioManejo'),
                Text('Actividades que realiza : $_actividades'),
                SizedBox(height: size.height * 0.05),
                _escogerMascota(),
                SizedBox(height: size.height * 0.05),
                _escogerHora(),
                SizedBox(height: size.height * 0.05),
                Center(
                  child: SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          onPrimary: Colors.black,
                          primary: Colors.orange,
                          side: BorderSide(color: Colors.black),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Text(
                        'Confirmar Paseo',
                        style: TextStyle(fontSize: 24),
                      ),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(primary: Colors.orange[900]),
                child: Text('Confirmar'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                style: TextButton.styleFrom(primary: Colors.orange[900]),
                child: Text('Cancelar'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        });
  }

  Widget _escogerMascota() {
    return Center(
        child: SizedBox(
      width: 380,
      child: Column(children: <Widget>[
        InputDecorator(
          decoration: InputDecoration(
            labelStyle: TextStyle(
              color: Colors.orange[900],
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange),
              borderRadius: BorderRadius.circular(20.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange),
              borderRadius: BorderRadius.circular(20.0),
            ),
            hintText: 'Escoge tu mascota',
            labelText: 'Mascota',
            icon: Icon(Icons.select_all, color: Colors.orange[900]),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: _mascota,
              items: getOpcionesMascotas(),
              onChanged: (opci) {
                setState(() {
                  _mascota = opci.toString();
                });
              },
            ),
          ),
        )
      ]),
    ));
  }

  List<DropdownMenuItem<String>> getOpcionesMascotas() {
    List<DropdownMenuItem<String>> lista = [];
    _mascotas.forEach((mascota) {
      lista.add(DropdownMenuItem(
        child: Text(mascota),
        value: mascota,
      ));
    });
    return lista;
  }

  Widget _escogerHora() {
    return Center(
        child: SizedBox(
            width: 300,
            child: TextField(
              autofocus: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.orange[900],
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintText: '00:00',
                labelText: 'Hora de Paseo',
              ),
              onChanged: (valor) {
                setState(() {
                  _hora = valor;
                });
              },
            )));
  }
}
