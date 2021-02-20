import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Contador de Pessoas",
    home: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Pessoas: 0",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        Text("Pode entrar pcr!!",
            style: TextStyle(
                color: Colors.pink[900],
                fontStyle: FontStyle.italic,
                fontSize: 20.0))
      ],
    ),
  ));
}
