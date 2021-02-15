//Author: Weslley de Aquino Ferreira
//GITHUB: github.com/sirwez

/*

Regras de conversão:

1 - A letra I é utilizada somente antes do V e do X, por exemplo: IV = 4; IX = 9.
2 - A letra X é utilizada somente antes do L e do C, por exemplo: XL = 40; XC = 90
3 - A letra C é utilizada somente antes do D e do M, por exemplo, CD = 400; CM = 900


4 - As letras I, X, C e M são agrupadas somente seguidas por três vezes, por exemplo: III = 3; XXX = 30.
5 - Para representar números maiores que 4000 usa-se um traço acima das letras, o que significa a multiplicação do número por mil, por exemplo, Números Romanos.

6 - Letras iguais somam-se os valores, por exemplo: II = 2; XX = 20.
7 - Duas letras diferentes com o menor antes do maior, subtraem-se os seus valores, por exemplo: IV = 4; IX = 9.
8 - Duas letras diferentes com o maior antes do menor, somam-se os seus valores, por exemplo: VI = 6; XI = 11.
9 - Se entre duas letras quaisquer existe outra menor, o valor desta pertencerá a letra seguinte a ela, por exemplo: XIX = 19; LIV = 54.

*/

import 'dart:io';

void romanToDecimal(String num) {
  const Map<String, int> Roman = {
    'I': 1,
    'V': 5,
    'X': 10,
    'L': 50,
    'C': 100,
    'D': 500,
    'M': 1000
  };
  Set<String> separeted = new Set();
  int result = 0;
  for (String part in num.split('')) {
    separeted.add(part);
  }
  separeted.forEach((romano) {
    Roman.forEach((k, v) {
      if (romano == k) {
        if (result == 0) {
          result = v;
        } else {
          if (v > result) {
            if (romano == "V" || romano == "X") {
              result = v - result;
            } else if (romano == "L" || romano == "C") {
              result = v - result;
            } else if (romano == "D" || romano == "M") {
              result = v - result;
            }
          }
        }
        print(result);
      }
    });
  });
  print(result);
}

void main() {
  print("Digite o número romano:");
  String roman = stdin.readLineSync().toUpperCase();
  romanToDecimal(roman);
}
