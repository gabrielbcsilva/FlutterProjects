import 'package:flutter/material.dart';

class MagnataFul extends StatefulWidget {
  @override
  _MagnataFulState createState() => _MagnataFulState();
}

class _MagnataFulState extends State<MagnataFul> {
  int _contadorGrana = 0;

  void _mandaGrana() {
    setState(() {
      //Responsável pela atualização da tela com valores
      _contadorGrana = _contadorGrana + 50;
    });
  }

  Color _mudaCor() {
    if (_contadorGrana >= 1000) {
      return Colors.blue;
    } else if (_contadorGrana == 0) {
      return Colors.red;
    }

    return Colors.lightGreen;
  }

  void _deixaPobre() {
    setState(() {
      //Responsável pela atualização da tela com valores
      _contadorGrana = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maganata"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Container(
        child: Column(children: <Widget>[
          //Titulo
          Center(
              child: Text(
            "Fique Rico \$",
            style: TextStyle(
                color: Colors.lightGreen,
                fontWeight: FontWeight.w700,
                fontSize: 29.9,
                height: 3.0),
          )),
          Expanded(
            child: Center(
              child: Text(
                "\$ $_contadorGrana",
                style: TextStyle(
                    fontSize: 45.6,
                    color: _mudaCor(),
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Center(
            child: FlatButton(
              onPressed: _mandaGrana,
              color: Colors.lightGreen,
              textColor: Colors.white,
              child: Text(
                "Mais Grana",
                style: TextStyle(fontSize: 19.9),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: FlatButton(
                onPressed: _deixaPobre,
                color: Colors.redAccent,
                textColor: Colors.white,
                child: Text(
                  "Perder Tudo",
                  style: TextStyle(fontSize: 19.9),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
