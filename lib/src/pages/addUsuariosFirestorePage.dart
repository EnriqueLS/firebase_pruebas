import 'package:flutter/material.dart';
import 'package:firebase_pruebas/src/services/firestoreService.dart';

//TODO: COSAS QUE FALTAN:
//-Validar bien el formulario y textos explicativos
//-Recoger ID de Negocio para añadir a usuario dado de alta recogido de Auth
//-Devolver mensajes de respuesta al alta
//-Si la alta es correcta mostrar mensaje y volver a pantalla anterior
//-Actualizar ID de users con el que nos da el alta de Firebase Auth

class AddUsuariosFirestorePage extends StatefulWidget {
  @override
  _AddUsuariosFirestorePageState createState() =>
      _AddUsuariosFirestorePageState();
}

class _AddUsuariosFirestorePageState extends State<AddUsuariosFirestorePage> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _nombreController;
  TextEditingController _apellidosController;
  TextEditingController _telefonoController;
  TextEditingController _saldoController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "correo@gmail.com");
    _passwordController = TextEditingController(text: "123456789");
    _nombreController = TextEditingController(text: "Pedro");
    _apellidosController = TextEditingController(text: "Gomez Palas");
    _telefonoController = TextEditingController(text: "654987321");
    _saldoController = TextEditingController(text: "0");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 100.0),
            Text("Add User Firebase",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
            const SizedBox(height: 20.0),
            TextField(
                controller: _emailController,
                decoration: InputDecoration(hintText: "Enter email"),
                keyboardType: TextInputType.emailAddress),
            const SizedBox(height: 10.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(hintText: "Enter password"),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _nombreController,
              decoration: InputDecoration(hintText: "Enter Nombre"),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _apellidosController,
              decoration: InputDecoration(hintText: "Enter apellidos"),
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _telefonoController,
              decoration: InputDecoration(hintText: "Enter telefono"),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 10.0),
            TextField(
              controller: _saldoController,
              decoration: InputDecoration(hintText: "Saldo inicial"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10.0),
            RaisedButton(
              child: Text("Add"),
              onPressed: () async {
                if (_emailController.text.isEmpty ||
                    _passwordController.text.isEmpty ||
                    _nombreController.text.isEmpty ||
                    _apellidosController.text.isEmpty ||
                    _telefonoController.text.isEmpty) {
                  print("Email, password, etc... no pueden ser vacios");
                  return;
                }
                final String resultAddUser = await addUserFirestore(
                  _emailController.text,
                  _passwordController.text,
                  _nombreController.text,
                  _apellidosController.text,
                  int.parse(_telefonoController.text),
                  int.parse(_saldoController.text),
                );
                print("resultAddUser: " + resultAddUser);
              },
            )
          ],
        ),
      ),
    );
  }
}
