import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controlePeso = new TextEditingController();
  final TextEditingController _controleAltura = new TextEditingController();
  final TextEditingController _controleIdade = new TextEditingController();
  String resultado;

  void calculaPeso() {
    setState(() {
      double a = double.parse(_controleAltura.text);
      double p = double.parse(_controlePeso.text);
      int i = int.parse(_controleIdade.text);

      double imc = p / (a * a);
      if (imc < 18.5 && imc >0) {
        debugPrint("Option 1");
        resultado = "Você tem ${i} anos e está abaixo do Peso";
      } else if (imc > 18.4 && imc < 25.0) {
        debugPrint("Option 2");
        resultado = "Você tem ${i} anos e está com Peso ideal";
      } else if (imc > 24.9 && imc < 30.0) {
        debugPrint("Option 3");
        resultado = "Você tem ${i} anos e está Levemente acima do Peso";
      } else if (imc > 29.9 && imc < 35.0) {
        debugPrint("Option 4");
        resultado = "Você tem ${i} anos e está com Obesidade Grau 1";
      } else if (imc > 34.9 && imc < 40.0) {
        debugPrint("Option 5");
        resultado = "Você tem ${i} anos e está com Obesidade Grau 2";
      } else if (imc > 39.9) {
        debugPrint("Option 6");
        resultado = "Você tem ${i} anos e está com Obesidade Grau 3";
      } else{
        resultado = "Insira algum texto";
      }
    }

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Calcula IMC"),
        backgroundColor: Colors.pink,
      ),
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(3),
          children: <Widget>[
            Image.asset(
              'assets/imc_logo.png',
              height: 133.0,
              width: 200.0,
            ),
            Container(
                margin: const EdgeInsets.all(1.5),
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _controleIdade,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Idade', icon: Icon(Icons.person_outline)),
                    ),
                    TextField(
                      controller: _controleAltura,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Altura(m) ex: 0.0m (use ponto)', icon: Icon(Icons.archive)),
                    ),
                    TextField(
                        controller: _controlePeso,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Peso(KG)',
                            icon: Icon(Icons.add_shopping_cart))),
                    Center(
                      child: FlatButton(
                        onPressed: calculaPeso,
                        padding: EdgeInsets.all(10.0),
                        splashColor: Colors.pinkAccent,
                        color: Colors.pink,
                        textColor: Colors.white,
                        child: Text(
                          "Calcular",
                          style: TextStyle(fontSize: 19.0),
                        ),
                      ),
                    ),
                  ],
                )),
            //RESULTADO
            Center(
              child: Text(
                _controleIdade.text.isEmpty ? "Informe os dados a cima " : "$resultado" ,
                style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 19.4,
                  fontWeight: FontWeight.w700,
                  height: 5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
