// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  String text;
  final Color color;
  final double size;
  AppText({
    Key? key,
    required this.text,
    this.color = Colors.black54,
    this.size = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size),
    );
  }
}
