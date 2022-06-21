part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoading extends HomeState {
  const HomeLoading() : super();

  @override
  List<Object> get props => [];
}

class HomeLoaded extends HomeState {
  const HomeLoaded(this.homeTemp) : super();

  final HomeTempEntity homeTemp;

  @override
  List<Object> get props => [homeTemp];
}

class HomeError extends HomeState {
  const HomeError(this.errorMessage) : super();

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
