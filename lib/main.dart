import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightControle = TextEditingController();
  TextEditingController heightControle = TextEditingController();

  String _infoText = "Infome seus dados";

  void _resetField() {
    weightControle.text = "";
    heightControle.text = "";
    setState(() {
      _infoText = "Informe seus dados";
    });

  }

  void _calculate(){
    setState(() {
      double weight = double.parse(weightControle.text);
      double height = double.parse(heightControle.text) /100;
      double imc = weight / (height * height);
      if ( imc <= 18.6){
        _infoText = "Abaixo do peso(${imc.toStringAsPrecision(3)})";
      }else if(imc > 18.7 && imc <= 24.8) {
        _infoText = "Peso Normal(${imc.toStringAsPrecision(3)})";
      }else if(imc > 24.9 && imc <= 29.9) {
        _infoText = "Acima do peso(${imc.toStringAsPrecision(3)})";
      }else if(imc > 29.8 && imc <= 34.9) {
        _infoText = "Obesidade grau I(${imc.toStringAsPrecision(3)})";
      }else if(imc > 34.8 && imc <= 39.9) {
        _infoText = "Obesidade grau II(${imc.toStringAsPrecision(3)})";
      }else if(imc > 40) {
        _infoText = "Obesidade grau III(${imc.toStringAsPrecision(3)})";
      }
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora de IMC"),
          backgroundColor: Colors.deepPurpleAccent,
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.refresh), 
              onPressed: _resetField,
              )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.person_outline,
                size: 120,
                color: Colors.deepPurpleAccent,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Peso (Kg)',
                  labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                ),
                style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 25.0),
                textAlign: TextAlign.center,
                controller: weightControle,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Altura (Cm)',
                  labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                ),
                style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 25.0),
                textAlign: TextAlign.center,
                controller: heightControle,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: _calculate,
                    child: Text(
                      'Calcular',
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  _infoText,
                  style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ));
  }
}
