import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FloatingActionButton(
        onPressed: () {
          print("pressed");
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("Pressed!"),
              duration: Duration(seconds: 2),
            ),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
