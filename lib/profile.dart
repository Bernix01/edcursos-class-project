import 'package:asistencia/user_provider.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String nombre = UserProvider.of(context).user.nombre;
    return Container(
      child: Center(
        child: Text(nombre),
      ),
    );
  }
}
