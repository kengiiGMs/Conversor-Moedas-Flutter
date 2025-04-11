import 'package:flutter/material.dart';

Widget TextfieldCustom(String label, String prefix) {
  return TextField(
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.amber),
      border: OutlineInputBorder(),
      prefixText: prefix,
      prefixStyle: TextStyle(color: Colors.amber)
    ),
    style: TextStyle(color: Colors.amber, fontSize: 25),
    keyboardType: TextInputType.number,
  );
}
