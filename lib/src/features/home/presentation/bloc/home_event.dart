part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeInitEvent extends HomeEvent {
  const HomeInitEvent();

  @override
  List<Object> get props => [];
}

class HomeSearchEvent extends HomeEvent {
  const HomeSearchEvent(this.search);

  final String search;

  @override
  List<Object> get props => [search];
}