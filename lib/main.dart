import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelmaster/cubit/app_cubit.dart';
import 'package:travelmaster/cubit/app_cubit_logics.dart';
import 'package:travelmaster/pages/details_page.dart';
import 'package:travelmaster/pages/navpages/home_page.dart';
import 'package:travelmaster/pages/navpages/mainPage.dart';
import 'package:travelmaster/pages/welcome_page.dart';
import 'package:travelmaster/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BlocProvider<AppCubit>(
          create: (context) => AppCubit(
            data: DataServices(),
          ),
          child: BlocBuilder<AppCubit, AppState>(builder: (context, state) {
            if (state is WelcomeState) {
              print(state);
              return WelcomePage();
            }
            if (state is DetailsState) {
              print(state);
              return DetailsPage();
            }
            if (state is LoadedState) {
              print(state);
              return MainPage();
            }
            if (state is LoadingState) {
              print(state);
              return Center(child: CircularProgressIndicator());
            } else {
              return Container();
            }
          }),
        ),
      ),
    );
  }
}
