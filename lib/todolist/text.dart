// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextCumstom extends StatelessWidget {
  final String text;
  final TextStyle style;

  const TextCumstom(
      {Key? key,
      required this.text,
      this.style = const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      required int textSizeText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var textAligin = TextAlign.left;
    // var textOverflow = TextOverflow.clip;
    // var maxLine = 3;
    // var color = Colors.green;

    return Text(
      text,
      style: style,
    );
  }
}
