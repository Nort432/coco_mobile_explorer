
import 'package:coco_mobile_explorer/src/features/home/data/models/home_segmentation_model.dart';

import '../../domain/entities/coco_image_entity.dart';

class CocoImageModel extends CocoImageEntity {
  const CocoImageModel({
    required int id,
    required String cocoUrl,
    required String flickrUrl,
    required List<String> captions,
    required List<HomeSegmentationModel> segmentations,
  }) : super(
          id: id,
          cocoUrl: cocoUrl,
          flickrUrl: flickrUrl,
          captions: captions,
          segmentations: segmentations,
        );

  factory CocoImageModel.fromJson(
    Map<String, dynamic> imagesJson,
    List<HomeSegmentationModel> segmentations,
    List<String> captions,
  ) {
    return CocoImageModel(
      id: imagesJson['id'],
      cocoUrl: imagesJson['coco_url'],
      flickrUrl: imagesJson['flickr_url'],
      captions: captions,
      segmentations: segmentations,
    );
  }
}

