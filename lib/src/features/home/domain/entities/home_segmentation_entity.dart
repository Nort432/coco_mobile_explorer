import 'package:equatable/equatable.dart';

class HomeSegmentationEntity extends Equatable {
  const HomeSegmentationEntity({
    required this.imageId,
    required this.categoryId,
    required this.points,
  });

  final int imageId;
  final int categoryId;
  final List<num> points;

  @override
  List<Object?> get props => [
        imageId,
        categoryId,
        points,
      ];
}
