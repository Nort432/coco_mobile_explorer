import 'package:coco_mobile_explorer/src/features/home/domain/entities/home_ids_entity.dart';

class HomeIdsModel extends HomeIdsEntity {
  const HomeIdsModel(List<int> ids) : super(ids);

   factory HomeIdsModel.fromJson(List data) {
     List<int> intIds = List<int>.from(data.map((e) => e));
    return HomeIdsModel(intIds);
  }
}