import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_category_params.g.dart';

@JsonSerializable()
class HomeCategoryParams extends Equatable {
  const HomeCategoryParams({required this.categoryIds, required this.queryType});

  @JsonKey(name: 'category_ids')
  final List<int> categoryIds;

  @JsonKey(name: 'querytype')
  final String queryType;

  @override
  List<Object?> get props => [categoryIds, queryType];

  Map<String, dynamic> toJson() => _$HomeCategoryParamsToJson(this);
}
