import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get genero {
    return _prefs.getString('genero') ?? 'Masculino';
  }

  set genero(value) {
    _prefs.setString('genero', value);
  }

  get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(value) {
    _prefs.setBool('colorSecundario', value);
  }

  get nombre {
    return _prefs.getString('nombre') ?? '';
  }

  set nombre(value) {
    _prefs.setString('nombre', value);
  }
}
