import 'package:flutter/material.dart';
import 'package:firebase_pruebas/src/services/auth_service.dart';
import 'package:firebase_pruebas/src/services/firestoreService.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_pruebas/src/modelos/negocio_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: const Icon(Icons.delete),
                tooltip: 'Close',
                onPressed: () {
                  print("Cierre de sesión");
                  AuthService.signOut();
                },
              ),
            ],
          ),
          body: BodyPage()),
    );
  }
}

class BodyPage extends StatefulWidget {
  BodyPage({Key key}) : super(key: key);

  @override
  _BodyPageState createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  NegocioModel negocioModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<NegocioModel>(
            future: getDatosNegocio("k8xbQOKHZq12843PhcSn"),
            builder:
                (BuildContext context, AsyncSnapshot<NegocioModel> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Text('Loading....');
                default:
                  if (snapshot.hasError)
                    return Text('Error: ${snapshot.error}');
                  else
                    return Text('Result: ${snapshot.data.email}');
              }
            },
          ),
          SizedBox(height: 20.0),
          Text(
            "HomePage",
            style: TextStyle(fontSize: 30.0),
          ),
          SizedBox(height: 20.0),
          RaisedButton(
            child: Text("Acción"),
            onPressed: () async {
              //print("---1---");
              //await getDatosNegocioDeUsuario("dI7zQbPqDDxOhSXu1AXK");
              //print("---2---");
            },
          )
        ],
      ),
    );
  }
}
