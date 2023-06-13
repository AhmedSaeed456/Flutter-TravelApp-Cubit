import 'package:flutter/material.dart';
import 'package:travelmaster/misc/colors.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({super.key, this.width, this.isResponsive});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.mainColor),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset("assets/images/arrow.png"),
      ]),
    );
  }
}
