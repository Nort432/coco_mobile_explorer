// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_image_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeImageParams _$HomeImageParamsFromJson(Map<String, dynamic> json) =>
    HomeImageParams(
      imageIds:
          (json['image_ids'] as List<dynamic>).map((e) => e as int).toList(),
      queryType: json['querytype'] as String,
    );

Map<String, dynamic> _$HomeImageParamsToJson(HomeImageParams instance) =>
    <String, dynamic>{
      'image_ids': instance.imageIds,
      'querytype': instance.queryType,
    };
