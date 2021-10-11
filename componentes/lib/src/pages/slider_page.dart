import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool? _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            crearCheckBox(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la Imagen',
      value: _valorSlider,
      min: 10,
      max: 400,
      onChanged: (_bloquearCheck == true)
          ? null
          : (valor) {
              setState(() {
                _valorSlider = valor;
              });
            },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://i.picsum.photos/id/730/200/200.jpg?hmac=wK_2ZX79XZRP1wVJ-dW_r-OkOjiz1kK8eHIyTw2Lr6s'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget crearCheckBox() {
    return CheckboxListTile(
        title: Text('Bloquea Slider'),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor;
          });
        });
  }
}
