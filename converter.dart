import 'dart:io';

void main() {
  print("A - Converter F para C\nB - Converter C para F\n");
  String select;
  do{
    select = stdin.readLineSync();
} while(select !="A" && select !="B");
  print("Digite  a temperatura:");
  String tmp = stdin.readLineSync();
  int temp = int.parse(tmp);
  switch (select) {
    case 'A':
      print("$temp em Celsius é: ${(temp - 32) / 1.8}");
      break;
    case 'B':
      print("$temp em Fahrenheit é: ${temp * 1.8 + 32}");
      break;
    default:
  }
}
