import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class recordatorioPage extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  ),
                );
              }).toList(),
            );
        },
      ),
    );
  }
}
