import 'package:equatable/equatable.dart';

import 'coco_image_entity.dart';

abstract class CocoSearchResultEntity extends Equatable {
  const CocoSearchResultEntity({
    required this.images,
    required this.total,
  });

  final List<CocoImageEntity> images;
  final int total;
}
