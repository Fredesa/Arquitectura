import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class recordatorioPage extends StatelessWidget {
  final d1 = FirebaseFirestore.instance.collection("Recordatorios");
  final d2 = FirebaseFirestore.instance.collection("medicamentos");

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
        title: Text("Recordatorios"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: d1.snapshots(),
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
                    title: Text(doc["idMedicamento"]),
                    subtitle: Text("Se debe tomar en ${doc["hora"]} horas"),
                  ),
                );
              }).toList(),
            );
        },
      ),
    );
  }
}
