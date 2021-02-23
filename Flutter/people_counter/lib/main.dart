import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "People Counter",
      home: Stack(
        children: <Widget>[
          Image.asset(
            "images/restaurant.jpg",
            fit: BoxFit.cover,
            height: 1000.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("People: 0",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: FlatButton(
                          child: Text("+1",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 20.0)),
                          onPressed: () {},
                        )),
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: FlatButton(
                          child: Text("-1",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 20.0)),
                          onPressed: () {},
                        ))
                  ]),
              Text("You can enter pcr !!",
                  style: TextStyle(
                      color: Colors.pink[900],
                      fontStyle: FontStyle.italic,
                      fontSize: 20.0))
            ],
          ),
        ],
      )));
}
