import 'package:asistencia/asistentes.dart';
import 'package:asistencia/stats.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  goToAsistentesDetalle(BuildContext context) {
    Navigator.of(context).pushNamed('/asistentes');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return Container(
              child: Column(
                children: <Widget>[
                  Asistentes(
                    cantidad: 23,
                    onTap: () {
                      goToAsistentesDetalle(context);
                    },
                  ),
                  Stats(),
                ],
              ),
            );
          } else {
            return Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Asistentes(
                      cantidad: 23,
                      onTap: () {
                        goToAsistentesDetalle(context);
                      },
                    ),
                    flex: 5,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stats(),
                    ),
                    flex: 10,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
