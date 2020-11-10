import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_pruebas/src/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 100.0),
              Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(hintText: "Enter email"),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(hintText: "Enter password"),
              ),
              const SizedBox(height: 10.0),
              RaisedButton(
                child: Text("Login"),
                onPressed: () async {
                  if (_emailController.text.isEmpty ||
                      _passwordController.text.isEmpty) {
                    print("Email and password cannot be empty");
                    return false;
                  }
                  try {
                    final User user = await AuthService.signInWithEmail2(
                        email: _emailController.text,
                        password: _passwordController.text);
                    print("----user----: " + user.uid);
                    //Logueado correctamente, vamos a HomePage
                  } on FirebaseAuthException catch (e) {
                    switch (e.code) {
                      case "invalid-email":
                        print(
                            "Su dirección de correo electrónico parece tener un formato incorrecto.");
                        //return ("Su dirección de correo electrónico parece tener un formato incorrecto.");
                        break;
                      case "wrong-password":
                        print("Tu contraseña es incorrecta.");
                        //return ("Tu contraseña es incorrecta.");
                        break;
                      case "user-not-found":
                        print(
                            "El usuario con este correo electrónico no existe.");
                        //return ("El usuario con este correo electrónico no existe.");
                        break;
                      case "user-disabled":
                        print(
                            "El usuario con este correo electrónico ha sido inhabilitado.");
                        break;
                      case "too-many-requests":
                        print(
                            "Demasiadas solicitudes. Vuelve a intentarlo más tarde.");
                        break;
                      case "operation-not-allowed":
                        print(
                            "Iniciar sesión con correo electrónico y contraseña no está habilitado.");
                        //return ("Iniciar sesión con correo electrónico y contraseña no está habilitado.");
                        break;
                      default:
                        print("Ocurrió un error indefinido: " +
                            e.code.toString());
                      //return ("Ocurrió un error indefinido: " + e.code.toString());
                    }
                  } catch (e) {
                    print("ERROOOOR: " + e.toString());
                    //return ("ERROOOOR: " + e.toString());
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
