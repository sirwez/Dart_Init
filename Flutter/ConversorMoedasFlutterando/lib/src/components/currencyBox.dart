import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: SizedBox(
              height: 56,
              child: DropdownButton(
                  underline: Container(
                    height: 1,
                    color: Colors.amber,
                  ),
                  isExpanded: true,
                  items: [
                    DropdownMenuItem(child: Text("Real")),
                    DropdownMenuItem(child: Text("Dólar")),
                    DropdownMenuItem(child: Text("Euro")),
                  ],
                  onChanged: (value) {}),
            )),
        SizedBox(
          width: 30,
        ),
        Expanded(
          flex: 2,
          child: TextField(
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber))),
          ),
        ),
      ],
    );
  }
}
