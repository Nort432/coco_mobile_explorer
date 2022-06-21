import 'package:coco_mobile_explorer/src/features/home/data/models/home_segmentation_model.dart';

import '../../domain/entities/coco_search_result_entity.dart';
import 'coco_image_model.dart';

class CocoSearchResultModel extends CocoSearchResultEntity {
  const CocoSearchResultModel({
    required List<CocoImageModel> images,
    required int total,
  }) : super(images: images, total: total);

  factory CocoSearchResultModel.fromJson(
    List<dynamic> imagesJson,
    List<dynamic> segmentationJson,
    List<dynamic> captionsJson, {
    int total = 5,
  }) {
    List<CocoImageModel> parsedImages = [];

    for (final image in imagesJson) {
      final segmentations = segmentationJson
          .where((element) => element['image_id'] == image['id'])
          .map((e) => HomeSegmentationModel.fromJson(e))
          .toList();

      final captions = captionsJson
          .where((element) => element['image_id'] == image['id'])
          .map((e) => e['caption'].toString())
          .toList();

      parsedImages.add(CocoImageModel.fromJson(image, segmentations, captions));
    }

    return CocoSearchResultModel(
      images: parsedImages,
      total: total,
    );
  }

  @override
  List<Object?> get props => [images];
}
