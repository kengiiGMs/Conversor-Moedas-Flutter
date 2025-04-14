import 'package:flutter/material.dart';

Widget TextfieldCustom(
  String label,
  String prefix,
  TextEditingController controller,
  ValueChanged<String> function,
) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.amber),
      border: OutlineInputBorder(),
      prefixText: prefix,
      prefixStyle: TextStyle(color: Colors.amber),
    ),
    style: TextStyle(color: Colors.amber, fontSize: 25),
    onChanged: function,
    keyboardType: TextInputType.number,
  );
}
