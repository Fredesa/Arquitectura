import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class enciclopediaPage extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
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
        title: Text("Enciclopedia"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('medicamentos').snapshots(),
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
                    title: Text(doc['nombre']),
                    trailing: Icon(Icons.keyboard_arrow_right,
                        color: Colors.deepPurple),
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
        title: Text(widget.post.get("nombre")),
        backgroundColor: Colors.deepPurple,
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
                  child: Text("Este medicamento posee la siguiente informacion",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      )),
                ),
                SizedBox(height: 100),
                Center(
                  child: Text("Laboratorio: ${widget.post.get("laboratorio")}",
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
                      "Forma farmaceutica: ${widget.post.get("formafarmaceutica")}",
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
                      "Via de administracion: ${widget.post.get("viaadministracion")}",
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
                      "Unidad de Medida: ${widget.post.get("unidadmedida")}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black54,
                        fontWeight: FontWeight.normal,
                      )),
                ),
                SizedBox(height: 35),
                Center(
                  child: Text("cantidad: ${widget.post.get("cantidad")}",
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
