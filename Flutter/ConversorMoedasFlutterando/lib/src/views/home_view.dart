import 'package:ConversorMoedasFlutterando/src/components/currencyBox.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 20.0),
        child: Column(
          children: [
            Image.asset(
              "assets/images/coin.png",
              width: 150,
              height: 150,
            ),
            CurrencyBox(),
            SizedBox(
              height: 10,
            ),
            CurrencyBox(),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
              color: Colors.amber.shade700,
              child: Text("CONVERTER"),
              onPressed: () {},
            )
          ],
        ),
      ),
    ));
  }
}
