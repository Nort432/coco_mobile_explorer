// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeImageModel _$HomeImageModelFromJson(Map<String, dynamic> json) =>
    HomeImageModel(
      id: json['id'] as int,
      cocoUrl: json['coco_url'] as String,
      flickrUrl: json['flickr_url'] as String,
    );

Map<String, dynamic> _$HomeImageModelToJson(HomeImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'coco_url': instance.cocoUrl,
      'flickr_url': instance.flickrUrl,
    };
