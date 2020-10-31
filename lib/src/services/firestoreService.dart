import 'package:cloud_firestore/cloud_firestore.dart';

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
