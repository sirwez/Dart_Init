import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "People Counter",
    home: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("People: 0",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                      child: Text("-1",
                          style: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontSize: 20.0)),
                      onPressed: () {}),
                  FlatButton(
                      child: Text("+1",
                          style: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontSize: 20.0)),
                      onPressed: () {}),
                ])),
        Text("You can enter pcr !!",
            style: TextStyle(
                color: Colors.pink[900],
                fontStyle: FontStyle.italic,
                fontSize: 20.0))
      ],
    ),
  ));
}
