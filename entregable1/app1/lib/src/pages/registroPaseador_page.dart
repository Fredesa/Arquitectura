// ignore_for_file: camel_case_types, use_key_in_widget_constructors, file_names, prefer_const_declarations, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class registroPaseadorPage extends StatefulWidget {
  @override
  _registroPaseadorPageState createState() => _registroPaseadorPageState();
  static final String routeName = 'registroPaseador';
}

class _registroPaseadorPageState extends State<registroPaseadorPage> {
  String? errorMessage;

  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _identificacion = TextEditingController();
  final _telefono = TextEditingController();
  final _nombre = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _password2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Registro Paseador'),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Text(
                      'Registrarte',
                      style: TextStyle(fontSize: 24),
                    ),
                    onPressed: () => _inputUsuario(
                      _email.text,
                      _password.text,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget _inputId() {
    return Center(
        child: SizedBox(
            width: 300,
            child: TextFormField(
              autofocus: true,
              keyboardType: TextInputType.text,
              validator: (value) {
                RegExp regex = RegExp(r'^.{3,}$');
                if (value!.isEmpty) {
                  return ("First Name cannot be Empty");
                }
                if (!regex.hasMatch(value)) {
                  return ("Enter Valid name(Min. 3 Character)");
                }
                return null;
              },
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
                  _identificacion.text = valor;
                });
              },
            )));
  }

  Widget _inputNombre() {
    return Center(
        child: SizedBox(
            width: 300,
            child: TextFormField(
              autofocus: true,
              textCapitalization: TextCapitalization.sentences,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingresar tu nombre completo';
                }
                return null;
              },
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
                  _nombre.text = valor;
                });
              },
            )));
  }

  Widget _inputTelefono() {
    return Center(
        child: SizedBox(
            width: 300,
            child: TextFormField(
              autofocus: true,
              keyboardType: TextInputType.text,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^[0-9]*$')),
                LengthLimitingTextInputFormatter(10)
              ],
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingresar tu telefono';
                }
                return null;
              },
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
                  _telefono.text = valor;
                });
              },
            )));
  }

  Widget _inputEmail() {
    return Center(
        child: SizedBox(
            width: 300,
            child: TextFormField(
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return ("Por favor ingresa tu correo");
                }
                // reg expression for email validation
                if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                    .hasMatch(value)) {
                  return ("Por favor ingresa un correo valido");
                }
                return null;
              },
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
                  _email.text = valor;
                });
              },
            )));
  }

  Widget _inputPassword() {
    return Center(
        child: SizedBox(
            width: 300,
            child: TextFormField(
              obscureText: true,
              validator: (value) {
                RegExp regex = new RegExp(r'^.{6,}$');
                if (value!.isEmpty) {
                  return ("Password is required for login");
                }
                if (!regex.hasMatch(value)) {
                  return ("Enter Valid Password(Min. 6 Character)");
                }
              },
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
                  _password.text = valor;
                });
              },
            )));
  }

  Widget _inputPassword2() {
    return Center(
        child: SizedBox(
            width: 300,
            child: TextFormField(
              obscureText: true,
              validator: (value) {
                if (_password2.text != _password.text) {
                  return "Password don't match";
                }
                return null;
              },
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
                  _password2.text = valor;
                });
              },
            )));
  }

  Future<void> _inputUsuario(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((valor) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
          // ignore: invalid_return_type_for_catch_error
          return Future.error(seconderror());
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    await firebaseFirestore.collection("usuarios").doc(user!.uid).set({
      "uid": user.uid,
      "identificacion": _identificacion.text,
      "telefono": _telefono.text,
      "nombre": _nombre.text,
      "email": _email.text,
      "rol": "paseador"
    }).then((uid) => {
          Fluttertoast.showToast(msg: "Registro Exitoso"),
          Navigator.pushNamed(context, 'inicio'),
        });
  }
}

class seconderror {}
