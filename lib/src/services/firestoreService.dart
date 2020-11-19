import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_pruebas/src/modelos/negocio_model.dart';

Future<String> addUserFirestore(String _email, String _password, String _nombre,
    String _apellidos, int _telefono, int _saldo) async {
  try {
    await FirebaseFirestore.instance.collection("users").add({
      'negocioId': 'LSHUIHKLJJYHJ', //TODO: Falta añadir NegocioId automático
      'email': _email,
      'password': _password,
      'nombre': _nombre,
      'apellidos': _apellidos,
      'telefono': _telefono,
      'createdAt': FieldValue.serverTimestamp(),
      'saldo': _saldo,
      'activo': true
    });
    return "¡Usuario añadido correctamente a Firestore!";
  } catch (e) {
    return e.toString();
  }
}

String addUserFirestore2(String _email, String _password, String _nombre,
    String _apellidos, int _telefono, int _saldo) {
  FirebaseFirestore.instance.collection("users").add({
    'negocioId': 'LSHUIHKLJJYHJ', //TODO: Falta añadir NegocioId automático
    'email': _email,
    'password': _password,
    'nombre': _nombre,
    'apellidos': _apellidos,
    'telefono': _telefono,
    'createdAt': FieldValue.serverTimestamp(),
    'saldo': _saldo,
    'activo': true
  }).then((value) {
    print("¡Usuario añadido correctamente a Firestore!");
    return value.id;
  }).catchError((onError) {
    print("¡No se ha podido añadir usuario a Firestore!");
    print("Error: " + onError.toString());
    return onError;
  });
}

//Debo devolver el modelo de un negocio con sus datos Future<negocioModel>
//Falta crear el modelo y cargar el resultado de esta función
//El valor que le pasamos a la función es FirebaseAuth.instance.currentUser
Future<NegocioModel> getDatosNegocio(String _negocioId) async {
  NegocioModel negocio;
  DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
      .collection("negocios")
      .doc(_negocioId)
      .get();
  if (documentSnapshot.exists) {
    //Hacemos un return del modelo de negocio
    negocio = NegocioModel.fromFirestore(documentSnapshot);
    // print("1");
    // print(documentSnapshot.id);
    // print(documentSnapshot.data()["name"]);
    return negocio;
  } else {
    //Devolveriamos el modelo de negocio vacio porque no ha devuelto ninguno
    print("No existe este negocio.");
    return negocio;
  }
}

void getDatosNegocio2(String _negocioId) async {
  await FirebaseFirestore.instance
      .collection("negocios")
      .doc(_negocioId)
      .get()
      .then((documentSnapshot) {
    print("1");
    print(documentSnapshot.id);
    print("2");
    print(documentSnapshot.data());
    print("3");
    print(documentSnapshot.data()["name"]);
  }).catchError((onError) {
    //Devolveriamos el modelo de negocio vacio porque no ha devuelto ninguno
    print("No existe este negocio.");
    print(onError);
  });
}

void getDatosNegocioDeUsuario(String _clienteId) async {
  DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
      .collection("negocios")
      .doc("{negociosId}")
      .collection("users")
      .doc(_clienteId)
      .get();
  if (documentSnapshot.exists) {
    //hariamos un return del modelo de negocio
    print("1");
    print(documentSnapshot.id);
    print("2");
    print(documentSnapshot.data());
    print("3");
    print(documentSnapshot.data()["name"]);
  } else {
    //Devolveriamos el modelo de negocio vacio porque no ha devuelto ninguno
    print(
        "No pudimos obtener los datos del negocio referente a dicho usuario.");
  }
}

void getDatosNegocioDeUsuario2(String _clienteId) async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection("negocios")
      .where()
      // .doc("{negociosId}")
      // .collection("users")
      // .doc(_clienteId)
      .get();
  print("--------------------------");
  print(querySnapshot.docs.length);
  // if (documentSnapshot.exists) {
  //   //hariamos un return del modelo de negocio
  //   print("1");
  //   print(documentSnapshot.id);
  //   print("2");
  //   print(documentSnapshot.data());
  //   print("3");
  //   print(documentSnapshot.data()["name"]);
  // } else {
  //   //Devolveriamos el modelo de negocio vacio porque no ha devuelto ninguno
  //   print(
  //       "No pudimos obtener los datos del negocio referente a dicho usuario.");
  // }
}
