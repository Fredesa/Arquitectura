// ignore_for_file: camel_case_types, use_key_in_widget_constructors, file_names, prefer_const_declarations, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class registroUsuarioPage extends StatefulWidget {
  @override
  _registroUsuarioPageState createState() => _registroUsuarioPageState();
  static final String routeName = 'registroUsuario';
}

class _registroUsuarioPageState extends State<registroUsuarioPage> {
  String? errorMessage;

  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final identificacionController = new TextEditingController();
  final telefonoController = new TextEditingController();
  final nombreController = new TextEditingController();
  final emailController = new TextEditingController();
  final direccionController = new TextEditingController();
  final passwordController = new TextEditingController();
  final password2Controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Registro Usuario'),
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
              _inputDireccion(),
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
                    emailController.text,
                    passwordController.text,
                  ),
                ),
              ))
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
              textInputAction: TextInputAction.next,
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
                  identificacionController.text = valor;
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
              controller: nombreController,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.text,
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
                  nombreController.text = valor;
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
              controller: telefonoController,
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
              textInputAction: TextInputAction.next,
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
                  telefonoController.text = valor;
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
              textInputAction: TextInputAction.next,
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
                  emailController.text = valor;
                });
              },
            )));
  }

  Widget _inputDireccion() {
    return Center(
        child: SizedBox(
            width: 300,
            child: TextFormField(
              autofocus: true,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
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
                hintText: 'Direccion Residencial',
                labelText: 'Direccion',
                icon: Icon(Icons.home, color: Colors.orange[900]),
              ),
              onChanged: (valor) {
                setState(() {
                  direccionController.text = valor;
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
              textInputAction: TextInputAction.next,
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
                  passwordController.text = valor;
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
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (password2Controller.text != passwordController.text) {
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
                  password2Controller.text = valor;
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
      "identificacion": identificacionController.text,
      "telefono": telefonoController.text,
      "nombre": nombreController.text,
      "email": emailController.text,
      "direccion": direccionController.text,
      "rol": "usuario"
    }).then((uid) => {
          Fluttertoast.showToast(msg: "Registro Exitoso"),
          Navigator.pushNamed(context, 'inicio'),
        });
  }
}

class seconderror {}
