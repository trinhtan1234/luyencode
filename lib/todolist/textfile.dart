import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String texthint;
  final String labelText;

  const AppTextField({
    super.key,
    required this.texthint,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
        borderSide: const BorderSide(width: 0.5, color: Colors.grey),
        borderRadius: BorderRadius.circular(30));

    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        constraints: const BoxConstraints(maxHeight: 44),
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        disabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        labelText: texthint,
        hintText: texthint,
      ),
    );
  }
}
