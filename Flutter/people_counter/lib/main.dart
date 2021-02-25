import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "People Counter", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _people = 0;
  var _inforText = "Entre ai!!!";
  void changePeople(int count) {
    setState(() {
      _people += count;
    });
    if (_people <= 0) {
      _inforText = "VAZIO";
    } else if (_people <= 10) {
      _inforText = "Entre ai!!!";
    } else {
      _inforText = "LOTADO!!!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("People: $_people",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("+1",
                        style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontSize: 20.0)),
                    onPressed: () {
                      changePeople(1);
                    },
                  )),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("-1",
                        style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.normal,
                            fontSize: 20.0)),
                    onPressed: () {
                      changePeople(-1);
                    },
                  ))
            ]),
            Text(_inforText,
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 45.0))
          ],
        ),
      ],
    );
  }
}
