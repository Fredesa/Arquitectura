import 'package:flutter/material.dart';

class confirmacionPage extends StatelessWidget {
  static final String routeName = 'confirmacion';
  String _nombreMascota = "Firulais";
  String _razaMascota = "Criolla";
  String _barrioMascota = "Managua";
  String _horaMascota = "09:00";
  String _ActitudMascota = "Dosil";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmacion Paseo'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar Confirmacion'),
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
                      NetworkImage('https://i.ibb.co/PTM15Zv/perro.jpg'),
                  radius: 50,
                ),
                SizedBox(height: size.height * 0.05),
                Text(
                    'Se solicita paseo para una mascota con los siguientes datos :'),
                Text('Nombre : $_nombreMascota'),
                Text('Barrio: $_barrioMascota'),
                Text('Raza: $_razaMascota'),
                Text('Hora : $_horaMascota'),
                Text('Acitud de la Mascota : $_ActitudMascota')
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Confirmar'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text('Cancelar'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        });
  }
}
