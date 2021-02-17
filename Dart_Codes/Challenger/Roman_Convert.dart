//Author: Weslley de Aquino Ferreira
//GITHUB: github.com/sirwez

/*

Conversion rules:
1 -The letter I is used only before V and X, for example: IV = 4; IX = 9.
2 -The letter X is used only before L and C, for example: XL = 40; XC = 90
3 -The letter C is used only before D and M, for example, CD = 400; CM = 900
4 -The letters I, X, C and M are grouped only followed three times, for example: III = 3; XXX = 30.
5 -To represent numbers greater than 4000, a dash above the letters is used, which means multiplying the number by a thousand, for example, Roman Numbers.
6 -Equal letters add up the values, for example: II = 2; XX = 20.
7 -Two different letters with the smallest before the largest, subtract their values, for example: IV = 4; IX = 9.
8 -Two different letters with the largest one before the smallest one, their values ​​are added, for example: VI = 6; XI = 11.
9 -If there is a smaller one between any two letters, its value will belong to the letter following it, for example: XIX = 19; LIV = 54.


Problems:

Code does not comply with rule 4, because if you put a value like "IIII", the result would be 4, I intend to fix this problem in the future.

*/

import 'dart:io';

void romanToDecimal(String num) {
  const Map<String, int> Roman = {
    //map with roman values ​​and their respective decimals.
    'M': 1000,
    // 'CM': 900,
    'D': 500,
    //  'CD': 400,
    'C': 100,
    // 'XC': 90,
    'L': 50,
    //  'XL': 40,
    'X': 10,
    // 'IX': 9,
    'V': 5,
    // 'IV': 4,
    'I': 1
  };
  List<String> separeted = new List();
  int result = 0; //result of transformation
  for (String part in num.split('')) {
    //separates the input values ​​to be compared later.
    separeted.add(part);
  }

  print(separeted);
  var last =
      0; //check the last value read to compare with the current one and know if I should subtract.
  var resultLess = 0;
  separeted.forEach((romano) {
    Roman.forEach((k, v) {
      //'K' Roman value, 'V' decimal value
      if (romano == k) {
        if (last == 0) {
          //if last == 0, then it is in the first interaction, so I assign the value directly.
          result = v;
        } else if (last < v) {
          //if last is less than v, it means that we have a case like "CM", "XC" and etc ... so we have to subtract the values (rules: 1,2,3 and 9)
          resultLess += v - last;
          result -= last;
        } else if (last == v) {
          //if last == v then we have rule 6
          result += v;
        } else {
          result += v;
        }
        last = v; //
      }
    });
  });
  result += resultLess;
  print(result);
}

void main() {
  print("Enter the Roman number:");
  String roman = stdin.readLineSync().toUpperCase();
  romanToDecimal(roman);
}
