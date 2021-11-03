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
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          child: Text(
            'Login',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () => _mostrarLogin(context),
        ),
        SizedBox(height: size.height * 0.05),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          child: Text(
            'Registrarse',
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () => _mostrarRegistro(),
        ),
      ],
    ));
  }

  void _mostrarLogin(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Ingresar'),
                Divider(),
                _inputId(),
                Divider(),
                _inputPassword(),
                Divider(),
                _inputUsuario(),
              ],
            ),
            actions: <Widget>[
              TextButton(
                  child: Text('Ingresar'),
                  onPressed: () {
                    Navigator.pushNamed(context, 'menu');
                  }),
            ],
          );
        });
  }

  _mostrarRegistro() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            content: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Registro'), Divider()],
                ),
                _formUsuario(),
                Divider(),
                _formPaseador(),
              ],
            ),
            actions: <Widget>[
              TextButton(
                  child: Text('Ingresar'),
                  onPressed: () {
                    Navigator.pushNamed(context, 'menu');
                  }),
            ],
          );
        });
  }

  _inputId() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Numero de Identificacion',
        labelText: 'Identificacion',
        icon: Icon(Icons.account_circle),
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Password',
        labelText: 'Password',
        icon: Icon(Icons.lock),
      ),
      onChanged: (valor) {
        setState(() {
          _password = valor;
        });
      },
    );
  }

  _inputUsuario() {
    return ListTile(
      title: Text('El usuario es : $_identificacion'),
      subtitle: Text('Su password es : $_password'),
    );
  }

  _formUsuario() {
    return IconButton(
        icon: Icon(Icons.face),
        onPressed: () {
          Navigator.pushNamed(context, 'registroUsuario');
        });
  }

  _formPaseador() {
    return IconButton(
        icon: Icon(Icons.pets),
        onPressed: () {
          Navigator.pushNamed(context, 'registroPaseador');
        });
  }
}
