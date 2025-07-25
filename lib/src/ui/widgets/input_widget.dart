import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String hintText;
  final IconData? iconData;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  final String? initialValue;
  final void Function()? onTap;
  final bool enabled;
  final TextEditingController? controller;

  const InputWidget({
    super.key,
    required this.hintText,
    required this.iconData,
    this.keyboardType = TextInputType.name,
    this.onChanged,
    this.initialValue,
    this.onTap,
    this.enabled = true,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: onTap,
        child: TextFormField(
          controller: controller,
          enabled: enabled,
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
      ),
    );
  }
}
