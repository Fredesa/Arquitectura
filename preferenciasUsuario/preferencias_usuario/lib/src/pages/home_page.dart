import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/pages/setting_page.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
      ),
      drawer: _crearMenu(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color Secundario'),
          Divider(),
          Text('Genero'),
          Divider(),
          Text('Nombre Usuario')
        ],
      ),
    );
  }

  Drawer _crearMenu(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/menu-img.jpg'), fit: BoxFit.cover),
            )),
        ListTile(
          leading: Icon(
            Icons.pages,
            color: Colors.blue,
          ),
          title: Text('Home'),
          onTap: () =>
              Navigator.pushReplacementNamed(context, HomePage.routeName),
        ),
        ListTile(
          leading: Icon(
            Icons.people,
            color: Colors.blue,
          ),
          title: Text('people'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(
            Icons.party_mode,
            color: Colors.blue,
          ),
          title: Text('Party Mode'),
          onTap: () {},
        ),
        ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.blue,
            ),
            title: Text('Settings'),
            onTap: () => {
                  Navigator.pop(context),
                  Navigator.pushNamed(context, SettingPage.routeName)
                }),
      ]),
    );
  }
}
