import 'package:flutter/material.dart';

class UserModel {
  final String nombre;
  final bool esInstructor;

  const UserModel({
    @required this.nombre,
    @required this.esInstructor,
  });
}
