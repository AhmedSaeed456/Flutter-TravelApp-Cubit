// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final double size;
  final Color borderColor;
  final Color foreColor;
  final Color backColor;
  final bool isIcon;
  final Icon icon;
  final String txt;

  const AppButton(
      {Key? key,
      required this.size,
      required this.borderColor,
      required this.foreColor,
      required this.backColor,
      this.isIcon = false,
      this.icon = const Icon(Icons.favorite_outline),
      this.txt = "hi"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backColor,
        border: Border.all(width: 1, color: borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: isIcon
          ? Center(
              child: icon,
            )
          : Center(
              child: Text(txt,
                  style: TextStyle(
                      color: foreColor, fontWeight: FontWeight.bold))),
    );
  }
}
