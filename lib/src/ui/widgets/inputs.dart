import 'package:flutter/material.dart';

Widget inputWidget(String hintText, IconData icon, TextInputType keyboardType,
    void Function(String)? onChanged, String? initialValue) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(
          icon,
          color: Colors.redAccent,
        ),
      ),
      keyboardType: keyboardType,
      onChanged: onChanged,
    ),
  );
}
