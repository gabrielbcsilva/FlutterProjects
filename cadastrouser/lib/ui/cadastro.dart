import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _usuarioController = new TextEditingController();

  final TextEditingController _senhaController = new TextEditingController();
  String _bemvindo = "";

  void _mostraBemVindo() {
    setState(() {
      if (_usuarioController.text.isEmpty && _senhaController.text.isEmpty) {
          _bemvindo = _usuarioController.text;
      }
    });
  }

  void _cancelar() {
    setState(() {
      _usuarioController.clear();
      _senhaController.clear();
      _bemvindo = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro Usuário", textAlign: TextAlign.center),
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.white10,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            Image.asset(
              "assets/face.png",
              width: 90.0,
              height: 90.0,
              color: Colors.red,
            ),
            //Formulario
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _usuarioController,
                      decoration: InputDecoration(
                          hintText: 'Nome',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11.5)),
                          icon: Icon(Icons.person)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _senhaController,
                      decoration: InputDecoration(
                          hintText: 'Senha',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11.5)),
                          icon: Icon(Icons.person)),
                      obscureText: true,
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //Entrar
                        Container(
                          child: RaisedButton(
                            onPressed: _mostraBemVindo,
                            color: Colors.red,
                            child: Text(
                              "Entrar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.9,
                              ),
                            ),
                          ),
                        ),
                        //CANCELAR
                        Container(
                          child: RaisedButton(
                            onPressed: _cancelar,
                            color: Colors.red,
                            child: Text(
                              "Cancelar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.9,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    " Olá : $_bemvindo",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 19.6,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
