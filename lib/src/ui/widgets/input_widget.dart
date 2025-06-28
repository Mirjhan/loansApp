import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String hintText;
  final IconData? iconData;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  final String? initialValue;

  const InputWidget({
    super.key,
    required this.hintText,
    required this.iconData,
    this.keyboardType = TextInputType.name,
    required this.onChanged,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        initialValue: initialValue,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(
            iconData,
            color: Colors.redAccent,
          ),
        ),
        keyboardType: keyboardType,
        onChanged: onChanged,
      ),
    );
  }
}
