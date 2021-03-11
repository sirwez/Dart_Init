import 'package:flutter/widgets.dart';

class Coin_Changed extends ChangeNotifier {
  //SingleTon
  static Coin_Changed instance = Coin_Changed();
  //Controllers
  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();
  final arsController = TextEditingController();
  //Moedas
  double dolar;
  double euro;
  double ars;

  void realChanged(String valor) {
    double real = double.parse(valor);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
    arsController.text = (real / ars).toStringAsFixed(2);
  }

  void dolarChanged(String valor) {
    double dolar = double.parse(valor);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
    arsController.text = (dolar * this.dolar / ars).toStringAsFixed(2);
  }

  void euroChanged(String valor) {
    double euro = double.parse(valor);
    instance.realController.text = (euro * this.euro).toStringAsFixed(2);
    instance.dolarController.text =
        (euro * this.euro / dolar).toStringAsFixed(2);
    instance.arsController.text = (euro * this.euro / ars).toStringAsFixed(2);
  }

  void arsChanged(String valor) {
    double ars = double.parse(valor);
    instance.realController.text = (ars * this.ars).toStringAsFixed(2);
    dolarController.text = (ars * this.ars / dolar).toStringAsFixed(2);
    euroController.text = (ars * this.ars / euro).toStringAsFixed(2);
  }
}
