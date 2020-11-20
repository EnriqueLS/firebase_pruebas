import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NegocioModel {
  final String id;
  final String nombre;
  final String email;
  final DateTime creadoEn;
  final String nombreResponsable;
  final String imageUrl;

  NegocioModel(
      {@required this.id,
      @required this.nombre,
      @required this.email,
      @required this.creadoEn,
      @required this.nombreResponsable,
      @required this.imageUrl});

  factory NegocioModel.fromFirestore(DocumentSnapshot doc) {
    var data = doc.data();

    return NegocioModel(
        id: doc.id,
        nombre: data['nombre'],
        email: data['email'],
        creadoEn: data['CreateAt'],
        nombreResponsable: data['nombreResponsable'],
        imageUrl: data['imageUrl']);
  }
}
