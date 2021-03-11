import 'package:converso_moedas/src/coin_changed.dart';
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
                Coin_Changed.instance.dolar =
                    snapshot.data["results"]["currencies"]["USD"]["buy"];
                Coin_Changed.instance.euro =
                    snapshot.data["results"]["currencies"]["EUR"]["buy"];
                Coin_Changed.instance.ars =
                    snapshot.data["results"]["currencies"]["ARS"]["buy"];

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
                                "Real",
                                "R\$",
                                Coin_Changed.instance.realController,
                                Coin_Changed.instance.realChanged)),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: buildTextField(
                                "Dólar",
                                "US\$",
                                Coin_Changed.instance.dolarController,
                                Coin_Changed.instance.dolarChanged)),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: buildTextField(
                                "Euro",
                                "\€",
                                Coin_Changed.instance.euroController,
                                Coin_Changed.instance.euroChanged)),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: buildTextField(
                                "Peso",
                                "ARS\$",
                                Coin_Changed.instance.arsController,
                                Coin_Changed.instance.arsChanged)),
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

// Clean up the controller
void _resetFields() {
  Coin_Changed.instance.realController.text = "";
  Coin_Changed.instance.dolarController.text = "";
  Coin_Changed.instance.euroController.text = "";
  Coin_Changed.instance.arsController.text = "";
}
