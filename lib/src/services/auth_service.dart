import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_autenticacion/services/firestore_service.dart';

class AuthService {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static dynamic signInWithEmail({String email, String password}) async {
    try {
      User user = (await _auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      return user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          print(
              "Su dirección de correo electrónico parece tener un formato incorrecto.");
          return ("Su dirección de correo electrónico parece tener un formato incorrecto.");
          break;
        case "wrong-password":
          print("Tu contraseña es incorrecta.");
          return ("Tu contraseña es incorrecta.");
          break;
        case "user-not-found":
          print("El usuario con este correo electrónico no existe.");
          return ("El usuario con este correo electrónico no existe.");
          break;
        case "user-disabled":
          print("El usuario con este correo electrónico ha sido inhabilitado.");
          break;
        case "too-many-requests":
          print("Demasiadas solicitudes. Vuelve a intentarlo más tarde.");
          break;
        case "operation-not-allowed":
          print(
              "Iniciar sesión con correo electrónico y contraseña no está habilitado.");
          return ("Iniciar sesión con correo electrónico y contraseña no está habilitado.");
          break;
        default:
          print("Ocurrió un error indefinido: " + e.code.toString());
          return ("Ocurrió un error indefinido: " + e.code.toString());
      }
    } catch (e) {
      print("ERROOOOR: " + e.toString());
      return ("ERROOOOR: " + e.toString());
    }
  }

  static Future<User> signInWithEmail2({String email, String password}) async {
    final User user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    return user;
  }

  static dynamic createUserWithEmail({String email, String password}) async {
    try {
      final User user = (await _auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
      return user;
      // FirestoreService().firestoreCreateUser(
      //     userId: user.uid,
      //     email: email,
      //     name: "Pedrito",
      //     lastname: "Perez Mellado");
      // return user;
    } on FirebaseAuthException catch (e) {
      //TODO FALTA PONER EXCEPCIONES CORRECTAS
      switch (e.code) {
        case "invalid-email":
          print(
              "Su dirección de correo electrónico parece tener un formato incorrecto.");
          break;
        case "email-already-in-use":
          print("correo electrónico ya en uso.");
          break;
        case "user-not-found":
          print("El usuario con este correo electrónico no existe.");
          break;
        case "user-disabled":
          print("El usuario con este correo electrónico ha sido inhabilitado.");
          break;
        case "too-many-requests":
          print("Demasiadas solicitudes. Vuelve a intentarlo más tarde.");
          break;
        case "operation-not-allowed":
          print(
              "Iniciar sesión con correo electrónico y contraseña no está habilitado.");
          break;
        default:
          print("Ocurrió un error indefinido: " + e.code.toString());
      }
    } catch (e) {
      print("ERROOOOR: " + e.toString());
    }
  }

  // static signInWithGoogle() async {
  //   GoogleSignIn googleSignIn = GoogleSignIn();
  //   final acc = await googleSignIn.signIn();
  //   final auth = await acc.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: auth.accessToken,
  //     idToken: auth.idToken
  //   );
  //   final res = await _auth.signInWithCredential(credential);
  //   return res.user;

  // }

  static Future<void> signOut() async {
    //GoogleSignIn().signOut();
    await _auth.signOut();

    // User user = _auth.currentUser;

    //   if (user != null) {
    //     print("---NO NULO---");
    //     FirebaseAuth.instance.signOut();
    //   } else {
    //     print("Nada");
    //   }

    //   if (_auth.currentUser != null) {
    //     print("te close");
    //     _auth.signOut();
    //   }

    //   print("close");
    //   _auth.signOut();
    //   return await _auth.signOut();
    // }
  }
}
