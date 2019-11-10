import 'package:flutter/material.dart';

class MyContent extends StatelessWidget {
  const MyContent({
    Key key,
    @required int counter,
  })  : _counter = counter,
        super(key: key);

  final int _counter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Expanded(
                child: Container(
                  color: Colors.amber,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        '$_counter',
                        style: Theme.of(context).textTheme.display1,
                      ),
                      Text(
                        '$_counter',
                        style: Theme.of(context).textTheme.display1,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Text("ANUNCIO PUBLICITARIO")
      ],
    );
  }
}
