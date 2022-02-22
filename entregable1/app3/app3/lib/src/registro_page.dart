import 'package:app3/src/menu_page.dart';
import 'package:app3/src/resetPassword_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({Key? key}) : super(key: key);

  @override
  _RegistroScreenState createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroPage> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController registroController = new TextEditingController();
  final TextEditingController ritmoController = new TextEditingController();
  final TextEditingController tensionController = new TextEditingController();
  final TextEditingController temperaturaController =
      new TextEditingController();

  // firebase
  final _auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance.collection("registroSalud");
  User? user = FirebaseAuth.instance.currentUser;

  // string for displaying the error Message
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    //email field
    DateTime now = DateTime.now();
    DateTime dia = new DateTime(now.year, now.month, now.day);
    DateTime hora = new DateTime(now.hour);

    final registroField = TextFormField(
        autofocus: false,
        controller: registroController,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Por favor describe tu estado de salud");
          }
        },
        onSaved: (value) {
          registroController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.health_and_safety),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Estado de salud",
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.deepPurple, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final temperaturaField = TextFormField(
        autofocus: false,
        controller: registroController,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Por favor escribe tu temperatura actual");
          }
        },
        onSaved: (value) {
          temperaturaController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.health_and_safety),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Temperatura",
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.deepPurple, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    Future<void> addRegistro() {
      return db.add({
        "idUsuario": user!.uid,
        "fechaCreacion": dia,
        "horaRegistro": now,
        "estadoSalud": registroController.text,
        "ritmoCardiaco": ritmoController.text,
        "tension": tensionController.text,
        'temperatura': temperaturaController.text
      }).then((uid) => {
            Fluttertoast.showToast(msg: "Registro Exitoso"),
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => menuPage())),
          });
    }

    final ritmoField = TextFormField(
        autofocus: false,
        controller: registroController,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Por favor escribe tu ritmo cardiado");
          }
        },
        onSaved: (value) {
          ritmoController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.health_and_safety),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Ritmo Cardiaco",
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.deepPurple, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final tensionField = TextFormField(
        autofocus: false,
        controller: registroController,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Por favor escribe tu tension actual");
          }
        },
        onSaved: (value) {
          tensionController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.health_and_safety),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Tension",
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.deepPurple, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
    final RegistroButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.deepPurple,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            addRegistro();
          },
          child: Text(
            "Registrar",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            );
          },
        ),
        title: Text("Estado de Salud"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 45),
                    Text(
                        "A continuacion por favor escriba el estado de salud en el que se encuentra en este momento"),
                    SizedBox(height: 45),
                    Text("Dia de Registro: ${dia}"),
                    SizedBox(height: 25),
                    Text("Hora de Registro: ${hora}"),
                    SizedBox(
                      height: 25,
                    ),
                    Text("Ingrese a continuacion su estado de salud"),
                    SizedBox(height: 35),
                    registroField,
                    SizedBox(
                      height: 45,
                    ),
                    RegistroButton,
                    SizedBox(height: 15),
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
