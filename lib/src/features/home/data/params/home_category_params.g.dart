// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_category_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeCategoryParams _$HomeCategoryParamsFromJson(Map<String, dynamic> json) =>
    HomeCategoryParams(
      categoryIds:
          (json['category_ids'] as List<dynamic>).map((e) => e as int).toList(),
      queryType: json['querytype'] as String,
    );

Map<String, dynamic> _$HomeCategoryParamsToJson(HomeCategoryParams instance) =>
    <String, dynamic>{
      'category_ids': instance.categoryIds,
      'querytype': instance.queryType,
    };
