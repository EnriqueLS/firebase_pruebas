import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListarNegociosConStreamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("FIRESTORE")),
        body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('negocios').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError)
                return Center(child: Text('Error: ${snapshot.error}'));

              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());

              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot data = snapshot.data.documents[index];
                  return ListTile(
                    title: Text(data['name']),
                  );
                },
              );
            }));
  }
}
