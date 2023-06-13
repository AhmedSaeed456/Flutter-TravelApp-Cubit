import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/data_model.dart';
import '../services/data_services.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required this.data}) : super(AppInitial()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();

      emit(LoadedState(places));
    } catch (e) {}
  }

  detailPage(DataModel data) {
    emit(DetailsState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
