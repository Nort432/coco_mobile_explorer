import 'package:coco_mobile_explorer/src/core/states/data_state.dart';
import 'package:coco_mobile_explorer/src/core/usecases/use_case.dart';
import 'package:coco_mobile_explorer/src/features/home/data/params/home_category_params.dart';
import 'package:coco_mobile_explorer/src/features/home/domain/entities/coco_search_result_entity.dart';
import 'package:coco_mobile_explorer/src/features/home/domain/entities/home_temp_entity.dart';
import 'package:coco_mobile_explorer/src/features/home/domain/repo/home_repo.dart';

class SearchCocoCase extends UseCase<DataState<HomeTempEntity>, String> {
  SearchCocoCase(this.repository);

  final HomeRepo repository;

  @override
  Future<DataState<HomeTempEntity>> call(String params) async {
    return await repository.searchCocoExplorer(params);
  }
}
