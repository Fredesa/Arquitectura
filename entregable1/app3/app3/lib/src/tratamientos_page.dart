import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class tratamientoPage extends StatelessWidget {
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
        title: Text("Tratamientos"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('tratamientos').snapshots(),
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
                            builder: (context) =>
                                detailTratamientoPage(post: doc))),
                  ),
                );
              }).toList(),
            );
        },
      ),
    );
  }
}

class detailTratamientoPage extends StatefulWidget {
  final DocumentSnapshot post;
  detailTratamientoPage({required this.post});

  @override
  _detailTratamientoScreenState createState() =>
      _detailTratamientoScreenState();
}

class _detailTratamientoScreenState extends State<detailTratamientoPage> {
  String? nombre;

  @override
  void initState() {
    super.initState();
    String? id = widget.post.get("idMedicamento");
    FirebaseFirestore.instance
        .collection("medicamentos")
        .doc(id)
        .get()
        .then((value) {
      this.nombre = value.get("nombre");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.get("nombre")),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
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
                  child: Text("Este tratamiento posee la siguiente informacion",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      )),
                ),
                SizedBox(height: 100),
                Center(
                  child: Text("Medicamento: ${nombre}",
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
                      "Tiempo entre cada dosis: ${widget.post.get("Dosis")} horas",
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
                      "Via de administracion: ${widget.post.get("tipoAdministracion")}",
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
                      "Fecha de Inicio del tratamiento: ${widget.post.get("fechaInicio")}",
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
                      "Fecha de Finalizacion del tratamiento: ${widget.post.get('fechaFin')}",
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
