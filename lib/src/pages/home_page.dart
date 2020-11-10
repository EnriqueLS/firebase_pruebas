import 'package:flutter/material.dart';
import 'package:firebase_pruebas/src/services/auth_service.dart';
//import 'package:firebase_auth/firebase_auth.dart';

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
          body: Center(
              child: Text(
            "HomePage",
            style: TextStyle(fontSize: 30.0),
          ))),
    );
  }
}
