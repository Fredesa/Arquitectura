import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class listarMascotaPage extends StatelessWidget {
  static final String routeName = 'listarMascota';
  final db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            );
          },
        ),
        title: Text("Tus Mascotas"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db
            .collection('usuarios')
            .doc(user!.uid)
            .collection('mascotas')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return ListView(
              children: snapshot.data!.docs.map((doc) {
                return Card(
                  child: ListTile(
                    title: Text(doc['nombreMascota']),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                    ),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => detailPage(post: doc))),
                  ),
                );
              }).toList(),
            );
        },
      ),
    );
  }
}

class detailPage extends StatefulWidget {
  final DocumentSnapshot post;
  detailPage({required this.post});

  @override
  _detailPageState createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.get("nombreMascota")),
        centerTitle: true,
      ),
      body: Container(
        child: Card(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 35),
                Center(
                  child: Text("Esta es la informacion de tu mascota",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      )),
                ),
                SizedBox(height: 100),
                Center(
                  child: Text("Edad: ${widget.post.get("edadMascota")}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black54,
                        fontWeight: FontWeight.normal,
                      )),
                ),
                SizedBox(height: 35),
                Center(
                  child: Text("Raza: ${widget.post.get("razaMascota")}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black54,
                        fontWeight: FontWeight.normal,
                      )),
                ),
                SizedBox(height: 35),
                Center(
                  child: Text(
                      "Tipo de Caracter: ${widget.post.get("caracterMascota")}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black54,
                        fontWeight: FontWeight.normal,
                      )),
                ),
                SizedBox(height: 35),
                Center(
                  child: Text("Afeccion: ${widget.post.get("afeccionMascota")}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black54,
                        fontWeight: FontWeight.normal,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
