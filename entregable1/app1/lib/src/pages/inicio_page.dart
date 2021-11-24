// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_declarations, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class inicioPage extends StatefulWidget {
  @override
  _inicioPageState createState() => _inicioPageState();
  static final String routeName = 'inicio';
}

class _inicioPageState extends State<inicioPage> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final b1 = FirebaseFirestore.instance;
  String? errorMessage;

  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
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
    ))));
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
            child: Form(
              key: _formKey,
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
          ),
          actions: <Widget>[
            TextButton(
                style: TextButton.styleFrom(primary: Colors.orange[900]),
                child: Text('Ingresar'),
                onPressed: () {
                  signIn(emailController.text, passwordController.text);
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
    return TextFormField(
      autofocus: true,
      controller: emailController,
      textCapitalization: TextCapitalization.sentences,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
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
        icon: Icon(
          Icons.account_circle,
          color: Colors.orange[900],
        ),
      ),
      onChanged: (valor) {
        setState(() {
          emailController.text = valor;
        });
      },
    );
  }

  _inputPassword() {
    return TextFormField(
      obscureText: true,
      controller: passwordController,
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
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Contraseña',
        labelText: 'Contraseña',
        icon: Icon(
          Icons.lock,
          color: Colors.orange[900],
        ),
      ),
      onChanged: (valor) {
        setState(() {
          passwordController.text = valor;
        });
      },
    );
  }

  _inputUsuario() {
    Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {},
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.pushNamed(context, 'menuPrincipal')
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
}

// class login extends StatefulWidget {
//   @override
//   _loginState createState() => _loginState();
// }

// class _loginState extends State<login> {
//   User? user = FirebaseAuth.instance.currentUser;
//   @override
//   void initState() {
//     super.initState();
//     FirebaseFirestore.instance
//         .collection("usuarios")
//         .doc(user!.uid)
//         .get()
//         .then((value) {
//       print(value);
//       if (value.get('rol') == 'usuario' && value.get('idMascota') == "") {
//         Navigator.pushNamed(context, 'registroCompleto');
//       } else if (value.get('rol') == 'usuario') {
//         Navigator.pushNamed(context, 'menuUsuario');
//       } else if (value.get('rol') == 'paseador' && value.get('')) {
//         Navigator.pushNamed(context, 'menuPaseador');
//       }

//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
