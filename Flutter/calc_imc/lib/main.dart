import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent.shade700,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: () {})
          // Parte que vi, depois testar se posso reutilizar
          // Padding(
          //   padding: EdgeInsets.only(right: 20.0),
          //   child: GestureDetector(
          //     onTap: () {},
          //     child: Icon(
          //       Icons.refresh,
          //       size: 26.0,
          //     ),
          //   ),
          // )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.person_outline,
                size: 120.0, color: Colors.purple.shade800),
            TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso (kg)",
                    labelStyle: TextStyle(color: Colors.purple.shade800)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.purple, fontSize: 25.0)),
            TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura (cm)",
                    labelStyle: TextStyle(color: Colors.purple.shade800)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.purple, fontSize: 25.0)),
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
                  onPressed: () {},
                  color: Colors.purple,
                ),
              ),
            ),
            Text("Info",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.purple, fontSize: 20.0))
          ],
        ),
      ),
    );
  }
}
