import 'package:equatable/equatable.dart';

class HomeIdsEntity extends Equatable {
  const HomeIdsEntity(this.ids);

  final List<int> ids;

  @override
  List<Object> get props => [ids];
}