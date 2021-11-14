// ignore_for_file: camel_case_types, use_key_in_widget_constructors, file_names, prefer_const_declarations, prefer_const_constructors

import 'package:flutter/material.dart';

class registroPaseadorPage extends StatefulWidget {
  @override
  _registroPaseadorPageState createState() => _registroPaseadorPageState();
  static final String routeName = 'registroPaseador';
}

class _registroPaseadorPageState extends State<registroPaseadorPage> {
  String _identificacion = "";
  String _telefono = "";
  String _nombre = "";
  String _email = "";
  String _password = "";
  String _password2 = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro Paseador'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        children: [
          _inputId(),
          SizedBox(height: size.height * 0.02),
          _inputNombre(),
          SizedBox(height: size.height * 0.02),
          _inputTelefono(),
          SizedBox(height: size.height * 0.02),
          _inputEmail(),
          SizedBox(height: size.height * 0.02),
          _inputPassword(),
          SizedBox(height: size.height * 0.02),
          _inputPassword2(),
          SizedBox(height: size.height * 0.02),
          Center(
            child: SizedBox(
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    onPrimary: Colors.black,
                    primary: Colors.orange,
                    side: BorderSide(color: Colors.black),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Text(
                  'Registrarte',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () => _inputUsuario(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _inputId() {
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
                hintText: 'Identificacion del Usuario',
                labelText: 'Identificacion',
                icon: Icon(Icons.account_circle, color: Colors.orange[900]),
              ),
              onChanged: (valor) {
                setState(() {
                  _identificacion = valor;
                });
              },
            )));
  }

  Widget _inputNombre() {
    return Center(
        child: SizedBox(
            width: 300,
            child: TextField(
              autofocus: true,
              textCapitalization: TextCapitalization.sentences,
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
                hintText: 'Nombre del Usuario',
                labelText: 'Nombre',
                icon: Icon(Icons.account_circle, color: Colors.orange[900]),
              ),
              onChanged: (valor) {
                setState(() {
                  _nombre = valor;
                });
              },
            )));
  }

  Widget _inputTelefono() {
    return Center(
        child: SizedBox(
            width: 300,
            child: TextField(
              autofocus: true,
              keyboardType: TextInputType.phone,
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
                hintText: 'Telefono Celular',
                labelText: 'Telefono',
                icon: Icon(Icons.phone, color: Colors.orange[900]),
              ),
              onChanged: (valor) {
                setState(() {
                  _telefono = valor;
                });
              },
            )));
  }

  Widget _inputEmail() {
    return Center(
        child: SizedBox(
            width: 300,
            child: TextField(
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
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
                hintText: 'Correo Electronico',
                labelText: 'Correo',
                icon: Icon(Icons.alternate_email, color: Colors.orange[900]),
              ),
              onChanged: (valor) {
                setState(() {
                  _email = valor;
                });
              },
            )));
  }

  Widget _inputPassword() {
    return Center(
        child: SizedBox(
            width: 300,
            child: TextField(
              obscureText: true,
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
                hintText: 'Contraseña',
                labelText: 'Contraseña',
                icon: Icon(Icons.lock, color: Colors.orange[900]),
              ),
              onChanged: (valor) {
                setState(() {
                  _password = valor;
                });
              },
            )));
  }

  Widget _inputPassword2() {
    return Center(
        child: SizedBox(
            width: 300,
            child: TextField(
              obscureText: true,
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
                hintText: 'Repetir Contraseña',
                labelText: 'Repetir Contraseña',
                icon: Icon(Icons.lock, color: Colors.orange[900]),
              ),
              onChanged: (valor) {
                setState(() {
                  _password2 = valor;
                });
              },
            )));
  }

  _inputUsuario() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Datos'),
                Text('El usuario es : $_identificacion'),
                Text('El telefono del usuario es : $_telefono'),
                Text('El nombre del usuario es : $_nombre'),
                Text('El correo del usuario es : $_email'),
                Text('Su password es : $_password'),
                Text('La repeticion de su password es : $_password2')
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                style: TextButton.styleFrom(primary: Colors.orange[900]),
                child: Text('Registrarse'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, 'registroCompleto');
                }),
          ],
        );
      },
    );
  }
}
