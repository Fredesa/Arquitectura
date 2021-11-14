import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/share_prefs/preferencias_usuario.dart';
import 'package:preferencias_usuario/src/widgets/menu_widget.dart';

class SettingPage extends StatefulWidget {
  static final String routeName = 'setting';

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _colorSecundario = true;
  String? _genero;
  String _nombre = 'Pedro Perez';
  TextEditingController? _textController;
  final prefs = new PreferenciasUsuario();
  @override
  void initState() {
    super.initState();
    _genero = prefs.genero;
    _nombre = prefs.nombre;
    _textController = new TextEditingController(text: prefs.nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ajustes'),
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SwitchListTile(
              value: _colorSecundario,
              title: Text('Color secundario'),
              onChanged: (value) {
                setState(() {
                  _colorSecundario = value;
                });
              },
            ),
            Divider(),
            RadioListTile<String>(
              title: const Text('Femenino'),
              value: 'Femenino',
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            RadioListTile<String>(
              title: const Text('Masculino'),
              value: 'Masculino',
              groupValue: _genero,
              onChanged: _setSelectedRadio,
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre del propietario',
                ),
                onChanged: (value) {
                  prefs.nombre = value;
                },
              ),
            ),
          ],
        ));
  }

  _setSelectedRadio(String? value) async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.setString('genero', value!);
    prefs.genero = value;
    _genero = value;
    setState(() {});
  }
}
