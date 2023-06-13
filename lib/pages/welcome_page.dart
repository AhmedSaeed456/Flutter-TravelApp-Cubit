// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelmaster/misc/colors.dart';
import 'package:travelmaster/widgets/app_text.dart';
import 'package:travelmaster/widgets/app_text_large.dart';
import 'package:travelmaster/widgets/responsive_button.dart';

import '../cubit/app_cubit.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List imgs = [
    "assets/images/image3.jpg",
    "assets/images/image4.jpg",
    "assets/images/image5.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 3,
      itemBuilder: (_, index) {
        return Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imgs[index]),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(top: 150, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextLarge(text: "Trip"),
                    AppText(
                      text: "Travelling",
                      size: 30.0,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      child: AppText(
                        text:
                            "mountain hikes give u an incredible experience and blsdfklj sdflkre dflkdfg",
                        color: AppColors.textColor2,
                        size: 14,
                      ),
                    ),
                    SizedBox(height: 40),
                    GestureDetector(
                        onTap: () {
                          BlocProvider.of<AppCubit>(context).getData();
                        },
                        child: Container(
                            width: 200, child: ResponsiveButton(width: 120))),
                  ],
                ),
                Column(
                  children: List.generate(3, (indexDots) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 5),
                      width: 8,
                      height: index == indexDots ? 30 : 8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index == indexDots
                              ? AppColors.mainColor
                              : AppColors.textColor2.withOpacity(0.5)),
                    );
                  }),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
