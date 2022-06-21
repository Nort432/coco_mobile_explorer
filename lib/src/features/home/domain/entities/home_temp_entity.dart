import 'dart:core';

import 'package:coco_mobile_explorer/src/features/home/data/models/home_ids_model.dart';
import 'package:coco_mobile_explorer/src/features/home/domain/entities/home_image_entity.dart';
import 'package:coco_mobile_explorer/src/features/home/domain/entities/home_segmentation_entity.dart';

class HomeTempEntity {
  const HomeTempEntity({
    // this.ids,
    this.images,
    // this.segmentations,
  });

  // final HomeIdsModel? ids;
  // final List<HomeImageEntity>? images;
  // final List<HomeSegmentationEntity>? segmentations;

  final List<HomeResultImageEntity>? images;
}

class HomeResultImageEntity {
  const HomeResultImageEntity({
    required this.id,
    required this.url,
    required this.points,

  });

  final int id;
  final String url;
  final List<HomeSegmentationEntity> points;
}