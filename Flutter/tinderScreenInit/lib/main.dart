import 'package:flutter/material.dart';
import 'package:tinderScreenInit/src/MainScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tinder UI",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red, scaffoldBackgroundColor: Colors.white),
      home: mainScreen(),
    );
  }
}
