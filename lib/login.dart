import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _userTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController =
      TextEditingController();

  bool _esValido = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/logo.png",
                width: 300,
                height: 300,
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: "Usuario"),
                      controller: _userTextEditingController,
                      onChanged: (string) {
                        setState(() {
                          _esValido = string.isNotEmpty &&
                              _passwordTextEditingController.text.isNotEmpty;
                        });
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Contraseña"),
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      controller: _passwordTextEditingController,
                      maxLength: 4,
                      onChanged: (string) {
                        setState(() {
                          _esValido = string.isNotEmpty &&
                              _userTextEditingController.text.isNotEmpty;
                        });
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                    ),
                    RaisedButton(
                      child: Text("Iniciar sesión"),
                      onPressed: _esValido
                          ? () {
                              Navigator.of(context).pushReplacementNamed('/home');
                            }
                          : null,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
