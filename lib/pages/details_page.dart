import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelmaster/misc/colors.dart';
import 'package:travelmaster/widgets/app_buttons.dart';
import 'package:travelmaster/widgets/app_text.dart';
import 'package:travelmaster/widgets/app_text_large.dart';

import '../cubit/app_cubit.dart';
import '../widgets/responsive_button.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      DetailsState detail = state as DetailsState;
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("http://mark.bslmeiyu.com/uploads/" +
                          detail.place.img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 50,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubit>(context).goHome();
                        },
                        icon: Icon(Icons.arrow_back))
                  ],
                ),
              ),
              Positioned(
                top: 250,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  // width: double.maxFinite,
                  height: MediaQuery.of(context).size.height,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: 25, right: 25, top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppTextLarge(
                              text: detail.place.name,
                              color: Colors.black.withOpacity(0.8),
                            ),
                            AppTextLarge(
                                text: detail.place.price.toString() + "\$",
                                color: AppColors.mainColor,
                                size: 30)
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: AppColors.mainColor,
                            ),
                            SizedBox(width: 10),
                            Text(detail.place.location,
                                style: TextStyle(color: AppColors.textColor2)),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                5,
                                (index) {
                                  return Icon(
                                    Icons.star,
                                    color: index < detail.place.stars
                                        ? AppColors.startColor
                                        : AppColors.textColor2,
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            AppText(
                                text: detail.place.stars.toString() + ".0",
                                color: AppColors.textColor2),
                          ],
                        ),
                        SizedBox(height: 20),
                        AppTextLarge(
                          text: "people",
                          color: Colors.black.withOpacity(0.8),
                        ),
                        SizedBox(height: 5),
                        AppText(
                            text: "people in the same group",
                            color: AppColors.textColor2),
                        SizedBox(height: 20),
                        Wrap(
                          children: List.generate(5, (index) {
                            return InkWell(
                              onTap: () {
                                print("hi");
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: AppButton(
                                  size: 50.0,
                                  backColor: selectedIndex == index
                                      ? Colors.black87
                                      : Colors.black12,
                                  foreColor: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black87,
                                  borderColor: AppColors.buttonBackground,
                                  txt: (index + 1).toString(),
                                ),
                              ),
                            );
                          }),
                        ),
                        SizedBox(height: 20),
                        AppTextLarge(
                          text: "Description",
                          color: Colors.black.withOpacity(0.8),
                          size: 20,
                        ),
                        SizedBox(height: 10),
                        AppText(
                            text: detail.place.description,
                            color: AppColors.textColor2),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 25,
                right: 20,
                child: Row(children: [
                  AppButton(
                    size: 60,
                    foreColor: AppColors.textColor1,
                    backColor: Colors.white,
                    borderColor: AppColors.textColor1,
                    isIcon: true,
                    // icon:Icon(Icons.),
                  ),
                  SizedBox(width: 10),
                  ResponsiveButton(isResponsive: true, width: 220),
                ]),
              )
            ],
          ),
        ),
      );
      ;
    });
  }
}
