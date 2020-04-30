import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List locais = [
    "Beira",
    "Maputo",
    "Curitiba",
    "Rio de Janeiro",
    "Lisboa",
    "Chimoio",
    "São Francisco",
    "Porto",
    "Whashigton"
  ];
  List<MaterialColor> cores = [
    Colors.orange,
    Colors.green,
    Colors.grey,
    Colors.red,
    Colors.indigo,
  ];
  String randomTexto = "";
MaterialColor randomCore = Colors.blue;


  void _atualizarTela() {
    setState(() {
      randomTexto = locais[new Random().nextInt(locais.length)];
      randomCore = cores[new Random().nextInt(cores.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: _atualizarTela,
              color: randomCore,
              child: Text('Clique!'),
            ),
            Text(
              '$randomTexto',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),

    );
  }
}
