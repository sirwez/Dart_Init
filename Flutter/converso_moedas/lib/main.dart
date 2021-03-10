import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const request = "https://api.hgbrasil.com/finance?format=json&key=fd933c73";
void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Conversor de Moedas",
    home: Home(),
  ));
}

Future<Map> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double dolar;
  double euro;
  double ars;
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();
  final arsController = TextEditingController();

  void _resetFields() {
    // Clean up the controller
    realController.text = "";
    dolarController.text = "";
    euroController.text = "";
    arsController.text = "";
  }

  void _realChanged(String valor) {
    double real = double.parse(valor);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
    arsController.text = (real / ars).toStringAsFixed(2);
  }

  void _dolarChanged(String valor) {
    double dolar = double.parse(valor);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
    arsController.text = (dolar * this.dolar / ars).toStringAsFixed(2);
  }

  void _euroChanged(String valor) {
    double euro = double.parse(valor);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
    arsController.text = (euro * this.euro / ars).toStringAsFixed(2);
  }

  void _arsChanged(String valor) {
    double ars = double.parse(valor);
    realController.text = (ars * this.ars).toStringAsFixed(2);
    dolarController.text = (ars * this.ars / dolar).toStringAsFixed(2);
    euroController.text = (ars * this.ars / euro).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Conversor de Moedas"),
        centerTitle: true,
        backgroundColor: Colors.amber[800],
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _resetFields();
              })
        ],
      ),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Text(
                  "Carregando dados...",
                  style: TextStyle(color: Colors.amber, fontSize: 25.0),
                  textAlign: TextAlign.center,
                ),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Erro ao Carregar os dados...",
                    style: TextStyle(color: Colors.amber, fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                dolar = snapshot.data["results"]["currencies"]["USD"]["buy"];
                euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];
                ars = snapshot.data["results"]["currencies"]["ARS"]["buy"];
                return SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Image.asset('images/coin.png',
                            height: 150.0, width: 150.0),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: buildTextField(
                                "Real", "R\$", realController, _realChanged)),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: buildTextField("Dólar", "US\$",
                                dolarController, _dolarChanged)),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: buildTextField(
                                "Euro", "\€", euroController, _euroChanged)),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: buildTextField(
                                "Peso", "ARS\$", arsController, _arsChanged)),
                      ],
                    ));
              }
          }
        },
      ),
    );
  }
}

Widget buildTextField(String moeda, String prefix,
    TextEditingController controll, Function changed) {
  return TextField(
    controller: controll,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
        labelText: moeda,
        labelStyle: TextStyle(fontSize: 25.0, color: Colors.amber),
        border: OutlineInputBorder(),
        prefixText: prefix),
    onChanged: changed,
  );
}
