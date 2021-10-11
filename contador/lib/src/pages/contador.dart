import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContadorPageState();
  }
}

class _ContadorPageState extends State<ContadorPage> {
  final estiloLetra = new TextStyle(fontSize: 25);
  int _contador = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Titulo'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Numero de Clicks',
                style: estiloLetra,
              ),
              Text(
                '$_contador',
                style: estiloLetra,
              ),
            ],
          ),
        ),
        floatingActionButton: _crearBotones());
  }

  Widget _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 30.0,
        ),
        FloatingActionButton(
            child: Icon(Icons.exposure_zero), onPressed: _iniciar),
        Expanded(child: SizedBox()),
        FloatingActionButton(child: Icon(Icons.remove), onPressed: _restar),
        SizedBox(
          width: 30.0,
        ),
        FloatingActionButton(child: Icon(Icons.add), onPressed: _sumar),
      ],
    );
  }

  void _sumar() {
    setState(() {
      _contador++;
    });
  }

  void _restar() {
    setState(() {
      _contador--;
    });
  }

  void _iniciar() {
    setState(() {
      _contador = 0;
    });
  }
}
