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
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        labelText: texthint,
        hintText: texthint,
      ),
    );
  }
}
