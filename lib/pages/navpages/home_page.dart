// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelmaster/misc/colors.dart';
import 'package:travelmaster/widgets/app_text.dart';
import 'package:travelmaster/widgets/app_text_large.dart';

import '../../cubit/app_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var imgs = {
    "assets/images/image2.jpg": "green",
    "assets/images/image3.jpg": "white",
    "assets/images/image4.jpg": "blue",
    "assets/images/image5.jpg": "pink",
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            if (state is LoadedState) {
              var info = state.places;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.menu),
                        Container(
                          width: 40,
                          height: 40,
                          margin: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.mainColor.withOpacity(0.7),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: AppTextLarge(
                      text: "Discover",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                          labelPadding: EdgeInsets.only(left: 20, right: 20),
                          labelColor: AppColors.mainColor,
                          unselectedLabelColor:
                              AppColors.textColor2.withOpacity(0.5),
                          isScrollable: true,
                          controller: _tabController,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.mainColor,
                          ),
                          indicatorWeight: 0,
                          indicatorPadding: EdgeInsets.only(bottom: 30),
                          tabs: [
                            Tab(
                              text: "Places",
                            ),
                            Tab(
                              text: "Inspiration",
                            ),
                            Tab(
                              text: "Emotions",
                            ),
                          ]),
                    ),
                  ),
                  Container(
                    height: 300,
                    width: double.maxFinite,
                    child: TabBarView(controller: _tabController, children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: ListView.builder(
                          itemCount: info.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                BlocProvider.of<AppCubit>(context)
                                    .detailPage(info[index]);
                              },
                              child: Container(
                                  margin: EdgeInsets.only(right: 15, top: 10),
                                  width: 200,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          "http://mark.bslmeiyu.com/uploads/" +
                                              info[index].img,
                                        ),
                                        fit: BoxFit.cover),
                                  )),
                            );
                          },
                        ),
                      ),
                      Text("ther"),
                      Text("bye"),
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppTextLarge(
                          text: "Explore more",
                          size: 25,
                        ),
                        AppText(
                          text: "see all",
                          color: AppColors.mainColor,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 120,
                    margin: EdgeInsets.only(left: 20),
                    width: double.maxFinite,
                    child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 20, top: 10),
                          child: Column(
                            children: [
                              Container(
                                // margin: EdgeInsets.only(right: 15, top: 10),
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: AssetImage(
                                        imgs.keys.elementAt(index),
                                      ),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Container(
                                child:
                                    AppText(text: imgs.values.elementAt(index)),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

// class CircleTabIndecator extends Decoration {
//   @override
//   BoxPainter createBoxPainter([VoidCallback? onChanged]) {
//     throw UnimplementedError();
//   }
// }
