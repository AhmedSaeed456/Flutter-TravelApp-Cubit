import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelmaster/cubit/app_cubit.dart';
import 'package:travelmaster/pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) {
        if (state is WelcomeState) {
          print("hi");

          return Center(child: CircularProgressIndicator());
        }
        if (state is LoadingState) {
          print(state);
          return Center(child: CircularProgressIndicator());
        } else {
          return Container();
        }
      },
    );
  }
}
