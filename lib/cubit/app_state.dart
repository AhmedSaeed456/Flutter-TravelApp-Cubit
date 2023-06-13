part of 'app_cubit.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppInitial extends AppState {
  @override
  List<Object> get props => [];
}

class WelcomeState extends AppState {
  @override
  List<Object> get props => [];
}

class LoadingState extends AppState {
  @override
  List<Object> get props => [];
}

class LoadedState extends AppState {
  LoadedState(this.places);
  final List<DataModel> places;

  @override
  List<Object> get props => [places];
}

class DetailsState extends AppState {
  DetailsState(this.place);
  final DataModel place;

  @override
  List<Object> get props => [place];
}
