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
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _infoText = "Informe seus dados!";

  void _resetFields() {
    // Clean up the controller
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "Informe seus dados!";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      print(imc);
      if (imc < 16) {
        _infoText =
            "Seu IMC: ${imc.toStringAsPrecision(3)} \n Classificação: Magreza Grau III";
      } else if (imc < 16.9) {
        _infoText =
            "Seu IMC: ${imc.toStringAsPrecision(3)} \n Classificação: Magreza Grau II";
      } else if (imc < 18.4) {
        _infoText =
            "Seu IMC: ${imc.toStringAsPrecision(3)} \n Classificação: Magreza Grau I";
      } else if (imc < 24.9) {
        _infoText =
            "Seu IMC: (${imc.toStringAsPrecision(3)} \n Classificação: Adequado";
      } else if (imc < 29.9) {
        _infoText =
            "Seu IMC: ${imc.toStringAsPrecision(3)} \n Classificação: Pré-Obeso";
      } else if (imc < 34.9) {
        _infoText =
            "Seu IMC: ${imc.toStringAsPrecision(3)} \n Classificação: Obesidade Grau I";
      } else if (imc < 39.9) {
        _infoText =
            "Seu IMC: ${imc.toStringAsPrecision(3)} \n Classificação: Obesidade Grau II";
      } else {
        _infoText =
            "Seu IMC: ${imc.toStringAsPrecision(3)} | Classificação: Obesidade Grau III";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent.shade700,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _resetFields();
              })
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person_outline,
                  size: 120.0, color: Colors.purple.shade800),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso (kg)",
                    labelStyle: TextStyle(color: Colors.purple.shade800)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.purple, fontSize: 25.0),
                controller: weightController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura (cm)",
                    labelStyle: TextStyle(color: Colors.purple.shade800)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.purple, fontSize: 25.0),
                controller: heightController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    child: Text("CALCULE",
                        style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontSize: 20.0)),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _calculate();
                      }
                    },
                    color: Colors.purple,
                  ),
                ),
              ),
              Text(_infoText,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.purple, fontSize: 20.0))
            ],
          ),
        ),
      ),
    );
  }
}
