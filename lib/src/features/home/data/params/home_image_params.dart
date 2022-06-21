import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_image_params.g.dart';

@JsonSerializable()
class HomeImageParams extends Equatable {
  const HomeImageParams({required this.imageIds, required this.queryType});

  @JsonKey(name: 'image_ids')
  final List<int> imageIds;

  @JsonKey(name: 'querytype')
  final String queryType;

  @override
  List<Object?> get props => [imageIds, queryType];

  Map<String, dynamic> toJson() => _$HomeImageParamsToJson(this);
}
