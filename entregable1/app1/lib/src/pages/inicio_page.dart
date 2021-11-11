// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_declarations, camel_case_types

import 'package:flutter/material.dart';

class inicioPage extends StatefulWidget {
  @override
  _inicioPageState createState() => _inicioPageState();
  static final String routeName = 'inicio';
}

class _inicioPageState extends State<inicioPage> {
  String _identificacion = "";
  String _password = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: size.height * 0.05),
        Image(
          image: NetworkImage('https://i.ibb.co/d4mt0Lg/logo.png'),
          width: 250,
          height: 250,
        ),
        SizedBox(height: size.height * 0.05),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.orange,
              onPrimary: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              side: BorderSide(color: Colors.black),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          child: Text(
            'Ingresar',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () => _login(context),
        ),
        SizedBox(height: size.height * 0.05),
        ElevatedButton(
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
          onPressed: () => _registro(),
        )
      ],
    ));
  }

  _login(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Ingresar'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Divider(),
                _inputId(),
                Divider(),
                _inputPassword(),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                style: TextButton.styleFrom(primary: Colors.orange[900]),
                child: Text('Ingresar'),
                onPressed: () {
                  _inputUsuario();
                }),
          ],
        );
      },
    );
  }

  _registro() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Registro'),
          content: SingleChildScrollView(
              child: Center(
                  child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                      iconSize: 70,
                      color: Colors.orange[900],
                      tooltip: 'Registro Usuario',
                      onPressed: () {
                        Navigator.pushNamed(context, 'registroUsuario');
                      },
                      icon: Icon(Icons.face)),
                  SizedBox(width: 30),
                  IconButton(
                      iconSize: 70,
                      color: Colors.orange[900],
                      tooltip: 'Registro Paseador',
                      onPressed: () {
                        Navigator.pushNamed(context, 'registroPaseador');
                      },
                      icon: Icon(Icons.pets)),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Usuario'),
                  SizedBox(width: 50),
                  Text('Paseador')
                ],
              )
            ],
          ))),
        );
      },
    );
  }

  _inputId() {
    return TextField(
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
        hintText: 'Numero de Identificacion',
        labelText: 'Identificacion',
        icon: Icon(
          Icons.account_circle,
          color: Colors.orange[900],
        ),
      ),
      onChanged: (valor) {
        setState(() {
          _identificacion = valor;
        });
      },
    );
  }

  _inputPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.orange[900],
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Password',
        labelText: 'Password',
        icon: Icon(
          Icons.lock,
          color: Colors.orange[900],
        ),
      ),
      onChanged: (valor) {
        setState(() {
          _password = valor;
        });
      },
    );
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
                Text('Su password es : $_password'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                style: TextButton.styleFrom(primary: Colors.orange[900]),
                child: Text('cerrar'),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        );
      },
    );
  }
}
