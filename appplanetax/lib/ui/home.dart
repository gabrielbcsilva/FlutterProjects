import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int radioValor;
  String _nomePlaneta = "";
  final TextEditingController _controlePeso = new TextEditingController();
  bool selecaoValorA = true;
  bool selecaoValorB = false;
  bool selecaoValorC;
  bool switchValor = false;

  double _resultadoFinal = 0.0;

  void tomaContaValorRadio(int valor) {
    setState(() {
      radioValor = valor;
      switch (radioValor) {
        case 0:
          _resultadoFinal = calcularPesoEmPlaneta(_controlePeso.text, 0.06);
          _nomePlaneta =
              "O Seu Peso em Plutão é ${_resultadoFinal.toStringAsFixed(2)}";
          debugPrint(_nomePlaneta);
          break;
        case 1:
          _resultadoFinal = calcularPesoEmPlaneta(_controlePeso.text, 0.38);
          _nomePlaneta =
              "O Seu Peso em Marte é ${_resultadoFinal.toStringAsFixed(2)}";
          debugPrint(_nomePlaneta);
          break;
        case 2:
          _resultadoFinal = calcularPesoEmPlaneta(_controlePeso.text, 0.91);
          _nomePlaneta =
              "O Seu Peso em Vênus é ${_resultadoFinal.toStringAsFixed(2)}";
          debugPrint(_nomePlaneta);
          break;
        default:
          debugPrint("Nada foi selecionado");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Planeta X"),
        backgroundColor: Colors.black38,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(1.5),
          children: <Widget>[
            Image.asset(
              'assets/planet.png',
              height: 133.0,
              width: 200.0,
            ),
            Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _controlePeso,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'O Seu peso na terra',
                        hintText: 'Kg',
                        icon: Icon(Icons.person)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio<int>(
                          activeColor: Colors.brown,
                          value: 0,
                          groupValue: radioValor,
                          onChanged: tomaContaValorRadio),
                      Text(
                        "Plutão",
                        style: TextStyle(color: Colors.white30),
                      ),
                      Radio<int>(
                          activeColor: Colors.red,
                          value: 1,
                          groupValue: radioValor,
                          onChanged: tomaContaValorRadio),
                      Text(
                        "Marte",
                        style: TextStyle(color: Colors.white30),
                      ),
                      Radio<int>(
                        activeColor: Colors.orangeAccent,
                        value: 2,
                        groupValue: radioValor,
                        onChanged: tomaContaValorRadio,
                      ),
                      Text(
                        "Vênus",
                        style: TextStyle(color: Colors.white30),
                      )
                    ],
                  ),
                  //RESULTADO
                  Text(
                    _controlePeso.text.isEmpty
                        ? "Informe seu peso"
                        : _nomePlaneta + "Kg",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19.4,
                        fontWeight: FontWeight.w400,
                    height: 5 ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.blueGrey,
    );
  }

  double calcularPesoEmPlaneta(String peso, double gravidadeSuperficial) {
    if (int.parse(peso).toString().isNotEmpty && int.parse(peso) > 0) {
      return (int.parse(peso) * gravidadeSuperficial);
    } else {
      print("Numero Errado");
      return int.parse("180") * 0.38;
    }
  }
}
