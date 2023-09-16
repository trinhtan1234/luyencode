// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:luyencode/todolist/textfile.dart';

class ScreenTodo extends StatelessWidget {
  const ScreenTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AppTextField(
          texthint: 'Xin chao',
          labelText: 'Xin chao',
        ),
      ),
    );
  }
}
