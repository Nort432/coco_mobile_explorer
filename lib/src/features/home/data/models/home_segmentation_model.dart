import 'dart:convert';

import 'package:coco_mobile_explorer/src/features/home/domain/entities/home_segmentation_entity.dart';

class HomeSegmentationModel extends HomeSegmentationEntity {
  const HomeSegmentationModel({
    required int imageId,
    required int categoryId,
    required List<num> points,
  }) : super(imageId: imageId, categoryId: categoryId, points: points);

  factory HomeSegmentationModel.fromJson(Map<String, dynamic> mapJson) {
    return HomeSegmentationModel(
      imageId: mapJson['image_id'],
      categoryId: mapJson['category_id'],
      points: json.decode(mapJson['segmentation'] ?? "[[]]") is List
          ? List<num>.from(
              (json.decode(mapJson['segmentation'] ?? "[[]]") as List<dynamic>)
                  .first,
            )
          : List<num>.from(
              json.decode(mapJson['segmentation'] ?? "{counts: []}")['counts'],
            ),
    );
  }
}
