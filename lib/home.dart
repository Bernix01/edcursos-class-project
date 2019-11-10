import 'package:asistencia/asistentes.dart';
import 'package:asistencia/stats.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return Container(
              child: Column(
                children: <Widget>[
                  Asistentes(cantidad: 23),
                  Stats(),
                ],
              ),
            );
          } else {
            return Container(
              child: Row(
                children: <Widget>[
                  Expanded(child: Asistentes(cantidad: 23), flex: 5,),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stats(),
                  ), flex: 10,),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
