import 'dart:io';

Map getROT13() {
  //list alphabet
  const List<String> ALPHABET = const [
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z"
  ];
  const int CHANGE = 13; //number rotation
  Map<String, String> code = {};

  for (var i = 0; i < ALPHABET.length; i++) {
    //encrypt word
    if (i < CHANGE) {
      code[ALPHABET[i]] = ALPHABET[i + CHANGE];
      code[ALPHABET[i].toUpperCase()] = ALPHABET[i + CHANGE].toUpperCase();
    } else {
      code[ALPHABET[i]] = ALPHABET[i - CHANGE];
      code[ALPHABET[i].toUpperCase()] = ALPHABET[i - CHANGE].toUpperCase();
    }
  }
  return code;
}

void main() {
  Map<String, String> secretCode = getROT13();
  print("enter the word:");
  String original = stdin.readLineSync();
  String changed = "";

  for (String character in original.split('')) {
    //split the word
    if (secretCode.containsKey(character)) {
      changed += secretCode[character];
    } else {
      changed += character;
    }
  }
  print(changed);
}
