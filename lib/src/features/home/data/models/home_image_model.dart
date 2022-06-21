// ignore_for_file: overridden_fields

import 'package:coco_mobile_explorer/src/features/home/domain/entities/home_image_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_image_model.g.dart';

@JsonSerializable()
class HomeImageModel extends HomeImageEntity {
  const HomeImageModel({
    required int id,
    required this.cocoUrl,
    required this.flickrUrl,
  }) : super(
          id: id,
          cocoUrl: cocoUrl,
          flickrUrl: flickrUrl,
        );

  @override
  @JsonKey(name: 'coco_url')
  final String cocoUrl;

  @override
  @JsonKey(name: 'flickr_url')
  final String flickrUrl;

  Map<String, dynamic> toJson() => _$HomeImageModelToJson(this);

   static List<HomeImageModel> fromJson(List data) {
    final List<HomeImageModel> result = data
        .map(
          (e) => HomeImageModel(
            id: e['id'],
            cocoUrl: e['coco_url'],
            flickrUrl: e['flickr_url'],
          ),
        )
        .toList();
    return result;
  }

// factory HomeImageModel.fromJson(Map<String, dynamic> json) =>
//     _$HomeImageModelFromJson(json);
}
