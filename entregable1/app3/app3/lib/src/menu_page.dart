import 'package:app3/src/enciclopedia_page.dart';
import 'package:app3/src/recordatorios_page.dart';
import 'package:app3/src/registro_page.dart';
import 'package:app3/src/tratamientos_page.dart';
import 'package:flutter/material.dart';

class menuPage extends StatelessWidget {
  const menuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TratamientoButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.deepPurple,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => tratamientoPage()));
          },
          child: Text(
            "Tratamientos",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    final RecordatorioButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.deepPurple,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => recordatorioPage()));
          },
          child: Text(
            "Recordatorios",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    final RegistroButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.deepPurple,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => RegistroPage()));
          },
          child: Text(
            "Registro de Estado de salud",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    final enciclopediaButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.deepPurple,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => enciclopediaPage()));
          },
          child: Text(
            "Enciclopedia",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout, color: Colors.deepPurple),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TratamientoButton,
                    SizedBox(height: 20),
                    RecordatorioButton,
                    SizedBox(height: 20),
                    RegistroButton,
                    SizedBox(height: 20),
                    enciclopediaButton,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
