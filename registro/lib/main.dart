import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Formulario de Registro'),
        ),
        body: Formulario(),
      ),
    );
  }
}

class Formulario extends StatefulWidget {
  @override
  MyForm createState() {
    return MyForm();
  }
}

class MyForm extends State<Formulario> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nombre',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingresa tu nombre';
                }
              },
            ),
            Divider(),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Apellido',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingresa tu apellido';
                }
              },
            ),
            Divider(),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Correo',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingresa tu correo';
                }
              },
            ),
            Divider(),
            TextFormField(
              controller: _pass,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Contraseña',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingresa tu contraseña';
                }
              },
            ),
            Divider(),
            TextFormField(
              controller: _confirmPass,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: ' Confirma tu contraseña',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor vuelve a ingresar tu contraseña';
                }
                if (value != _pass.text) {
                  return 'Las contraseñas no coinciden';
                }
              },
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Confirmacion'),
                        content: const Text(
                            'El usuario ha sido registrado correctamente'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
