import 'package:asistencia/frog.dart';
import 'package:asistencia/models/asistente.dart';
import 'package:flutter/material.dart';

class AsistentesDetallePage extends StatelessWidget {
  List<AsistenteModel> getAsistentesSync() {
    return [
      AsistenteModel(
        nombre: "Juan Perez",
        edad: "32 años",
        estaPresente: false,
      ),
      AsistenteModel(
        nombre: "Andres Perez",
        edad: "31 años",
        estaPresente: false,
      ),
      AsistenteModel(
        nombre: "Juan Pozo",
        edad: "20 años",
        estaPresente: false,
      ),
      AsistenteModel(
        nombre: "Juan Perez",
        edad: "32 años",
        estaPresente: true,
      ),
      AsistenteModel(
        nombre: "Juan Perez",
        edad: "32 años",
        estaPresente: true,
      ),
      AsistenteModel(
        nombre: "Juan Perez",
        edad: "32 años",
        estaPresente: true,
      ),
    ];
  }

  Future<List<AsistenteModel>> getAsistentesAsync() async {
    return Future.delayed(Duration(seconds: 3), () {
      return [
        AsistenteModel(
          nombre: "Juan Perez",
          edad: "32 años",
          estaPresente: false,
        ),
        AsistenteModel(
          nombre: "Andres Perez",
          edad: "31 años",
          estaPresente: false,
        ),
        AsistenteModel(
          nombre: "Juan Pozo",
          edad: "20 años",
          estaPresente: false,
        ),
        AsistenteModel(
          nombre: "Juan Perez",
          edad: "32 años",
          estaPresente: true,
        ),
        AsistenteModel(
          nombre: "Juan Perez",
          edad: "32 años",
          estaPresente: true,
        ),
        AsistenteModel(
          nombre: "Juan Perez",
          edad: "32 años",
          estaPresente: true,
        ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Asistentes"),
      ),
      body: FrogColor(
        color: Colors.blue,
        child: Container(
            child: FutureBuilder(
          future: getAsistentesAsync(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                // Esperando a que lleguen los datos
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case ConnectionState.done:
                // La espera terminó, verificamos que
                // existan datos y actualizamos la vista
                if (snapshot.hasData) {
                  // return ListView(
                  //   children: (snapshot.data as List<AsistenteModel>)
                  //       .map(asistenteWidget)
                  //       .toList(),
                  // );
                  List<AsistenteModel> datos =
                      snapshot.data as List<AsistenteModel>;

                  return ListView.builder(
                    itemCount: datos.length,
                    itemBuilder: (context, index) {
                      AsistenteModel asistente = datos[index];
                      return asistenteWidget(asistente, context);
                    },
                  );
                } else {
                  return Center(
                    child: Text("No se pudo cargar"),
                  );
                }
                break;
              default:
                return Center(child: Text("No se pudo cargar"));
            }
          },
        )),
      ),
    );
  }

  Widget asistenteWidget(AsistenteModel asistente, BuildContext context) {
    return Card(
      child: ListTile(
        selected: !asistente.estaPresente,
        onTap: () {
          Scaffold.of(context).showSnackBar(SnackBar(
            backgroundColor: FrogColor.of(context).color,
            content: Text(
                "El asistente ${asistente.nombre} ${asistente.estaPresente ? "asistio" : "no asistio"}"),
          ));
        },
        title: Text(asistente.nombre),
        subtitle: Text(asistente.edad),
        trailing: Icon(asistente.estaPresente
            ? Icons.check
            : Icons.airline_seat_individual_suite),
      ),
    );
  }
}
